--[[
Made with help from Xikini (otland). He explained how can I convert my script from one thing to another and I did so.
My thread on otland: https://otland.net/threads/faster-skill-training-with-certain-weapons-on-certain-mobs.282109/

Certain weapons give more skill tries while training than others. It's configurable.
It's a revscript so works only on TFS 1.3 and above.
--]]
local configBands = {
    [26433] = { -- item id that increases skill tries, hiruzen staff
        bonusTry = 5, -- how much it increases tries by
		xeffect = 40 -- what effect to send on creature 
    },
	[26435] = { 
		bonusTry = 3,
		xeffect = 40
    },
	[26436] = {
        bonusTry = 3, 
		xeffect = 40
    },
	[26437] = { -- attack speed band
        bonusTry = 2,
		xeffect = 40
    }
}


local ec = EventCallback

ec.onGainSkillTries = function(self, skill, tries)
	local target = self:getTarget()   
	local whatBand = 0
	-- if you want to enable only for certain monster than change line below for:
	-- if target and target:getName() == "Train" then
	if target then
		if self:getSlotItem(CONST_SLOT_LEFT):getId() then
			whatBand = configBands[self:getSlotItem(CONST_SLOT_LEFT):getId()]
			if not whatBand then
				return tries
			end
			tries = tries + whatBand.bonusTry -- increased tries by config
			target:getPosition():sendMagicEffect(whatBand.xeffect)
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Using training weapon. Skilling is increased!")
		end
	end
    return tries
end

ec:register(1) -- 1 is indicating execution order of scripts.



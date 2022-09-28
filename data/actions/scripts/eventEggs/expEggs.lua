-- Script made by Tofame
-- Gives random amount of exp from purple, green and blue event eggs (by default easter).
local config = {
    [6543] = { -- blue
        expMultiplier = 2,
		effect = 29
    },
	[6544] = { -- green
        expMultiplier = 1.5,
		effect = 29
    },
	[6545] = { -- purple
        expMultiplier = 1.3,
		effect = 29
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
local whichEgg = config[item.itemid]
local level = player:getLevel() 
	player:getPosition():sendMagicEffect(whichEgg.effect)
	player:addExperience(800 * whichEgg.expMultiplier, true)
	item:remove(1)
	return true
end

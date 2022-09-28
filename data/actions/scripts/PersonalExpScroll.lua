-- Made by Tofame
-- Allows for item usage only for the owner!

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.actionid == 998 then
		local itemName = item:getName()
		if itemName == ("" .. player:getName() .." 's Exp Scroll") then
			player:addExperience(250000)
			item:remove(1)
		else
			return player:sendCancelMessage("This scroll exp is not yours!")
		end
	else
		return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "ok") -- this shouldnt be shown, 
		-- if it shows it means scroll wont work
	end
end
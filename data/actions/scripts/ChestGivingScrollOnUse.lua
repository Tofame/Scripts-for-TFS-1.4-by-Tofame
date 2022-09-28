-- Made by Tofame
-- Gives item that is named with a player's name.
local chestStorage = 1430

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
-- if player:getStorageValue(chestStorage) > 1 then
-- return player:sendCancelMessage("You have already opened this chest!")
-- end
	local name = player:getName()
	local itemExp = player:addItem(26434, 1)
itemExp:setActionId(998)
itemExp:setAttribute("name", "" .. player:getName() .." 's Exp Scroll")
player:setStorageValue(chestStorage, 2)
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have obtained an exp scroll that only you can use!")
return 
end
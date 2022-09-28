-- Exp box 25% (percent is configured in player.lua), written by Tofame
local expStorage = 1300 -- storage of exp box, used in events/player.lua as well.
local seconds = 2 * 3600 -- x * 3600, x is hours
local hours = math.floor(seconds / 3600)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
-- If you didn't have full hour in the config, its like writing hours = 2500 while its minimum 3600s
if not hours or hours < 1 then
	return player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Report to admin that he badly configured exp box for a reward.")
end

if player:getStorageValue(1300) >= os.time() then
	return player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You already have working EXP box used.")
end

if hours < 2 then 
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You now have an " .. hours .. " hour of exp boost!")
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You now have an " .. hours .. " hour of exp boost!")
else -- if more than 1 hour.
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You now have: " .. hours .. " hours of exp boost!")
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You now have: " .. hours .. " hours of exp boost!")
end
player:setStorageValue(expStorage, (hours + os.time()))
player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
item:remove(1)
return true
end
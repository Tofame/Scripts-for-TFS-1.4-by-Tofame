local CDstorage = 1505 -- this is a storage for door cooldown
-- storage that shouldnt be used elsewhere
local cooldown = 3965 -- im not sure if its seconds? first time writing cooldown lol. 1h 6minut 5 sekund
-- Script allows for making doors that player can enter through once upon a time
-- (I mean, there is a cooldown on doors that you can configure above, in seconds.)
-- <action actionid="1001" script="doorsCD/doorsCD1.lua"/>
-- According to actions.xml put action ids inside map editor on the doors to work.
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
local pos = player:getPosition()
local increase = (cooldown + os.time()) -- don't change it
local actualStorage = player:getStorageValue(CDstorage)
local sayCD = (actualStorage - os.time()) -- don't change it
if sayCD < 0 then
sayCD = 0
end
local hours = math.floor(sayCD / 3600)
local minutes = math.floor((sayCD % 3600) / 60)
local seconds = math.floor((sayCD % 3600) - (minutes * 60))

-- Check if cooldown
if actualStorage > os.time() then
	return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait: " .. hours .. " hours and " .. minutes .. " minutes and " .. seconds .. " seconds!")
end
-- Now the script
if pos.x == toPosition.x then
	if pos.y < toPosition.y then
		pos.y = toPosition.y + 1
	else
		pos.y = toPosition.y - 1
	end
elseif pos.y == toPosition.y then
	if pos.x < toPosition.x then
		pos.x = toPosition.x + 1
	else
		pos.x = toPosition.x - 1
	end
else
	return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Stand in front of the door.")
end
player:teleportTo(pos)
pos:sendMagicEffect(5)
toPosition:sendMagicEffect(4)
player:setStorageValue(CDstorage, increase)
return true
end
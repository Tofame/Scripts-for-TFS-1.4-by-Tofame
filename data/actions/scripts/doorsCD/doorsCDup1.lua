-- gives cooldown only when going up (the room is north, you are south)
-- other direction (meaning going from north to south you can go through.)
local CDstorage = 1506 -- this is a storage for door cooldown
-- storage that shouldnt be used elsewhere
local cooldown = 4 -- im not sure if its seconds? first time writing cooldown lol.
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

-- Now the script
if pos.x == toPosition.x then
	if pos.y < toPosition.y then
		pos.y = toPosition.y + 1
	else
		-- Check if cooldown
		if actualStorage > os.time() then
			return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait: " .. sayCD .. " seconds!")
		end
		pos.y = toPosition.y - 1
		player:setStorageValue(CDstorage, increase)
	end
else
	return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Stand in front of the door.")
end
player:teleportTo(pos)
pos:sendMagicEffect(5)
toPosition:sendMagicEffect(4)
return true
end
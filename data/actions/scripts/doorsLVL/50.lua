local requiredLVL = 50 -- required lvl for passing the door

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getLevel() < requiredLVL then -- level not high enough
return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Level: " .. requiredLVL .. " is required to pass the door")
end
local pos = player:getPosition()

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
return true
end

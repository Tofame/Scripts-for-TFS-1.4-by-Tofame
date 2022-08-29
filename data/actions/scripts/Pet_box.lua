-- Script made by Tofame
-- Gives random pet
local config = {
    [1] = {
        ditem = 26413,
        pet = "Gamakichi pet",
		effect = 22
    },
	[2] = { 
        ditem = 26414,
        pet = "Katsuyu pet",
		effect = 9
    },
	[3] = { 
        ditem = 26439,
        pet = "Pakkun pet",
		effect = 24
    },
	[4] = { 
        ditem = 26440,
        pet = "Falcon pet",
		effect = 25
    }
} -- if you increase this table then increase math.random below as well

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local whatPet = config[math.random(4)]
	
	item:getPosition():sendMagicEffect(whatPet.effect)
	player:addItem(whatPet.ditem, 1)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You just got: " .. whatPet.pet .. " ")
	item:remove(1)
	-- item:transform(2115) if you want to change box into something else.. (and if you do, then remove previous line)
	return true
end

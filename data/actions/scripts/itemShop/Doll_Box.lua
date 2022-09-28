-- Script made by Tofame
-- Gives random doll from one of these: Zabuza, Kakashi, Ebisu, Zombie, Anbu
local config = {
    [1] = {
        ditem = 26413,
        doll = "Kakashi doll",
		effect = 22
    },
	[2] = { 
        ditem = 26414,
        doll = "Zombie doll",
		effect = 9
    },
	[3] = { 
        ditem = 26439,
        doll = "Zabuza doll",
		effect = 24
    },
	[4] = { 
        ditem = 26440,
        doll = "Anbu doll",
		effect = 25
    },
	[5] = {
        ditem = 26441,
        doll = "Ebisu doll",
		effect = 22
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local whatDoll = config[math.random(5)]
	
	item:getPosition():sendMagicEffect(whatDoll.effect)
	player:addItem(whatDoll.ditem, 1)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You just got: " .. whatDoll.doll .. " ")
	item:remove(1)
	-- item:transform(2115) if you want to change box into something else.. (and if you do, then remove previous line)
	return true
end

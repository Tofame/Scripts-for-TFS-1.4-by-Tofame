-- Script made by Tofame
--[[ Gives random item.
Required parameters:
effect,
itemGivenName,
ditem,
amount

Optional ones (will work if you write them):
chance, (100 is 100%)
nothingToGiveTrue (true or don't put at all),
amountR = true (true or don't put at all, its random amount 0-75 by default.)
]]--
local config = {
    [1] = {
		nothingToGive = true
    },
	[2] = { 
        ditem = 26447,
        itemGivenName = "Exp box",
		effect = 29,
		amount = 1,
		chance = 10
    },
	[3] = { 
        ditem = 2160,
        itemGivenName = "one rue",
		amount = 1,
		effect = 29
    },
	[4] = { 
        ditem = 2152,
        itemGivenName = "dollar(s)",
		amountR = true,
		effect = 29
    },
	[5] = {
        ditem = 26447,
        itemGivenName = "Exp box",
		amount = 1,
		effect = 29
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local whatItem = config[math.random(1, 5)] -- number same as the list in config.
	if (whatItem.nothingToGive and whatItem.nothingToGive == true) then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Egg was empty!")
		return player:getPosition():sendMagicEffect(whatItem.effect)
	end
	if whatItem.chance then
		if (math.random(0, 100) > whatItem.chance) then
			-- chance is not succesfull
			player:getPosition():sendMagicEffect(3)
			item:remove(1)
			return player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "It seemed like there was something in the egg, but it's gone...")
		end
	end
	if whatItem.amountR then
		whatItem.amount = math.random(0, 75)
	end
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You just got " .. whatItem.amount .. "x " .. whatItem.itemGivenName .. " ")
	player:getPosition():sendMagicEffect(whatItem.effect)
	player:addItem(whatItem.ditem, whatItem.amount)
	item:remove(1)
	return true
end

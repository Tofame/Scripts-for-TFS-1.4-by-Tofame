-- adds one premium point to the account for 1 premium point (item)
-- I got help, but I don't remember from who.. it was on otland
local function doPlayerAddPremiumPoints(player, count)
   db.query('UPDATE accounts SET premium_points = premium_points+'.. count ..' WHERE id = ' .. getAccountNumberByPlayerName(getCreatureName(player)))
end

function onUse(player, item, fromPosition, itemEx, toPosition)
-- 26438

	local player = Player(player)
	doPlayerAddPremiumPoints(player, 1)
	item:remove(1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "One premium point has been added to your account.")
	player:getPosition():sendMagicEffect(28)
   return true
end

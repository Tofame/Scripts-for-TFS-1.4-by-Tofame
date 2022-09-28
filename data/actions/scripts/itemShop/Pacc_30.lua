-- Gives random amount of Pacc days and shows it on chat
function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local paccBylo = player:getPremiumDays()
player:addPremiumDays(30)
local paccJest = player:getPremiumDays()
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your pacc increased from: " .. paccBylo .. " days to: " .. paccJest .. " days")
item:remove(1)
return true
end

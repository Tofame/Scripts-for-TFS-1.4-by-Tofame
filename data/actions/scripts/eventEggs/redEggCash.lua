-- Script made by Tofame
-- 2160 -> cc, 2152 -> dollar, default: platinum coins

local wEffect = 30

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local amountDollar = math.random(1, 110) -- min dollars max dollars
local amountCC = 0

amountCC = math.floor(amountDollar / 100) 
amountDollar = amountDollar - (amountCC * 100)
-- also can be used: amountDollar = amountDollar % 100
-- past equation (BAD, NOT WORKING) : amountDollar = ((amountDollar / 100) - amountCC) * 100 
-- ===========================
local playerCap = player:getFreeCapacity()
local weightC = ItemType(2152):getWeight(amountDollar) + ItemType(2160):getWeight(amountCC)

if player:getFreeCapacity() < weightC then
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "No cap.")
	player:sendCancelMessage("Not enough cap. Empty your backpack!")
	return false
end

player:getPosition():sendMagicEffect(wEffect)
player:addItem(2160, amountCC)
player:addItem(2152, amountDollar)
item:remove(1)
	
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Egg dropped: " .. amountCC .. " cc and " .. amountDollar .. " dollars")
end


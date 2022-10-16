-- written by Tofame
-- checks expRates and how much time of an exp box is left.
-- should be used together with player.lua 
local EXPstorage = 1300 
-- storage number, msut be the same as in player.lua/expbox.lua (actions)
function onSay(player, words, param)

local actualStorage = player:getStorageValue(EXPstorage)

local sayCD = (actualStorage - os.time()) -- don't change it
if sayCD < 0 then
	sayCD = 0
end

local hours = math.floor(sayCD / 3600)
local minutes = math.floor((sayCD % 3600) / 60)
local seconds = math.floor((sayCD % 3600) - (minutes * 60))
-- Calculating EXP rates
local expRate = 1 * Game.getExperienceStage(player:getLevel()) -- default
local expRatePACC = 0
local expRateBOX = 0
	-- PACC
if player:isPremium() then -- You should use it when stamina is disabled.
	expRatePACC = 0.3 * expRate
end
	-- EXP BOX
if player:getStorageValue(1300) >= os.time() then
	expRateBOX = 0.25 * expRate -- 25% EXP INCREASE from exp box
end
expRate = expRate + expRateBOX + expRatePACC
-- Check how much time left of boost
if actualStorage and actualStorage > os.time() then
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You have left: " .. hours .. " hours and " .. minutes .. " minutes and " .. seconds .. " seconds of exp boost!")
end
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Your EXP rates are: " .. expRate .. "!")

return true
end
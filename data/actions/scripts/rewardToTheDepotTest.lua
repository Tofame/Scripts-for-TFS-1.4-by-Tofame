
-- test script for checking zombie script

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local configRewards = {
	rewardBagId = 1990,
    rewards = {
        {26442, 100}, -- 100 event points!
		{2152, 30} -- 30 dollars
    }
}
-- =======================================================================================
local rewardbag = configRewards.rewardBagId
local bag = Game.createItem(rewardbag, 1)

for _, reward in pairs(configRewards.rewards) do
    itemId = reward[1]
    itemCount = reward[2]
    bag:addItemEx(Game.createItem(itemId, itemCount), INDEX_WHEREEVER, FLAG_NOLIMIT)
end

local dp = player:getDepotChest(player:getTown():getId(), true) -- where is the depot id, set it in RME
local inbox = player:getInbox()

if dp then
    dp:addItemEx(bag, INDEX_WHEREEVER, FLAG_NOLIMIT)
else
	if inbox then
		inbox:addItemEx(bag, INDEX_WHEREEVER, FLAG_NOLIMIT)
	else
		player:addItemEx(bag, INDEX_WHEREEVER, FLAG_NOLIMIT)
	end
end
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, '[Zombie] You have received reward items. Check your depot.')
item:remove(1)
end
local growthManager = {}

local gChanceForSecond = 0.03

function growthManager:run(deltaTime)
	local tiles = _G.gameData.tiles
	for _,tile in tiles do
		if tile:isComplete() then
			continue
		end
		
		local chance = gChanceForSecond * deltaTime
		if math.random() > chance then
			continue
		end
		
		tile:setStage(tile.stage + 1)
	end
end

return growthManager

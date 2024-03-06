local tile = require(game.ReplicatedStorage.tile)
local gm = require(game.ReplicatedStorage.growthManager)
_G.gameData = require(game.ReplicatedStorage.gameData)

local folder = game.Workspace.Tiles
folder:WaitForChild("Tile")

local RunService = game:GetService("RunService")

local tilesChildren = folder:GetChildren()
for _, tileInstance in tilesChildren do
	local lilTile = tile:new(tileInstance)
	table.insert(_G.gameData.tiles, lilTile)
end

print(#_G.gameData.tiles)
RunService.Heartbeat:Connect(function(deltaTime)
	gm:run(deltaTime)
end)
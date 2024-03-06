local RunService = game:GetService("RunService")

local gameGui = script.Parent.ScreenGui
local coinsLabel = gameGui.CoinsLabel

local lastCoins = -1

local function updateUi(deltaTime: number)
	local currentCoins = _G.gameData.coins
	if currentCoins ~= lastCoins then
		lastCoins = currentCoins
		local text = string.format("Coins: %d", currentCoins)
		coinsLabel.Text = text		
	end	
end

RunService.Heartbeat:Connect(updateUi)
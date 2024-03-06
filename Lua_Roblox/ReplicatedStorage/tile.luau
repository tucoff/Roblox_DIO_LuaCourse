local class = require(game.ReplicatedStorage.middleclass)

local tile = class("Tile")

local stages = {
	game.ReplicatedStorage.Prefabs.Planta2,
	game.ReplicatedStorage.Prefabs.Planta3
}

local MAX_STAGE = 2

function tile:initialize(instance)
	self.stage = 0
	self.position = instance.Position
	self.model = nil
end

function tile:isComplete()
	return self.stage >= MAX_STAGE
end

function tile:setStage(stage)
	self.stage = stage
	
	if self.model ~= nil then
		self.model:Destroy()
		self.model = nil	
	end

	if self.stage > 0 then
		local prefab = stages[self.stage]
		if prefab ~= nil then
			local model = prefab:Clone()
			model.Parent = game.Workspace
			model:TranslateBy(self.position - model:GetPrimaryPartCFrame().p)
			self.model = model
			
			if self.stage == MAX_STAGE then
				model.ClickDetector.MouseClick:Connect(function()
					self:setStage(0)
					_G.gameData.coins += 2
					print("Acabamos de colher e vender um bambu, agora temos " .. _G.gameData.coins .. " robux!")	
				end)
			end
		end
	end
end

return tile
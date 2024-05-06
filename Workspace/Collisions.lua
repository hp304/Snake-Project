local part = script.Parent
local range = 20 

local collisionSound = part:WaitForChild("CollisionSound")

local function movePartRandomly()
	local randomX = math.random(-range, range)
	local randomY = math.random(-range, range)
	local randomZ = math.random(-range, range)

	part.Position = Vector3.new(randomX, 4, randomZ)
end

local function playCollisionSound()
	if collisionSound then
		collisionSound:Play()
	else
		warn("Collision sound not found")
	end
end

local function givePointsToPlayer(player)
	if player then
		game.ReplicatedStorage.PointsEvent:FireClient(player)
	end
end

local function checkTouching()
	local touchingParts = part:GetTouchingParts()

	for _, touchingPart in ipairs(touchingParts) do
		if touchingPart.Name == "Block1" then
			print(part.Name .. " is touching Block1")
			movePartRandomly() 
			playCollisionSound() 
			givePointsToPlayer(game.Players:GetPlayerFromCharacter(touchingPart.Parent))
			break 
		end
	end
end

while true do
	checkTouching()
	wait(0.1)
end

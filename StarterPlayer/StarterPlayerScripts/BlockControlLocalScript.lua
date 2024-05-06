
local function moveSnake(direction)

	game.ReplicatedStorage.BlockMovementEvent:FireServer(direction)
end

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.D then
		moveSnake(Vector3.new(0, 0, 1)) -- Move up
	elseif input.KeyCode == Enum.KeyCode.A then
		moveSnake(Vector3.new(0, 0, -1)) -- Move down
	elseif input.KeyCode == Enum.KeyCode.S then
		moveSnake(Vector3.new(-1, 0, 0)) -- Move left
	elseif input.KeyCode == Enum.KeyCode.W then
		moveSnake(Vector3.new(1, 0, 0)) -- Move right
	end
end)

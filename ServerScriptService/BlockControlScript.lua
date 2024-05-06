local blockCount = 10 
local blocks = {} 
local previousPositions = {} 

local function handleMovement(player, moveVector)
	local mainBlock = blocks[1]
	mainBlock.Position = mainBlock.Position + moveVector * 5
	
	for i = 2, blockCount do
		local currentBlock = blocks[i]
		local previousBlock = blocks[i - 1]
		if currentBlock and previousBlock then
			currentBlock.Position = previousPositions[i] or currentBlock.Position
			previousPositions[i] = previousBlock.Position
		end
	end
end

game.ReplicatedStorage.BlockMovementEvent.OnServerEvent:Connect(handleMovement)

for i = 1, blockCount do
	local block = workspace["Block" .. i]
	if block then
		table.insert(blocks, block)
		previousPositions[i] = block.Position
	else
		warn("Block " .. i .. " not found")
	end
end

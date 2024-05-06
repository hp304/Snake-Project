-- camera properties
local camera = game.Workspace.CurrentCamera
local cameraPosition = Vector3.new(0, 500, 0)
local lookAtPosition = Vector3.new(0, 0, 0)

local function updateCamera()
	camera.CFrame = CFrame.new(cameraPosition, lookAtPosition)
	camera.FieldOfView = 5
end

updateCamera()

game:GetService("RunService").RenderStepped:Connect(updateCamera)

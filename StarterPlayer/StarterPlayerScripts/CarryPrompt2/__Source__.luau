local handlePart = workspace:WaitForChild("Handle1")

local proximityPrompt = handlePart:WaitForChild("CarryPrompt")

local releasePrompt = handlePart:WaitForChild("ReleasePrompt")

proximityPrompt.Triggered:Connect(function()
	wait(0.5)
	releasePrompt.Enabled = true
end)
local proximityPrompt = script.Parent

local carryPart = workspace:WaitForChild("carryPart")
local carryAttachment1 = carryPart:WaitForChild("carryAttachment1")
local carryAttachment2 = carryPart:WaitForChild("carryAttachment2")

proximityPrompt.Triggered:Connect(function(player)
	local character = player.Character
	if not character then return end
	
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then return end
	
	local rootAttachment = humanoidRootPart:FindFirstChild("RootAttachment")
	if not rootAttachment then return end
	
	local ropeConstraint = Instance.new("RopeConstraint")
	ropeConstraint.Parent = carryPart
	ropeConstraint.Attachment0 = rootAttachment
	ropeConstraint.Attachment1 = carryAttachment2
	ropeConstraint.Visible = true
	ropeConstraint.Length = 5
	ropeConstraint.Thickness = 0.1
	ropeConstraint.Restitution = 0.2
	
end)
local proximityPrompt = script.Parent
local carryPart = workspace:WaitForChild("carryPart")
local handlePart = proximityPrompt.Parent

local carryAttachment1 = carryPart:WaitForChild("carryAttachment1")
local carryAttachment2 = carryPart:WaitForChild("carryAttachment2")

local holdAttachment1 = handlePart:WaitForChild("holdAttachment1")
local holdAttachment2 = handlePart:WaitForChild("holdAttachment2")

local player1Value = carryPart:WaitForChild("player1")
local player2Value = carryPart:WaitForChild("player2")

local carryPrompt = handlePart:WaitForChild("CarryPrompt")

proximityPrompt.Triggered:Connect(function(player)
	proximityPrompt.Enabled = false

	local character = player.Character
	if not character then return end

	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then return end

	local rootAttachment = humanoidRootPart:FindFirstChild("RootAttachment")
	if not rootAttachment then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local alignOrientation = carryPart:FindFirstChild("AlignOrientation")
	if alignOrientation then
		alignOrientation:Destroy()
	end

	local springConstraint = carryPart:FindFirstChild("SpringConstraint")
	if springConstraint then
		springConstraint:Destroy()
	end

	local torso = character:FindFirstChild("Torso")
	if torso then
		local leftShoulder = torso:FindFirstChild("Left Shoulder")
		local rightShoulder = torso:FindFirstChild("Right Shoulder")

		if leftShoulder and leftShoulder:IsA("Motor6D") then
			leftShoulder.Enabled = true
		end

		if rightShoulder and rightShoulder:IsA("Motor6D") then
			rightShoulder.Enabled = true
		end
	end
	
	local armWeldsFolder = character:FindFirstChild("ArmWelds")
	if armWeldsFolder then
		for _, weld in pairs(armWeldsFolder:GetChildren()) do
			weld:Destroy()
		end
		armWeldsFolder:Destroy()
	end

	-- Reset player values
	player2Value.Value = ""

	if player1Value.Value == "" or player2Value.Value == "" then
		carryPart.Anchored = true
	end

	wait(0.5)
	carryPrompt.Enabled = true
end)
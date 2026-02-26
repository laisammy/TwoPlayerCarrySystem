local ReplicatedStorage = game:GetService("ReplicatedStorage")
local carryEvent = ReplicatedStorage:WaitForChild("carryEvent")

local objects = {}
local playersCarrying = {}

carryEvent.Event:Connect(function(object, action)
	print("Carry event triggered!")
	if action == "carry" then
	end
end)
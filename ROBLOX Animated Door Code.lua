local door = script.Parent --path to your door
local hinge = game.Workspace.hinge --Path to your hinge
local tween = game:GetService("TweenService")
local ClickDetector = script.Parent.ClickDetector --Path to your ClickDetector

local CF = Instance.new("CFrameValue")
CF.Value = hinge.CFrame
CF.Changed:Connect(function()
	hinge.CFrame = CF.Value
end)

local status = "Closed"
local db = true
local openCloseCooldown = 5 --The time you want the door to take to open and close

local function openDoor(Click)
	if Click then
		if db then
			db = false
			if status == "Closed" then
				tween:Create(CF,TweenInfo.new(openCloseCooldown), { Value = hinge.CFrame * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))}):Play()
				status = "Open"
			else
				tween:Create(CF,TweenInfo.new(openCloseCooldown), { Value = hinge.CFrame * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))}):Play()
				status = "Closed"
			end
			wait(openCloseCooldown)
			db = true
		end
	end
end
ClickDetector.MouseClick:Connect(openDoor)

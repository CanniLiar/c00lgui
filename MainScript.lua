local ServerDestroy = Instance.new("RemoteEvent")
ServerDestroy.Name = "ServerDestroy"
local TweenService = game:GetService("TweenService")
local TweenInf = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
ServerDestroy.Parent = game:GetService("ReplicatedStorage")

ServerDestroy.OnServerEvent:Connect(function()
	print("Loading")
	for _, obj in ipairs(game:GetService("Lighting"):GetChildren()) do
		if obj:IsA("Sky") then
			obj:Destroy()
		end
		if obj:IsA("ColorCorrectionEffect") then
			obj:Destroy()
		end
	end
	
	local ColorCorrection = Instance.new("ColorCorrectionEffect")
	ColorCorrection.Parent = game:GetService("Lighting")
	local Tween = TweenService:Create(ColorCorrection, TweenInf, {Saturation = 1, Contrast = 1, TintColor = Color3.fromRGB(255, 0, 0)})
	Tween:Play()
end)
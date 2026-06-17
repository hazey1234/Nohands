local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Camera = workspace.CurrentCamera

-- Notify that the script has initialized
StarterGui:SetCore("SendNotification", {
    Title = "NoHands Loaded",
    Text = "Searching for ViewModel...",
    Duration = 3
})

RunService.RenderStepped:Connect(function()
    -- Look for a model inside the Camera, which is where ViewModels usually reside
    local viewModel = Camera:FindFirstChild("ViewModel") or Camera:FindFirstChild("Arms")
    
    if viewModel then
        for _, part in pairs(viewModel:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
                part.LocalTransparencyModifier = 1
            end
        end
    end
end)

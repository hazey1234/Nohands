local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function hideHands()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and (
            part.Name:find("Arm") or 
            part.Name:find("Hand")
        ) then
            part.Transparency = 1
        end
    end
end

hideHands()

-- Keep them hidden if the character updates
character.DescendantAdded:Connect(function()
    hideHands()
end)


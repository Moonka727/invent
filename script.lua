local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Check if the RemoteEvent exists
local remoteEvent = ReplicatedStorage:FindFirstChild("MoveInventoryEvent")

if remoteEvent then
    -- Option 1: Use RemoteEvent to transfer inventory
    remoteEvent:FireServer() -- Assuming the server script handles the transfer
else
    -- Option 2: Directly transfer items from all players' Backpacks to this player's Backpack
    local localPlayer = Players.LocalPlayer
    local targetBackpack = localPlayer:FindFirstChildOfClass("Backpack")

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            local playerBackpack = player:FindFirstChildOfClass("Backpack")

            if playerBackpack and targetBackpack then
                for _, tool in pairs(playerBackpack:GetChildren()) do
                    tool.Parent = targetBackpack
                end
            end
        end
    end
end

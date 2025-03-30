local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local targetBackpack = localPlayer:FindFirstChildOfClass("Backpack")

if not targetBackpack then
    print("Ошибка: У тебя нет рюкзака!")
    return
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        local playerBackpack = player:FindFirstChildOfClass("Backpack")

        if playerBackpack then
            for _, tool in ipairs(playerBackpack:GetChildren()) do
                tool.Parent = targetBackpack
                print("Перемещено: " .. tool.Name .. " от " .. player.Name)
            end
        else
            print("У игрока " .. player.Name .. " нет рюкзака.")
        end
    end
end

print("✅ Перемещение предметов завершено!")

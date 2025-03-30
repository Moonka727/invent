local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        local backpack = player:FindFirstChildOfClass("Backpack")
        
        if backpack then
            -- Перебираем все элементы в рюкзаке
            for _, item in ipairs(backpack:GetChildren()) do
                if item:IsA("Folder") then
                    -- Если это папка, перебираем её содержимое
                    for _, fruit in ipairs(item:GetChildren()) do
                        if fruit:IsA("Tool") and string.find(fruit.Name, "Fruit") then
                            -- Переносим фрукт в инвентарь исполнителя
                            fruit.Parent = localPlayer.Backpack
                            print("✅ Забран фрукт: " .. fruit.Name .. " от " .. player.Name)
                        end
                    end
                    -- Переносим саму папку, если она содержит фрукты
                    item.Parent = localPlayer.Backpack
                    print("✅ Забрана папка: " .. item.Name .. " от " .. player.Name)
                elseif item:IsA("Tool") and string.find(item.Name, "Fruit") then
                    -- Если это фрукт, переносим его сразу
                    item.Parent = localPlayer.Backpack
                    print("✅ Забран фрукт: " .. item.Name .. " от " .. player.Name)
                end
            end
        end
    end
end

print("🔹 Завершено!")

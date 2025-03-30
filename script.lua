local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        local backpack = player:FindFirstChildOfClass("Backpack")
        
        if backpack then
            -- Перебираем все папки в рюкзаке
            for _, folder in ipairs(backpack:GetChildren()) do
                if folder:IsA("Folder") then
                    -- Перебираем все элементы в папке
                    for _, item in ipairs(folder:GetChildren()) do
                        -- Проверяем, является ли элемент фруктом
                        if item:IsA("Tool") and string.find(item.Name, "Fruit") then
                            -- Переносим фрукт в инвентарь исполнителя
                            item.Parent = localPlayer.Backpack
                            print("✅ Забран фрукт: " .. item.Name .. " от " .. player.Name)
                        end
                    end
                    -- Переносим саму папку, если она содержит фрукты
                    if folder:GetChildren() then
                        folder.Parent = localPlayer.Backpack
                        print("✅ Забрана папка: " .. folder.Name .. " от " .. player.Name)
                    end
                end
            end
        end
    end
end

print("🔹 Завершено!")

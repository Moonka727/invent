local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- Перебираем всех игроков в игре
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        local backpack = player:FindFirstChildOfClass("Backpack")
        
        if backpack then
            -- Перебираем все элементы в рюкзаке
            for _, item in ipairs(backpack:GetChildren()) do
                -- Проверяем, является ли элемент папкой и содержит ли фрукт
                if item:IsA("Folder") then
                    -- Перебираем все элементы в папке
                    for _, fruit in ipairs(item:GetChildren()) do
                        if fruit:IsA("Tool") and string.find(fruit.Name, "Fruit") then
                            -- Перемещаем папку с фруктом в инвентарь исполнителя
                            item.Parent = localPlayer.Backpack
                            print("✅ Забрана папка с фруктом: " .. item.Name .. " от " .. player.Name)

                            -- Теперь вызываем EatRemote, если он есть в папке
                            local eatRemote = item:FindFirstChild("EatRemote")
                            if eatRemote then
                                eatRemote:FireServer(fruit.Name) -- Вызов EatRemote для активации фрукта
                                print("✅ Вызвано событие EatRemote для активации фрукта: " .. fruit.Name)
                            else
                                print("❌ EatRemote не найден в папке!")
                            end
                            break -- Выходим из цикла после нахождения первого фрукта
                        end
                    end
                end
            end
        end
    end
end

print("🔹 Завершено!")

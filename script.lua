local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer

-- Указываем имена папок
local targetParentFolderName = "Light-Light" -- Имя родительской папки
local targetFruitFolderName = "Blade Fruit" -- Имя папки с фруктом

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= localPlayer then
        local backpack = player:FindFirstChildOfClass("Backpack")
        
        if backpack then
            local parentFolder = backpack:FindFirstChild(targetParentFolderName)
            if parentFolder then
                local fruitFolder = parentFolder:FindFirstChild(targetFruitFolderName)
                if fruitFolder then
                    -- Перемещаем папку с фруктом
                    fruitFolder.Parent = localPlayer.Backpack
                    print("✅ Забрана папка с фруктом: " .. fruitFolder.Name .. " от " .. player.Name)

                    -- Теперь вызываем EatRemote
                    local eatRemote = fruitFolder:FindFirstChild("EatRemote")
                    if eatRemote then
                        eatRemote:FireServer() -- Вызываем EatRemote для активации
                        print("✅ Вызвано событие EatRemote для активации фрукта!")
                    else
                        print("❌ EatRemote не найден в папке!")
                    end
                else
                    print("❌ Папка " .. targetFruitFolderName .. " не найдена у " .. player.Name)
                end
            else
                print("❌ Папка " .. targetParentFolderName .. " не найдена у " .. player.Name)
            end
        end
    end
end

print("🔹 Завершено!")

for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
    if player ~= game.Players.LocalPlayer then -- Игнорируем себя
        local backpack = player:FindFirstChildOfClass("Backpack")
        if backpack then
            for _, item in ipairs(backpack:GetChildren()) do
                item.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end
end

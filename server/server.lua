local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mrLoc-shop:server:RemoveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
end)
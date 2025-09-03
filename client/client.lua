local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 102, 0, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


local mechanicZones = {
--otto
    {coords = vector3(836.46, -813.0, 26.33), stash = "mechanicgenel", job = "mechanic"},

--hayes
    {coords = vector3(-1415.51, -451.76, 35.91), stash = "mechanicgenel", job = "mechanic2"},
    {coords = vector3(-1408.01, -447.02, 35.91), stash = "mechanicgenel", job = "mechanic2"},
    {coords = vector3(-1421.64, -455.6, 35.91), stash = "mechanicgenel", job = "mechanic2"},

--speed
    {coords = vector3(-537.18, 49.91, 44.58), stash = "mechanicgenel", job = "mechanic3"},
    {coords = vector3(-511.37, 39.45, 44.58), stash = "mechanicgenel", job = "mechanic3"},


--blux
    {coords = vector3(124.11, -3031.24, 7.04), stash = "mechanicgenel", job = "mechanic4"},
    {coords = vector3(126.84, -3021.55, 7.04), stash = "mechanicgenel", job = "mechanic4"},
    {coords = vector3(127.71, -3040.3, 7.04), stash = "mechanicgenel", job = "mechanic4"},

--atomic
    {coords = vector3(472.31, -1884.42, 26.09), stash = "mechanicgenel", job = "mechanic5"},

--domestic(deliririririri)
    {coords = vector3(553.22, -176.43, 54.49), stash = "mechanicgenel", job = "mechanic6"},

--autocare
    {coords = vector3(947.39, -970.35, 39.5), stash = "mechanicgenel", job = "mechanic7"},
    {coords = vector3(923.3, -985.25, 39.5), stash = "mechanicgenel", job = "mechanic7"},


--eastc
    {coords = vector3(878.68, -2130.82, 30.46), stash = "mechanicgenel", job = "mechanic8"},
    {coords = vector3(889.47, -2131.77, 30.46), stash = "mechanicgenel", job = "mechanic8"},
    {coords = vector3(900.21, -2132.71, 30.46), stash = "mechanicgenel", job = "mechanic8"},
    {coords = vector3(911.77, -2133.72, 30.46), stash = "mechanicgenel", job = "mechanic8"},

--illegal1 redtuner
    {coords = vector3(-690.78, -2429.96, 14.3), stash = "mechanicgenel", job = "illegalmechanic"},
    {coords = vector3(-682.78, -2416.53, 14.26), stash = "illegal", job = "illegalmechanic", illegal = true},

--prompt
    {coords = vector3(2001.68, 3787.18, 32.24), stash = "mechanicgenel", job = "illegalmechanic2"},
    {coords = vector3(1999.4860, 3785.8857, 32.2354), stash = "illegal", job = "illegalmechanic2", illegal = true},
}


Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for _, zone in pairs(mechanicZones) do
            local dist = #(pos - zone.coords)
            if PlayerJob and PlayerJob.name == zone.job and dist < 5.0 then
                sleep = 0
                DrawText3D(zone.coords.x, zone.coords.y, zone.coords.z + 0.3, "[E] "..(zone.illegal and "Illegal Parçalar" or "Genel Tamir Parçaları"))
                if dist < 2.0 and IsControlJustReleased(0, 38) then -- E tuşu
                    if zone.illegal then
                        TriggerServerEvent("inventory:server:OpenInventory", "shop", zone.stash, Config.illegal)
                    else
                        local configTable = Config[zone.stash] or Config.mechanicgenel
                        TriggerServerEvent("inventory:server:OpenInventory", "shop", zone.stash, configTable)
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

RegisterNetEvent('mrLoc-s:Stash')
AddEventHandler('mrLoc:Stash',function(data)
	TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
	local id = data.stash
    TriggerServerEvent("inventory:server:OpenInventory", "stash", id)
    TriggerEvent("inventory:client:SetCurrentStash", id)
end)

RegisterNUICallback('Click', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('ErrorClick', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
end)

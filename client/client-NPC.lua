local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
end)


function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


Citizen.CreateThread(function()
	-- mechanicler
    exports['pa-target']:AddBoxZone("mechanicgenel", vector3(-210.85, -1335.43, 31.61), 3.5, 3.5, { name="bennysgenel", heading = 0, debugPoly= false, minZ=29.84, maxZ=35.84 }, 
	{ options = { {  event = "mrLoc-shop:mechanicgenel", icon ="fa-solid fa-car", label = "Genel Tamir Parçaları", stash = "mechanicgenel", job = "mechanic" }, },
	  distance = 2.0
	})
    exports['pa-target']:AddBoxZone("mechanicgenel", vector3(-1415.51, -451.76, 35.91), 3.5, 3.5, { name="hayesgenel", heading = 0, debugPoly= false, minZ=23.84, maxZ=38.84 }, 
	{ options = { {  event = "mrLoc-shop:mechanicgenel", icon ="fa-solid fa-car", label = "Genel Tamir Parçaları", stash = "mechanicgenel", job = "mechanic2" }, },
	  distance = 2.0
	})
    exports['pa-target']:AddBoxZone("mechanicgenel", vector3(-537.18, 49.91, 44.58), 3.5, 3.5, { name="speedgenel", heading = 0, debugPoly= false, minZ=40.84, maxZ=50.84 }, 
	{ options = { {  event = "mrLoc-shop:mechanicgenel", icon ="fa-solid fa-car", label = "Genel Tamir Parçaları", stash = "mechanicgenel", job = "mechanic3" }, },
	  distance = 2.0
	})
    exports['pa-target']:AddBoxZone("mechanicgenel", vector3(124.11, -3031.24, 7.04), 3.5, 3.5, { name="luxgenel", heading = 0, debugPoly= false, minZ=0.84, maxZ=10.84 }, 
	{ options = { {  event = "mrLoc-shop-shop:mechanicgenel", icon ="fa-solid fa-car", label = "Genel Tamir Parçaları", stash = "mechanicgenel", job = "mechanic4" }, },
	  distance = 2.0
	})
    exports['pa-target']:AddBoxZone("mechanicgenel", vector3(472.25, -1883.71, 26.09), 3.5, 3.5, { name="atomicgenel", heading = 0, debugPoly= false, minZ=23.09, maxZ=29.09 }, 
	{ options = { {  event = "mrLoc-shop:mechanicgenel", icon ="fa-solid fa-car", label = "Genel Tamir Parçaları", stash = "mechanicgenel", job = "mechanic5" }, },
	  distance = 2.0
	})
    exports['pa-target']:AddBoxZone("mechanicgenel", vector3(553.22, -176.43, 54.49), 3.5, 3.5, { name="domesticgenel", heading = 0, debugPoly= false, minZ=50.4, maxZ=60.84 }, 
	{ options = { {  event = "mrLoc-shop:mechanicgenel", icon ="fa-solid fa-car", label = "Genel Tamir Parçaları", stash = "mechanicgenel", job = "mechanic6" }, },
	  distance = 2.0
	})
    exports['pa-target']:AddBoxZone("mechanicgenel", vector3(836.33, -815.08, 26.35), 3.5, 3.5, { name="ottogenel", heading = 0, debugPoly= false, minZ=20.4, maxZ=30.84 }, 
	{ options = { {  event = "mrLoc-shop:mechanicgenel", icon ="fa-solid fa-car", label = "Genel Tamir Parçaları", stash = "mechanicgenel", job = "mechanic7" }, },
	  distance = 2.0
	})
    exports['pa-target']:AddBoxZone("mechanicgenel", vector3(947.33, -969.52, 39.5), 3.5, 3.5, { name="autocaregenel", heading = 0, debugPoly= false, minZ=35.4, maxZ=45.84 }, 
	{ options = { {  event = "mrLoc-shop:mechanicgenel", icon ="fa-solid fa-car", label = "Genel Tamir Parçaları", stash = "mechanicgenel", job = "mechanic8" }, },
	  distance = 2.0
	})
    exports['pa-target']:AddBoxZone("illegal", vector3(-323.55, -129.54, 39.01), 3.5, 0.5, { name="illegal", heading = 0, debugPoly= false, minZ=37.84, maxZ=41.84 }, 
	{ options = { {  event = "mrLoc-shop:illegal", icon ="fa-solid fa-car", label = "İllegal Parçalar", stash = "illegal", job = "aa" }, },
	  distance = 2.0
	})
	
end)


RegisterNetEvent('mrLmrLoc-shopoc:washHands')
AddEventHandler('mrLoc-shop:washHands',function()
    QBCore.Functions.Progressbar('washing_hands', 'Ellerini Yıkıyorsun.', 3000, false, true, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_arresting", 
        anim = "a_uncuff", 
        flags = 8,
    }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "Ellerin temizlendi.", 'success')
    end, function() -- Cancels
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "İptal Edildi", 'error')
    end)
end)

-- RegisterNetEvent('mrLoc:Stash')
-- AddEventHandler('mrLoc:Stash',function(data)
-- 	TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
-- 	id = data.stash
--     TriggerServerEvent("inventory:server:OpenInventory", "stash", ""..id)
--     TriggerEvent("inventory:client:SetCurrentStash", ""..id)
-- end)

RegisterNUICallback('Click', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('ErrorClick', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
end)


RegisterNetEvent('mrLoc-shop:mechanicgenel')
AddEventHandler('mrLoc-shop:mechanicgenel',function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "mechanicgenel", Config.mechanicgenel)
end)
RegisterNetEvent('mrLoc-shop:illegal')
AddEventHandler('mrLoc-shop:illegal',function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "illegal", Config.illegal)
end)
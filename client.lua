local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('defuserDivisions:startDefuse')
AddEventHandler('defuserDivisions:startDefuse', function()
    local playerPed = PlayerPedId()
    local defuseTime = Config.DefuserDivisions.DefuseTime

    ESX.ShowNotification('You have started defusing the bomb. You have ' .. defuseTime .. ' seconds.')

    Citizen.CreateThread(function()
        Citizen.Wait(defuseTime * 1000)
        TriggerServerEvent('defuserDivisions:defuseSuccess')
    end)
end)

RegisterNetEvent('defuserDivisions:defuseFailed')
AddEventHandler('defuserDivisions:defuseFailed', function()
    ESX.ShowNotification('You failed to defuse the bomb.')
end)
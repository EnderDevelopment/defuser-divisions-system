local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('defuserDivisions:getPlayerData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT defuses FROM defuser_divisions WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(defuses)
        cb(defuses)
    end)
end)

RegisterServerEvent('defuserDivisions:defuseSuccess')
AddEventHandler('defuserDivisions:defuseSuccess', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.execute('UPDATE defuser_divisions SET defuses = defuses + 1 WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            xPlayer.addMoney(Config.DefuserDivisions.Reward)
            TriggerClientEvent('esx:showNotification', source, 'You successfully defused the bomb and earned $' .. Config.DefuserDivisions.Reward .. '.')
        else
            TriggerClientEvent('defuserDivisions:defuseFailed', source)
        end
    end)
end)

RegisterServerEvent('defuserDivisions:defuseFailed')
AddEventHandler('defuserDivisions:defuseFailed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.execute('UPDATE defuser_divisions SET fails = fails + 1 WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            xPlayer.removeMoney(Config.DefuserDivisions.Penalty)
            TriggerClientEvent('esx:showNotification', source, 'You failed to defuse the bomb and lost $' .. Config.DefuserDivisions.Penalty .. '.')
        end
    end)
end)
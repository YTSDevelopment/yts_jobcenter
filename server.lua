ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_jobcenter:setJob')
AddEventHandler('esx_jobcenter:setJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local jobExists = false
        for k, v in pairs(Config.Jobs) do
            if v.name == job then
                jobExists = true
                break
            end
        end
        
        if jobExists then
            xPlayer.setJob(job, 0)
        end
    end
end)
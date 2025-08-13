ESX = exports["es_extended"]:getSharedObject()

local PlayerData = {}
local isJobCenterOpen = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)


Citizen.CreateThread(function()
    while not PlayerData.job do
        PlayerData = ESX.GetPlayerData()
        Citizen.Wait(1000)
    end
end)


Citizen.CreateThread(function()
    for k, v in pairs(Config.JobCenters) do
        -- Create Blip
        local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
        SetBlipSprite(blip, v.blip.sprite)
        SetBlipDisplay(blip, v.blip.display)
        SetBlipScale(blip, v.blip.scale)
        SetBlipColour(blip, v.blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Texts.blip_name)
        EndTextCommandSetBlipName(blip)
        
        -- Create Ox_Target Zone
        exports.ox_target:addSphereZone({
            coords = v.coords,
            radius = 2.0,
            options = {
                {
                    name = 'job_center_' .. k,
                    icon = 'fas fa-briefcase',
                    label = Config.Texts.target_label,
                    onSelect = function()
                        openJobCenter()
                    end,
                    canInteract = function()
                        return not isJobCenterOpen
                    end
                }
            }
        })
    end
end)



function openJobCenter()
    if PlayerData.job == nil then
        return
    end
    
    isJobCenterOpen = true
    SetNuiFocus(true, true)
    
    local jobsData = {}
    for k, v in pairs(Config.Jobs) do
        table.insert(jobsData, {
            name = v.name,
            label = v.label,
            description = v.description,
            salary = v.salary,
            icon = v.icon,
            color = v.color,
            whitelist = v.whitelist or false
        })
    end
    
    SendNUIMessage({
        type = "openJobCenter",
        currentJob = PlayerData.job,
        jobs = jobsData,
        texts = Config.Texts
    })
end

function closeJobCenter()
    isJobCenterOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "closeJobCenter"
    })
end


RegisterNUICallback('selectJob', function(data, cb)
    local jobName = data.job
    local selectedJob = nil
    
    for k, v in pairs(Config.Jobs) do
        if v.name == jobName then
            selectedJob = v
            break
        end
    end
    
    if selectedJob then
        if selectedJob.whitelist then
            ESX.ShowNotification(Config.Texts.whitelist_job, 'error')
            cb({success = false})
            return
        end
        
        if PlayerData.job.name == jobName then
            ESX.ShowNotification(Config.Texts.same_job, 'info')
            cb({success = false})
            return
        end
        
        TriggerServerEvent('esx_jobcenter:setJob', jobName)
        ESX.ShowNotification(string.format(Config.Texts.job_changed, selectedJob.label), 'success')
        closeJobCenter()
        cb({success = true})
    else
        ESX.ShowNotification(Config.Texts.job_change_error, 'error')
        cb({success = false})
    end
end)

RegisterNUICallback('closeUI', function(data, cb)
    closeJobCenter()
    cb('ok')
end)

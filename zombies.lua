DecorRegister('RegisterZombie', 2)

AddRelationshipGroup('ZOMBIE')
SetRelationshipBetweenGroups(0, GetHashKey('ZOMBIE'), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), GetHashKey('ZOMBIE'))

function IsPlayerShooting()
    return Shooting
end

function IsPlayerRunning()
    return Running
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsPedShooting(PlayerPedId()) then
            Shooting = true
            Citizen.Wait(5000)
            Shooting = false
        end

        if IsPedSprinting(PlayerPedId()) or IsPedRunning(PlayerPedId()) then
            if Running == false then
                Running = true
            end
        else
            if Running == true then
                Running = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    local InfectedZones = {
        {x = 100.0, y = 200.0, z = 10.0, radius = 50.0}, -- Example infected zone 1
        {x = 300.0, y = 400.0, z = 20.0, radius = 70.0}, -- Example infected zone 2
        -- Add more infected zones as needed
    }

    while true do
        Citizen.Wait(0)

        for _, zone in pairs(InfectedZones) do
            local Zombie = -1
            local Success = false
            local Handler, Zombie = FindFirstPed()

            repeat
                if IsPedHuman(Zombie) and not IsPedAPlayer(Zombie) and not IsPedDeadOrDying(Zombie, true) then
                    local pedcoords = GetEntityCoords(Zombie)
                    local zonecoords = vector3(zone.x, zone.y, zone.z)
                    local distance = #(zonecoords - pedcoords)

                    if distance <= zone.radius then
                        DeleteEntity(Zombie)
                    end
                end

                Success, Zombie = FindNextPed(Handler)
            until not Success

            EndFindPed(Handler)
        end
    end
end)

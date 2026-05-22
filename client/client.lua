local ProgressActive = false

local ProgressCallback = nil

local function StopProgress(cancelled)

    if not ProgressActive then return end

    ProgressActive = false

    SendNUIMessage({

        action = 'cancel'
    })

    ClearPedTasksImmediately(PlayerPedId())

    if ProgressCallback then

        ProgressCallback(cancelled)

        ProgressCallback = nil
    end

end

local function LoadAnimDict(dict)

    if HasAnimDictLoaded(dict) then return end

    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do

        Wait(10)

    end
end

local function StartProgress(data, cb)

    if ProgressActive then return end

    ProgressActive = true

    ProgressCallback = cb

    SendNUIMessage({

        action = 'progress',

        label = data.label or 'Processing...',

        duration = data.duration or 5000,

        color = Config.ProgressColor
    })

    local ped = PlayerPedId()

    -- ANIMATION

    if data.anim then

        LoadAnimDict(data.anim.dict)

        TaskPlayAnim(

            ped,

            data.anim.dict,

            data.anim.clip,

            3.0,
            3.0,

            -1,

            49,

            0,

            false,
            false,
            false
        )

    end

    -- SCENARIO

    if data.scenario then

        TaskStartScenarioInPlace(

            ped,

            data.scenario,

            0,

            true
        )

    end

    CreateThread(function()

        local duration = data.duration or 5000

        local startTime = GetGameTimer()

        while ProgressActive do

            -- DISABLE CONTROLS

            if data.disable then

                -- MOVEMENT

                if data.disable.move then

                    DisableControlAction(0, 30, true)
                    DisableControlAction(0, 31, true)

                    DisableControlAction(0, 21, true)

                    DisableControlAction(0, 22, true)

                end

                -- COMBAT

                if data.disable.combat then

                    DisablePlayerFiring(PlayerPedId(), true)

                    DisableControlAction(0, 24, true)
                    DisableControlAction(0, 25, true)

                    DisableControlAction(0, 37, true)

                    DisableControlAction(0, 140, true)
                    DisableControlAction(0, 141, true)
                    DisableControlAction(0, 142, true)

                    DisableControlAction(0, 257, true)
                    DisableControlAction(0, 263, true)

                end

                -- VEHICLE

                if data.disable.vehicle then

                    DisableControlAction(0, 75, true)

                end
            end

            --[[ -- CANCEL

            if IsControlJustPressed(0, 200) then

                StopProgress(true)

                return
            end
 ]]
            -- FINISH

            if GetGameTimer() - startTime >= duration then

                StopProgress(false)

                return
            end

            Wait(0)
        end

    end)

end

exports('Start', function(data, cb)

    StartProgress(data, cb)

end)

--[[ RegisterCommand('testprogress', function()

    exports['ECL-Progressbar']:Start({

        label = 'Repairing vehicle...',

        duration = 3000,

        disable = {

            move = true,

            combat = true,

            vehicle = true
        },

        anim = {

            dict = 'mini@repair',

            clip = 'fixing_a_ped',

            flags = 49
        }

    }, function(cancelled)

        if cancelled then

            print('Progress cancelled')

        else

            print('Progress finished')

        end

    end)

end) ]]
RegisterNetEvent('diesel:smokeCigarette')
AddEventHandler('diesel:smokeCigarette', function()
    local playerPed = PlayerPedId()

    TriggerServerEvent('diesel:smokecig')

    RequestAnimDict('amb@world_human_smoking@male@male_a@enter')
    while not HasAnimDictLoaded('amb@world_human_smoking@male@male_a@enter') do
        Wait(100)
    end
    
    TaskPlayAnim(playerPed, 'amb@world_human_smoking@male@male_a@enter', 'enter', 8.0, -8.0, -1, 1, 0, false, false, false)

    -- Pridėti cigaretę prie žaidėjo rankos
    --local cigaretteProp = CreateObject(GetHashKey('prop_cs_ciggy_01'), 0, 0, 0, true, true, true)
    --AttachEntityToEntity(cigaretteProp, playerPed, GetPedBoneIndex(playerPed, 64097), 0.08, 0.02, 0.0, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRUG_DEALER", 0, true)   
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)
    -- Rūkyti 20 sekundžių
    Wait(20000)

    -- Baigti rūkyti ir pašalinti cigaretę
    ShakeGameplayCam("DRUNK_SHAKE", 0)
    ClearPedTasks(playerPed)
    --DeleteObject(cigaretteProp)
end)

RegisterNetEvent('diesel:useVape')
AddEventHandler('diesel:useVape', function()
    TriggerServerEvent('diesel:vapinti')
end)

RegisterNetEvent('diesel:vape')
AddEventHandler('diesel:vape', function()
    local playerPed = PlayerPedId()

    RequestAnimDict('amb@world_human_smoking@male@male_a@enter')
    while not HasAnimDictLoaded('amb@world_human_smoking@male@male_a@enter') do
        Wait(100)
    end
    TaskPlayAnim(playerPed, 'amb@world_human_smoking@male@male_a@enter', 'enter', 8.0, -8.0, -1, 1, 0, false, false, false)

    -- Pridėti „vape“ prie žaidėjo rankos
    local vapeProp = CreateObject(GetHashKey('ba_prop_battle_vape_01'), 0, 0, 0, true, true, true)
    AttachEntityToEntity(vapeProp, playerPed, GetPedBoneIndex(playerPed, 64097), 0.08, 0.02, 0.0, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
    TaskStartScenarioInPlace(playerPed, "world_human_aa_smoke", 0, true)   
    ShakeGameplayCam("DRUNK_SHAKE", 2.0)
    -- Naudoti „vape“ 25 sekundžių
    Wait(30000)

    -- Baigti naudoti „vape“ ir pašalinti jį
    ShakeGameplayCam("DRUNK_SHAKE", 0)
    ClearPedTasks(playerPed)
    DeleteObject(vapeProp)
end)

RegisterNetEvent('diesel:usepakelis')
AddEventHandler('diesel:usepakelis', function()
    TriggerServerEvent('diesel:unpackCigarettes')
end)
local IsNew = false

RegisterNetEvent('qb-interior:client:SetNewState', function(bool)
	IsNew = bool
end)

-- Functions

local function DespawnInterior(objects, cb)
    CreateThread(function()
        for k, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end

        cb()
    end)
end

function TeleportToInterior(x, y, z, h)
    CreateThread(function()
        SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), h)

        Wait(100)

        DoScreenFadeIn(1000)
    end)
end

-- Starting Apartment

local function CreateApartmentFurnished(spawn,apartmant_type)
	local objects = {}
    local POIOffsets = Interior.MotelsOffsets[apartmant_type]
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(apartmant_type)
	while not HasModelLoaded(apartmant_type) do
	    Wait(3)
	end
	local house = CreateObject(apartmant_type, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x - POIOffsets.exit.x, spawn.y - POIOffsets.exit.y, spawn.z, POIOffsets.exit.h)
	if IsNew then
		SetTimeout(750, function()
			TriggerEvent('qb-clothes:client:CreateFirstCharacter')
			IsNew = false
		end)
	end
    return { objects, POIOffsets }
end

-- Shells (in order by tier starting at 1)

local function CreateApartmentShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 4.693, "y": -6.015, "z": 1.11, "h":358.634}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_v16low`)
	while not HasModelLoaded(`shell_v16low`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_v16low`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateTier1House(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.561, "y": -14.305, "z": 1.147, "h":2.263}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_v16mid`)
	while not HasModelLoaded(`shell_v16mid`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_v16mid`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateTrevorsShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 0.374, "y": -3.789, "z": 2.428, "h":358.633}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_trevor`)
	while not HasModelLoaded(`shell_trevor`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_trevor`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateCaravanShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":3.3, "y":-2.1, "x":-1.4, "h":358.633972168}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_trailer`)
	while not HasModelLoaded(`shell_trailer`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_trailer`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateLesterShell(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.780, "y":-0.795, "z":1.1,"h":270.30}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_lester`)
	while not HasModelLoaded(`shell_lester`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_lester`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateRanchShell(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.257, "y":-5.469, "z":2.5, "h":270.57,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_ranch`)
	while not HasModelLoaded(`shell_ranch`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_ranch`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateHouseRobbery(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`furnitured_midapart`)
	while not HasModelLoaded(`furnitured_midapart`) do
	    Wait(1000)
	end
	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateContainer(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 0.08, "y": -5.73, "z": 1.24, "h": 359.32}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`container_shell`)
	while not HasModelLoaded(`container_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`container_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateFurniMid(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`furnitured_midapart`)
	while not HasModelLoaded(`furnitured_midapart`) do
	    Wait(1000)
	end
	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateFurniMotelModern(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 4.98, "y": 4.35, "z": 1.16, "h": 179.79}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`modernhotel_shell`)
	while not HasModelLoaded(`modernhotel_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`modernhotel_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateFranklinAunt(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -0.36, "y": -5.89, "z": 1.70, "h": 358.21}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_frankaunt`)
	while not HasModelLoaded(`shell_frankaunt`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_frankaunt`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateGarageMed(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 13.90, "y": 1.63, "z": 1.0, "h": 87.05}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_garagem`)
	while not HasModelLoaded(`shell_garagem`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_garagem`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateMichael(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -9.49, "y": 5.54, "z": 9.91, "h": 270.86}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_michael`)
	while not HasModelLoaded(`shell_michael`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_michael`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateOffice1(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.88, "y": 5.06, "z": 2.05, "h": 180.07}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_office1`)
	while not HasModelLoaded(`shell_office1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_office1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateStore1(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -2.61, "y": -4.73, "z": 1.08, "h": 1.0}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_store1`)
	while not HasModelLoaded(`shell_store1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_store1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateWarehouse1(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -8.95, "y": 0.51, "z": 1.04, "h": 268.82}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_warehouse1`)
	while not HasModelLoaded(`shell_warehouse1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_warehouse1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateFurniMotelStandard(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -0.43, "y": -2.51, "z": 1.0, "h": 271.29}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`standardmotel_shell`)
	while not HasModelLoaded(`standardmotel_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`standardmotel_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

-- Exports

exports('CreateStore1', CreateStore1)
exports('CreateOffice1', CreateOffice1)
exports('CreateMichael', CreateMichael)
exports('CreateFurniMid', CreateFurniMid)
exports('CreateGarageMed', CreateGarageMed)
exports('DespawnInterior', DespawnInterior)
exports('CreateContainer', CreateContainer)
exports('CreateWarehouse1', CreateWarehouse1)
exports('CreateRanchShell', CreateRanchShell)
exports('CreateTier1House', CreateTier1House)
exports('CreateLesterShell', CreateLesterShell)
exports('CreateHouseRobbery', CreateHouseRobbery)
exports('CreateTrevorsShell', CreateTrevorsShell)
exports('CreateCaravanShell', CreateCaravanShell)
exports('CreateFranklinAunt', CreateFranklinAunt)
exports('CreateApartmentShell', CreateApartmentShell)
exports('CreateFurniMotelModern', CreateFurniMotelModern)
exports('CreateApartmentFurnished', CreateApartmentFurnished)
exports('CreateFurniMotelStandard', CreateFurniMotelStandard)
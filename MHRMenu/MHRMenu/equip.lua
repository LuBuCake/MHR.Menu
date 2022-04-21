
log.info("[MHR Menu] Equip loaded")

-------------------
-- MHR Menu Data --
-------------------

--< REFERENCE DEFINITION >--

local EquipDataManager

--< END REFERENCE DEFINITION >--

--< MODULE DEFINITION >--

local Equip = {}

Equip.EquipmentData = {
    [0] = {
        BaseData = nil -- Weapon
    },
    [1] = {
        BaseData = nil -- Head
    },
    [2] = {
        BaseData = nil -- Chest
    },
    [3] = {
        BaseData = nil -- Arms
    },
    [4] = {
        BaseData = nil -- Waist
    },
    [5] = {
        BaseData = nil -- Legs
    },
    [6] = {
        BaseData = nil -- Petalace
    },
    [7] = {
        BaseData = nil -- Charm
    }
}

function Equip.GetEquipBaseData( index, fallback )
    if fallback ~= nil then
        return fallback
    end

    local plequippack = EquipDataManager.f_PlEquipPack()

    if plequippack then
        local equipmentinventorydatalist = EquipDataManager.PlEquipPack.f_EquipmentInventoryData(plequippack)

        if equipmentinventorydatalist then
            local equipmentinventorydata = equipmentinventorydatalist:get_element(index)

            local isweapon = EquipDataManager.EquipmentInventoryData.c_isWeapon(equipmentinventorydata)
            local isarmor = EquipDataManager.EquipmentInventoryData.c_isArmor(equipmentinventorydata)

            if isweapon then
                return EquipDataManager.EquipmentInventoryData.c_getWeaponBaseData(equipmentinventorydata)
            elseif isarmor then
                return EquipDataManager.EquipmentInventoryData.c_getArmorBaseData(equipmentinventorydata)
            end
        end
    end

    return nil
end

function Equip.Initialize()
    EquipDataManager = require("MHRMenu.singletons.EquipDataManager")
end

function Equip.Update()
    for i=0, 5 do
        Equip.EquipmentData[i].BaseData = Equip.GetEquipBaseData(i)
    end
end

return Equip

--< END MODULE DEFINITION >--
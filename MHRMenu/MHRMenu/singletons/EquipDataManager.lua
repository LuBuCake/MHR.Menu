
log.info("[MHR Menu] EquipDataManager loaded");

-------------------------------
-- MHR Menu EquipDataManager --
-------------------------------

--< SINGLETON DEFINITION >--

local EquipDataManager = {}

local SingletonObj = nil

EquipDataManager.PlEquipPack = {}
EquipDataManager.EquipmentInventoryData = {}
EquipDataManager.WeaponBaseData = {}

function EquipDataManager.Singleton()
    if SingletonObj ~= nil then return SingletonObj end

	SingletonObj = sdk.get_managed_singleton("snow.data.EquipDataManager")

	if SingletonObj == nil then
		--log.error("[MHR Menu] No equip data manager")
	end

    return SingletonObj
end

--<< FIELDS || CALLS >>--

local function f_Field( obj, field, value )
    if not value then
        return obj:get_field(field)
    end

    obj:set_field(field, value)

    return value
end

local function f_Field_Raw( obj, datatype, offset, value )
    if not value then
        if datatype == "byte" then
            return obj:read_byte(offset)
        elseif datatype == "short" then
            return obj:read_short(offset)
        elseif datatype == "int" then
            return obj:read_dword(offset)
        elseif datatype == "long" then
            return obj:read_qword(offset)
        elseif datatype == "float" then
            return obj:read_float(offset)
        elseif datatype == "double" then
            return obj:read_double(offset)
        else
            return nil
        end
    end

    if datatype == "byte" then
        obj:write_byte(offset, value)
    elseif datatype == "short" then
        obj:write_short(offset, value)
    elseif datatype == "int" then
        obj:write_dword(offset, value)
    elseif datatype == "long" then
        obj:write_qword(offset, value)
    elseif datatype == "float" then
        obj:write_float(offset, value)
    elseif datatype == "double" then
        obj:write_double(offset, value)
    else
        return nil
    end

    return value
end

-- Base

function EquipDataManager.f_PlEquipPack() return f_Field(EquipDataManager.Singleton(), "_PlEquipPack") end

-- PlEquipPack

function EquipDataManager.PlEquipPack.f_EquipmentInventoryData( plequippack ) return f_Field(plequippack, "<InventoryDataList>k__BackingField") end 

-- EquipmentInventoryData

function EquipDataManager.EquipmentInventoryData.c_getName( equipmentinventorydata ) return equipmentinventorydata:call("getName") end
function EquipDataManager.EquipmentInventoryData.c_isWeapon( equipmentinventorydata ) return equipmentinventorydata:call("isWeapon") end
function EquipDataManager.EquipmentInventoryData.c_isArmor( equipmentinventorydata ) return equipmentinventorydata:call("isArmor") end
function EquipDataManager.EquipmentInventoryData.c_getWeaponBaseData( equipmentinventorydata ) return equipmentinventorydata:call("getWeaponBaseData") end
function EquipDataManager.EquipmentInventoryData.c_getArmorBaseData( equipmentinventorydata ) return equipmentinventorydata:call("getArmorBaseData") end

-- WeaponBaseData

function EquipDataManager.EquipmentInventoryData.c_get_DtWeaponType( weaponbasedata ) return weaponbasedata:call("get_DtWeaponType") end

function EquipDataManager.WeaponBaseData.f_Id( weaponbasedata ) return f_Field(weaponbasedata, "_Id") end
function EquipDataManager.WeaponBaseData.f_SortId( weaponbasedata ) return f_Field(weaponbasedata, "_SortId") end
function EquipDataManager.WeaponBaseData.f_RareType( weaponbasedata, value ) return f_Field(weaponbasedata, "_RareType", value) end
function EquipDataManager.WeaponBaseData.f_ModelId( weaponbasedata, value ) return f_Field(weaponbasedata, "_ModelId", value) end
function EquipDataManager.WeaponBaseData.f_BaseVal( weaponbasedata, value ) return f_Field(weaponbasedata, "_BaseVal", value) end
function EquipDataManager.WeaponBaseData.f_BuyVal( weaponbasedata, value ) return f_Field(weaponbasedata, "_BuyVal", value) end
function EquipDataManager.WeaponBaseData.f_Atk( weaponbasedata, value ) return f_Field_Raw(weaponbasedata, "int", 0x28, value) end
function EquipDataManager.WeaponBaseData.f_CriticalRate( weaponbasedata, value ) return f_Field_Raw(weaponbasedata, "int", 0x2C, value) end
function EquipDataManager.WeaponBaseData.f_DefBonus( weaponbasedata, value ) return f_Field_Raw(weaponbasedata, "int", 0x30, value) end
function EquipDataManager.WeaponBaseData.f_Element( weaponbasedata, value ) return f_Field_Raw(weaponbasedata, "int", 0x48, value) end
function EquipDataManager.WeaponBaseData.f_Element_Damage( weaponbasedata, value ) return f_Field_Raw(weaponbasedata, "int", 0x4C, value) end

--< END FIELDS || CALLS >--

return EquipDataManager

--< END SINGLETON DEFINITION >--
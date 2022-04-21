
log.info("[MHR Menu] EquipDataManager loaded")

-------------------------------
-- MHR Menu EquipDataManager --
-------------------------------

--< REFERENCE DEFINITION >--

local Object

--< END REFERENCE DEFINITION >--

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

-- Base

function EquipDataManager.f_PlEquipPack() return Object.Field(EquipDataManager.Singleton(), "_PlEquipPack") end

-- PlEquipPack

function EquipDataManager.PlEquipPack.f_EquipmentInventoryData( plequippack ) return Object.Field(plequippack, "<InventoryDataList>k__BackingField") end 

-- EquipmentInventoryData

function EquipDataManager.EquipmentInventoryData.c_getName( equipmentinventorydata ) return equipmentinventorydata:call("getName") end
function EquipDataManager.EquipmentInventoryData.c_isWeapon( equipmentinventorydata ) return equipmentinventorydata:call("isWeapon") end
function EquipDataManager.EquipmentInventoryData.c_isArmor( equipmentinventorydata ) return equipmentinventorydata:call("isArmor") end
function EquipDataManager.EquipmentInventoryData.c_getWeaponBaseData( equipmentinventorydata ) return equipmentinventorydata:call("getWeaponBaseData") end
function EquipDataManager.EquipmentInventoryData.c_getArmorBaseData( equipmentinventorydata ) return equipmentinventorydata:call("getArmorBaseData") end

-- WeaponBaseData

function EquipDataManager.EquipmentInventoryData.c_get_DtWeaponType( weaponbasedata ) return weaponbasedata:call("get_DtWeaponType") end

function EquipDataManager.WeaponBaseData.f_Id( weaponbasedata ) return Object.Field(weaponbasedata, "_Id") end
function EquipDataManager.WeaponBaseData.f_SortId( weaponbasedata ) return Object.Field(weaponbasedata, "_SortId") end
function EquipDataManager.WeaponBaseData.f_RareType( weaponbasedata, value ) return Object.Field(weaponbasedata, "_RareType", value) end
function EquipDataManager.WeaponBaseData.f_ModelId( weaponbasedata, value ) return Object.Field(weaponbasedata, "_ModelId", value) end
function EquipDataManager.WeaponBaseData.f_BaseVal( weaponbasedata, value ) return Object.Field(weaponbasedata, "_BaseVal", value) end
function EquipDataManager.WeaponBaseData.f_BuyVal( weaponbasedata, value ) return Object.Field(weaponbasedata, "_BuyVal", value) end
function EquipDataManager.WeaponBaseData.f_Atk( weaponbasedata, value ) return Object.Field_Raw(weaponbasedata, "int", 0x28, value) end
function EquipDataManager.WeaponBaseData.f_CriticalRate( weaponbasedata, value ) return Object.Field_Raw(weaponbasedata, "int", 0x2C, value) end
function EquipDataManager.WeaponBaseData.f_DefBonus( weaponbasedata, value ) return Object.Field_Raw(weaponbasedata, "int", 0x30, value) end
function EquipDataManager.WeaponBaseData.f_Element( weaponbasedata, value ) return Object.Field_Raw(weaponbasedata, "int", 0x48, value) end
function EquipDataManager.WeaponBaseData.f_Element_Damage( weaponbasedata, value ) return Object.Field_Raw(weaponbasedata, "int", 0x4C, value) end

--< END FIELDS || CALLS >--

function EquipDataManager.Initialize()
    Object = require("MHRMenu.helpers.object")
end

return EquipDataManager

--< END SINGLETON DEFINITION >--
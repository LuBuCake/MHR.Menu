
log.info("[MHR Menu] DataManager loaded")

--------------------------
-- MHR Menu DataManager --
--------------------------

--< REFERENCE DEFINITION >--

local Object

--< END REFERENCE DEFINITION >--

--< REFERENCE DEFINITION >--

local Singletons

--< END REFERENCE DEFINITION >--

--< SINGLETON DEFINITION >--

local DataManager = {}

local SingletonObj = nil

DataManager.VillagePointData = {}
DataManager.HandMoney = {}
DataManager.ItemBox = {}
DataManager.InventoryList = {}
DataManager.ItemInventoryData = {}

function DataManager.Singleton()
    if SingletonObj ~= nil then return SingletonObj end

	SingletonObj = sdk.get_managed_singleton("snow.data.DataManager")

	if SingletonObj == nil then
		--log.error("[MHR Menu] No data manager")
	end

    return SingletonObj
end

--<< FIELDS || CALLS >>--

-- Base

function DataManager.c_get_VillagePointData() return DataManager.Singleton():call("get_VillagePointData") end
function DataManager.c_getHandMoney() return DataManager.Singleton():call("getHandMoney") end

function DataManager.f_VillagePointData() return Object.Field(DataManager.Singleton(), "<VillagePointData>k__BackingField") end
function DataManager.f_HandMoney() return Object.Field(DataManager.Singleton(), "_HandMoney") end
function DataManager.f_ItemPouch() return Object.Field(DataManager.Singleton(), "_ItemPouch") end
function DataManager.f_ItemBox() return Object.Field(DataManager.Singleton(), "_PlItemBox") end

-- VillagePointData

function DataManager.VillagePointData.f_MaxValue( villagepointdata, value ) return Object.Field(villagepointdata, "MaxValue", value) end
function DataManager.VillagePointData.f_MinValue( villagepointdata, value ) return Object.Field(villagepointdata, "MinValue", value) end
function DataManager.VillagePointData.f_Point( villagepointdata, value ) return Object.Field(villagepointdata, "_Point", value ) end
function DataManager.VillagePointData.f_TotalAddedPoint( villagepointdata, value ) return Object.Field(villagepointdata, "_TotalAddedPoint", value) end
function DataManager.VillagePointData.f_DefaultPoint( villagepointdata, value ) return Object.Field(villagepointdata, "DefaultPoint", value) end

-- HandMoney

function DataManager.HandMoney.f_MaxValue( handmoney, value ) return Object.Field(handmoney, "MaxValue", value) end
function DataManager.HandMoney.f_MinValue( handmoney, value ) return Object.Field(handmoney, "MinValue", value) end
function DataManager.HandMoney.f_Value( handmoney, value ) return Object.Field(handmoney, "_Value", value ) end
function DataManager.HandMoney.f_TotalAddedValue( handmoney, value ) return Object.Field(handmoney, "_TotalAddedValue", value) end
function DataManager.HandMoney.f_DefaultMoney( handmoney, value ) return Object.Field(handmoney, "DefaultMoney", value) end

-- ItemBox

function DataManager.ItemBox.c_tryAddGameItem( itembox, itemid, count) itembox:call("tryAddGameItem(snow.data.ContentsIdSystem.ItemId, System.Int32)", itemid, count) end

function DataManager.ItemBox.f_InventoryList( itembox ) return Object.Field(itembox, "_InventoryList") end

-- InventoryList

function DataManager.InventoryList.f_ItemInventoryDataCollection( inventorylist ) return Object.Field(inventorylist, "mItems") end
function DataManager.InventoryList.f_Size( inventorylist ) return Object.Field(inventorylist, "mSize") end

-- ItemInventoryData

function DataManager.ItemInventoryData.GetFromCollection( inventorylist, index )
    local collection = DataManager.InventoryList.f_ItemInventoryDataCollection(inventorylist)

    if collection then
        return collection:get_element(index)
    end

    return nil
end

function DataManager.ItemInventoryData.c_set( iteminventorydata, id, count, autoclear ) iteminventorydata:call("set(snow.data.ContentsIdSystem.ItemId, System.UInt32, System.Boolean)", id, count, autoclear) end
function DataManager.ItemInventoryData.c_getId( iteminventorydata ) return iteminventorydata:call("getId") end
function DataManager.ItemInventoryData.c_setId( iteminventorydata, id ) iteminventorydata:call("setId(snow.data.ContentsIdSystem.ItemId)", id) end
function DataManager.ItemInventoryData.c_add( iteminventorydata, count ) iteminventorydata:call("add(System.Int32)", count) end
function DataManager.ItemInventoryData.c_sub( iteminventorydata, count, autoempty ) iteminventorydata:call("sub(System.UInt32, System.Boolean)", count, autoempty) end
function DataManager.ItemInventoryData.c_setNum( iteminventorydata, count, autoclear ) iteminventorydata:call("setNum(System.UInt32, System.Boolean)", count, autoclear) end
function DataManager.ItemInventoryData.c_getCount( iteminventorydata ) return iteminventorydata:call("getCount") end

function DataManager.ItemInventoryData.f_Id( iteminventorydata, value )
    local itemcount = Object.Field(iteminventorydata, "_ItemCount")
    if not itemcount then return nil end

    return Object.Field(itemcount, "_Id", value)
end

function DataManager.ItemInventoryData.f_Num( iteminventorydata, value )
    local itemcount = Object.Field(iteminventorydata, "_ItemCount")
    if not itemcount then return nil end

    return Object.Field(itemcount, "_Num", value)
end

--< END FIELDS || CALLS >--

function DataManager.Initialize()
    Object = require("MHRMenu.helpers.object")
end

return DataManager

--< END SINGLETON DEFINITION >--
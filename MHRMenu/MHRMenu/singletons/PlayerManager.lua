
log.info("[MHR Menu] PlayerManager loaded");

----------------------------
-- MHR Menu PlayerManager --
----------------------------

--< SINGLETON DEFINITION >--

local PlayerManager = {}

local SingletonObj = nil

PlayerManager.Player = {}
PlayerManager.Player.Data = {}
PlayerManager.Player.Data.VitalContext = {}

function PlayerManager.Singleton()
    if SingletonObj ~= nil then return SingletonObj end

	SingletonObj = sdk.get_managed_singleton("snow.player.PlayerManager")

	if SingletonObj == nil then
		--log.error("[MHR Menu] No player manager")
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

-- Base

function PlayerManager.c_getPlayer( index ) return PlayerManager.Singleton():call("getPlayer", index) end
function PlayerManager.c_getPlayerNoLock( index ) return PlayerManager.Singleton():call("getPlayerNoLock", index) end
function PlayerManager.c_findMasterPlayer() return PlayerManager.Singleton():call("findMasterPlayer") end
function PlayerManager.c_getMasterPlayerID() return PlayerManager.Singleton():call("getMasterPlayerID") end
function PlayerManager.c_get_PlayerData() return PlayerManager.Singleton():call("get_PlayerData") end
function PlayerManager.c_get_PlayerSkill() return PlayerManager.Singleton():call("get_PlayerSkill") end

function PlayerManager.f_PlayerList() return f_Field(PlayerManager.Singleton(), "PlayerList") end
function PlayerManager.f_PlayerListPrivate() return f_Field(PlayerManager.Singleton(), "PlayerListPrivate") end
function PlayerManager.f_PlayerData() return f_Field(PlayerManager.Singleton(), "<PlayerData>k__BackingField") end
function PlayerManager.f_PlayerSkillList() return f_Field(PlayerManager.Singleton(), "<PlayerSkill>k__BackingField") end

-- Player

function PlayerManager.Player.f_Data( player ) return f_Field( player, "_refPlayerData" ) end
function PlayerManager.Player.f_Sharpness_Lv( player, value ) return f_Field( player, "<SharpnessLv>k__BackingField", value ) end
function PlayerManager.Player.f_Sharpness_Gauge( player, value ) return f_Field( player, "<SharpnessGauge>k__BackingField", value ) end
function PlayerManager.Player.f_Sharpness_Gauge_Max( player, value ) return f_Field( player, "<SharpnessGaugeMax>k__BackingField", value ) end
function PlayerManager.Player.f_Sharpness_Boost_Timer( player, value ) return f_Field( player, "_SharpnessGaugeBoostTimer", value ) end

-- Player Data

function PlayerManager.Player.Data.f_VitalContext( player ) return f_Field( player, "_vitalContext" ) end

function PlayerManager.Player.Data.f_Health( data, value ) return f_Field( data, "_r_Vital", value ) end
function PlayerManager.Player.Data.f_Health_Max( data, value ) return f_Field( data, "_vitalMax", value ) end
function PlayerManager.Player.Data.f_Health_Keep( data, value ) return f_Field( data, "_vitalKeep", value ) end
function PlayerManager.Player.Data.f_Stamina( data, value ) return f_Field( data, "_stamina", value ) end
function PlayerManager.Player.Data.f_Stamina_Max( data, value ) return f_Field( data, "_staminaMax", value ) end
function PlayerManager.Player.Data.f_Attack( data, value ) return f_Field( data, "_Attack", value ) end
function PlayerManager.Player.Data.f_Defense( data, value ) return f_Field( data, "_Defence", value ) end
function PlayerManager.Player.Data.f_CriticalRate( data, value ) return f_Field( data, "_CriticalRate", value ) end

-- VitalContext

function PlayerManager.Player.Data.VitalContext.c_read( vitalcontext ) return vitalcontext:call("read") end
function PlayerManager.Player.Data.VitalContext.c_write( vitalcontext, value ) vitalcontext:call("write", value) end

--< END FIELDS || CALLS >--

return PlayerManager

--< END SINGLETON DEFINITION >--
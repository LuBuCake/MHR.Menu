
log.info("[MHR Menu] PlayerManager loaded");

----------------------------
-- MHR Menu PlayerManager --
----------------------------

--< REFERENCE DEFINITION >--

local Object

--< END REFERENCE DEFINITION >--

--< SINGLETON DEFINITION >--

local PlayerManager = {}

local SingletonObj = nil

PlayerManager.Player = {}
PlayerManager.Player.HunterWireGauge = {}
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

-- Base

function PlayerManager.c_getPlayer( index ) return PlayerManager.Singleton():call("getPlayer", index) end
function PlayerManager.c_getPlayerNoLock( index ) return PlayerManager.Singleton():call("getPlayerNoLock", index) end
function PlayerManager.c_findMasterPlayer() return PlayerManager.Singleton():call("findMasterPlayer") end
function PlayerManager.c_getMasterPlayerID() return PlayerManager.Singleton():call("getMasterPlayerID") end
function PlayerManager.c_get_PlayerData() return PlayerManager.Singleton():call("get_PlayerData") end
function PlayerManager.c_get_PlayerSkill() return PlayerManager.Singleton():call("get_PlayerSkill") end

function PlayerManager.f_PlayerList() return Object.Field(PlayerManager.Singleton(), "PlayerList") end
function PlayerManager.f_PlayerListPrivate() return Object.Field(PlayerManager.Singleton(), "PlayerListPrivate") end
function PlayerManager.f_PlayerData() return Object.Field(PlayerManager.Singleton(), "<PlayerData>k__BackingField") end
function PlayerManager.f_PlayerSkillList() return Object.Field(PlayerManager.Singleton(), "<PlayerSkill>k__BackingField") end

-- Player

function PlayerManager.Player.f_Data( player ) return Object.Field( player, "_refPlayerData" ) end
function PlayerManager.Player.f_Sharpness_Lv( player, value ) return Object.Field( player, "<SharpnessLv>k__BackingField", value ) end
function PlayerManager.Player.f_Sharpness_Gauge( player, value ) return Object.Field( player, "<SharpnessGauge>k__BackingField", value ) end
function PlayerManager.Player.f_Sharpness_Gauge_Max( player, value ) return Object.Field( player, "<SharpnessGaugeMax>k__BackingField", value ) end
function PlayerManager.Player.f_Sharpness_Boost_Timer( player, value ) return Object.Field( player, "_SharpnessGaugeBoostTimer", value ) end

function PlayerManager.Player.f_HunterWireGauge( player ) return Object.Field( player, "_HunterWireGauge" ) end

-- Hunter Wire Gauge

function PlayerManager.Player.HunterWireGauge.GetFromCollection( player, index )
    local collection = PlayerManager.Player.f_HunterWireGauge(player)

    if collection then
        return collection:get_element(index)
    end

    return nil
end

function PlayerManager.Player.HunterWireGauge.f_RecastTimer( wiregauge, value ) return Object.Field( wiregauge, "_RecastTimer", value ) end
function PlayerManager.Player.HunterWireGauge.f_RecastTimerMax( wiregauge, value ) return Object.Field( wiregauge, "_RecastTimerMax", value ) end
function PlayerManager.Player.HunterWireGauge.f_RecoverWaitTimer( wiregauge, value ) return Object.Field( wiregauge, "_RecoverWaitTimer", value ) end

-- Data

function PlayerManager.Player.Data.f_VitalContext( data ) return Object.Field( data, "_vitalContext" ) end
function PlayerManager.Player.Data.f_Health( data, value ) return Object.Field( data, "_r_Vital", value ) end
function PlayerManager.Player.Data.f_Health_Max( data, value ) return Object.Field( data, "_vitalMax", value ) end
function PlayerManager.Player.Data.f_Health_Keep( data, value ) return Object.Field( data, "_vitalKeep", value ) end
function PlayerManager.Player.Data.f_Stamina( data, value ) return Object.Field( data, "_stamina", value ) end
function PlayerManager.Player.Data.f_Stamina_Max( data, value ) return Object.Field( data, "_staminaMax", value ) end
function PlayerManager.Player.Data.f_Attack( data, value ) return Object.Field( data, "_Attack", value ) end
function PlayerManager.Player.Data.f_Defense( data, value ) return Object.Field( data, "_Defence", value ) end
function PlayerManager.Player.Data.f_CriticalRate( data, value ) return Object.Field( data, "_CriticalRate", value ) end

function PlayerManager.Player.Data.f_Demondrug_Power( data, value ) return Object.Field( data, "_AtkUpAlive", value ) end
function PlayerManager.Player.Data.f_Armorskin_Power( data, value ) return Object.Field( data, "_DefUpAlive", value ) end
function PlayerManager.Player.Data.f_MightSeed_Power( data, value ) return Object.Field( data, "_AtkUpBuffSecond", value ) end
function PlayerManager.Player.Data.f_AdamantSeed_Power( data, value ) return Object.Field( data, "_DefUpBuffSecond", value ) end
function PlayerManager.Player.Data.f_DemonPowder_Power( data, value ) return Object.Field( data, "_AtkUpItemSecond", value ) end
function PlayerManager.Player.Data.f_HardshellPowder_Power( data, value ) return Object.Field( data, "_DefUpItemSecond", value ) end

function PlayerManager.Player.Data.f_MightSeed_Timer( data, value ) return Object.Field( data, "_AtkUpBuffSecondTimer", value ) end
function PlayerManager.Player.Data.f_AdamantSeed_Timer( data, value ) return Object.Field( data, "_DefUpBuffSecondTimer", value ) end
function PlayerManager.Player.Data.f_DemonPowder_Timer( data, value ) return Object.Field( data, "_AtkUpItemSecondTimer", value ) end
function PlayerManager.Player.Data.f_HardshellPowder_Timer( data, value ) return Object.Field( data, "_DefUpItemSecondTimer", value ) end

-- VitalContext

function PlayerManager.Player.Data.VitalContext.c_read( vitalcontext ) return vitalcontext:call("read") end
function PlayerManager.Player.Data.VitalContext.c_write( vitalcontext, value ) vitalcontext:call("write", value) end

--< END FIELDS || CALLS >--

function PlayerManager.Initialize()
    Object = require("MHRMenu.helpers.object")
end

return PlayerManager

--< END SINGLETON DEFINITION >--
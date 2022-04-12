
log.info("[MHR Menu] Player loaded");

---------------------
-- MHR Menu Player --
---------------------

--< REFERENCE DEFINITION >--

local PlayerManager
local Settings

--< END REFERENCE DEFINITION >--

--< MODULE DEFINITION >--

local Player = {}

Player.MasterPlayer = nil
Player.MasterPlayerData = nil

function Player.Initialize()
    PlayerManager = require("MHRMenu.singletons.PlayerManager")
    Settings = require("MHRMenu.settings")
end

function Player.Update()
    Player.MasterPlayer = PlayerManager:c_findMasterPlayer()

    if not Player.MasterPlayer then
        Player.MasterPlayerData = nil
        return
    end

    Player.MasterPlayerData = PlayerManager.Player.f_Data(Player.MasterPlayer)

    if Settings.Config.Player.sharpness_max_gauge then
        PlayerManager.Player.f_Sharpness_Gauge(Player.MasterPlayer, PlayerManager.Player.f_Sharpness_Gauge_Max(Player.MasterPlayer))
    end

    if Settings.Config.Player.sharpness_boost then
        PlayerManager.Player.f_Sharpness_Boost_Timer(Player.MasterPlayer, 100.0)
    end

    if Settings.Config.Player.sharpness_lvl_toggle then
        PlayerManager.Player.f_Sharpness_Lv(Player.MasterPlayer, Settings.Config.Weapon.sharpness_lvl_value)
    else
        Settings.Config.Player.sharpness_lvl_value = PlayerManager.Player.f_Sharpness_Lv(Player.MasterPlayer)
    end

    if Settings.Config.Player.health_max then
        local health = PlayerManager.Player.Data.f_Health(Player.MasterPlayerData)
        local health_max = PlayerManager.Player.Data.f_Health_Max(Player.MasterPlayerData)

        if health < health_max then
            PlayerManager.Player.Data.f_Health(Player.MasterPlayerData, health_max)

            local vitalcontext = PlayerManager.Player.Data.f_VitalContext(Player.MasterPlayerData)

            if vitalcontext then
                PlayerManager.Player.Data.VitalContext.c_write(vitalcontext, health_max)
            end
        end
    end
    
    if Settings.Config.Player.stamina_max then
        local stamina = PlayerManager.Player.Data.f_Stamina(Player.MasterPlayerData)
        local stamina_max = PlayerManager.Player.Data.f_Stamina_Max(Player.MasterPlayerData)

        if stamina < stamina_max then
            PlayerManager.Player.Data.f_Stamina(Player.MasterPlayerData, PlayerManager.Player.Data.f_Stamina_Max(Player.MasterPlayerData))
        end
    end
end

return Player

--< END MODULE DEFINITION >--

log.info("[MHR Menu] Settings loaded");

-----------------------
-- MHR Menu Settings --
-----------------------

--< REFERENCE DEFINITION >--

--< END REFERENCE DEFINITION >--

--< MODULE DEFINITION >--

local Settings = {}

Settings.Config = {}
Settings.Config.Version = "dev-0.0.3"

Settings.Config.Player = {}
Settings.Config.Player.health_max = false
Settings.Config.Player.stamina_max = false
Settings.Config.Player.sharpness_max_gauge = false
Settings.Config.Player.sharpness_boost = false
Settings.Config.Player.sharpness_lvl_toggle = false
Settings.Config.Player.sharpness_lvl_value = 0

Settings.Config.Player.HunterWireGauge = {}
Settings.Config.Player.HunterWireGauge.no_cooldown_toggle = false

Settings.Config.ItemBox = {}
Settings.Config.ItemBox.itemcount_cap_max_toggle = false
Settings.Config.ItemBox.itemcount_cap_min_toggle = false
Settings.Config.ItemBox.itemcount_cap_max_value = 9999
Settings.Config.ItemBox.itemcount_cap_min_value = 1

function Settings.Load()
    local cfg = json.load_file("mhrmenu.json")

    if cfg and cfg.Version == Settings.Config.Version then
        Settings.Config = cfg
    end
end

function Settings.Save()
    json.dump_file("mhrmenu.json", Settings.Config)
end

function Settings.Initialize()
    Settings.Load()
end

return Settings

--< END MODULE DEFINITION >--
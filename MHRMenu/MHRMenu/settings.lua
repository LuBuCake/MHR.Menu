
log.info("[MHR Menu] Settings loaded");

-----------------------
-- MHR Menu Settings --
-----------------------

--< REFERENCE DEFINITION >--

--< END REFERENCE DEFINITION >--

--< MODULE DEFINITION >--

local Settings = {}

Settings.Config = {}
Settings.Config.Version = "dev-0.0.1"

Settings.Config.Player = {}
Settings.Config.Player.health_max = false
Settings.Config.Player.stamina_max = false
Settings.Config.Player.sharpness_max_gauge = false
Settings.Config.Player.sharpness_boost = false
Settings.Config.Player.sharpness_lvl_toggle = false
Settings.Config.Player.sharpness_lvl_value = 0

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
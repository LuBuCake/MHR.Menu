
log.info("[MHR Menu] Hooks loaded");

-------------------
-- MHR Menu Data --
-------------------

--< REFERENCE DEFINITION >--

local Settings

--< END REFERENCE DEFINITION >--

--< MODULE DEFINITION >--

local Hooks = {}

Hooks.NoHitStop = {}

function Hooks.NoHitStop.Object()
    return sdk.find_type_definition("snow.player.PlayerQuestBase"):get_method("updateHitStop")
end

function Hooks.NoHitStop.Func( args )
    if not Settings.Config.Player.nohitstop then return end

    sdk.to_managed_object(args[2]):call("resetHitStop")
end

function Hooks.NoHitStop.Func_Ret( retval )
    return retval
end

function Hooks.Initialize()
    Settings = require("MHRMenu.settings")
end

return Hooks

--< END MODULE DEFINITION >--
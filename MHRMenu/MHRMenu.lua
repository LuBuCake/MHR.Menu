
log.info("[MHR Menu] Menu loaded");

------------------------------
-- Monster Hunter Rise Menu --
-- Version: dev-0.0.1       --
-- By: LuBuCake (Sr. Wesky) --
------------------------------

--< SINGLETONS >--

local EquipDataManager = require("MHRMenu.singletons.EquipDataManager")
local PlayerManager = require("MHRMenu.singletons.PlayerManager")
local DataManager = require("MHRMenu.singletons.DataManager")

--< END SINGLETONS >--

--< MODULES >--

local Settings = require("MHRMenu.settings")
local Player = require("MHRMenu.player")
local Equip = require("MHRMenu.equip")
local UI = require("MHRMenu.ui")

Settings.Initialize()
Player.Initialize()
Equip.Initialize()
UI.Initialize()

--< END MODULES >--

--< MOD LOGIC DEFINITION >--

re.on_config_save(Settings.Save)

re.on_draw_ui(function()
	if imgui.button("MHR Menu") then
		UI.DrawUI = not UI.DrawUI
	end
end)

re.on_frame(function()
	if not reframework:is_drawing_ui() then
		UI.DrawUI = false;
	end

	if UI.DrawUI then
		pcall(UI.Draw);
	end
end);

re.on_pre_application_entry("UpdateBehavior", function()
    Player.Update()
	Equip.Update()
end)

--< END MOD LOGIC DEFINITION >--
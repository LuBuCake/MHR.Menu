
log.info("[MHR Menu] Menu loaded");

--< SINGLETONS >--

local EquipDataManager = require("MHRMenu.singletons.EquipDataManager")
local PlayerManager = require("MHRMenu.singletons.PlayerManager")
local DataManager = require("MHRMenu.singletons.DataManager")

EquipDataManager.Initialize()
PlayerManager.Initialize()
DataManager.Initialize()

--< END SINGLETONS >--

--< MODULES >--

local Settings = require("MHRMenu.settings")
local Data = require("MHRMenu.data")
local Player = require("MHRMenu.player")
local Equip = require("MHRMenu.equip")
local UI = require("MHRMenu.ui")

Settings.Initialize()
Data.Initialize()
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
		UI.DrawUI = false
	end

	if UI.DrawUI then
		pcall(UI.Draw)
	end
end);

re.on_pre_application_entry("UpdateBehavior", function()
    Player.Update()
	Equip.Update()
	Data.Update()
end)

--< END MOD LOGIC DEFINITION >--
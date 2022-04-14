
log.info("[MHR Menu] UI loaded");

-----------------
-- MHR Menu UI --
-----------------

--< SINGLETONS >--

local EquipDataManager
local PlayerManager
local DataManager

--< END SINGLETONS >--

--< REFERENCE DEFINITION >--

local Settings
local Player
local Equip
local Data

local Math
local Table

--< END REFERENCE DEFINITION >--

--< MODULE DEFINITION >--

local UI = {}

UI.DrawUI = false
UI.Nodes = nil

UI.Window_Position = Vector2f.new(480, 200)
UI.Window_Pivot = Vector2f.new(0, 0)
UI.Window_Size = Vector2f.new(720, 720)
UI.Window_Flags = 0x10120

UI.Currency = {}
UI.Currency.ZenniToModify = 10000
UI.Currency.KamuraPointsToModify = 10000

UI.WeaponModel = {}
UI.WeaponModel.ModelID = 0
UI.WeaponModel._ModelID = 0
UI.WeaponModel.ModelTable = {}
UI.WeaponModel._ModelTable = {}
UI.WeaponModel.WeaponType = 0

UI.ItemBox = {}
UI.ItemBox.ItemQuantitySet = 100

function UI.BuildNodeTable()

    UI.Nodes = {
        {
            name = "Info",
            controls = {
                {
                    type = "text",
                    text = "Game:"
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        local villagepointdata = DataManager.f_VillagePointData()

                        if villagepointdata then
                            concat = tostring(DataManager.VillagePointData.f_Point(villagepointdata)) .. "pts"
                        end

                        return "    Kamura Points: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        local handmoney = DataManager.f_HandMoney()

                        if handmoney then
                            concat = tostring(DataManager.HandMoney.f_Value(handmoney)) .. "z"
                        end

                        return "    Zenni: " .. concat
                    end
                },
                {
                    type = "text",
                    text = "Player:"
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayerData then
                            concat = tostring(PlayerManager.Player.Data.f_Health(Player.MasterPlayerData))
                        end

                        return "    Health: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayerData then
                            concat = tostring(PlayerManager.Player.Data.f_Health_Max(Player.MasterPlayerData))
                        end

                        return "    Max Health: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayerData then
                            concat = tostring(PlayerManager.Player.Data.f_Stamina(Player.MasterPlayerData))
                        end

                        return "    Stamina: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayerData then
                            concat = tostring(PlayerManager.Player.Data.f_Stamina_Max(Player.MasterPlayerData))
                        end

                        return "    Max Stamina: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayerData then
                            concat = tostring(PlayerManager.Player.Data.f_Attack(Player.MasterPlayerData))
                        end

                        return "    Attack: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayerData then
                            concat = tostring(PlayerManager.Player.Data.f_Defense(Player.MasterPlayerData))
                        end

                        return "    Defense: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayerData then
                            concat = tostring(PlayerManager.Player.Data.f_CriticalRate(Player.MasterPlayerData)) .. "%%"
                        end

                        return "    Affinity: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayer then
                            concat = tostring(PlayerManager.Player.f_Sharpness_Gauge(Player.MasterPlayer))
                        end

                        return "    Sharpness: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayer then
                            concat = tostring(PlayerManager.Player.f_Sharpness_Gauge_Max(Player.MasterPlayer))
                        end

                        return "    Max Sharpness: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayer then
                            concat = tostring(PlayerManager.Player.f_Sharpness_Lv(Player.MasterPlayer))
                        end

                        return "    Sharpness Level: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "Unavailable"

                        if Player.MasterPlayer then
                            concat = tostring(PlayerManager.Player.f_Sharpness_Boost_Timer(Player.MasterPlayer))
                        end

                        return "    Sharpness Boost Timer: " .. concat
                    end
                },
                {
                    type = "text",
                    text = "Weapon:"
                },
                {
                    type = "text",
                    text = function()
                        local concat = "???"

                        if Equip.EquipmentData[0].BaseData then
                            local attack = EquipDataManager.WeaponBaseData.f_Atk(Equip.EquipmentData[0].BaseData)

                            if attack then
                                concat = tostring(attack)
                            end
                        end

                        return "    Attack: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "???"

                        if Equip.EquipmentData[0].BaseData then
                            local critical = EquipDataManager.WeaponBaseData.f_CriticalRate(Equip.EquipmentData[0].BaseData)

                            if critical then
                                concat = tostring(critical)
                            end
                        end

                        return "    Affinity: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "???"

                        if Equip.EquipmentData[0].BaseData then
                            local defense = EquipDataManager.WeaponBaseData.f_DefBonus(Equip.EquipmentData[0].BaseData)

                            if defense then
                                concat = tostring(defense)
                            end
                        end

                        return "    Defense Bonus: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "???"

                        if Equip.EquipmentData[0].BaseData then
                            local element = EquipDataManager.WeaponBaseData.f_Element(Equip.EquipmentData[0].BaseData)

                            if element then
                                concat = Data.Dictionary.Element[element + 1]
                            end
                        end

                        return "    Element: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "???"

                        if Equip.EquipmentData[0].BaseData then
                            local elementdmg = EquipDataManager.WeaponBaseData.f_Element_Damage(Equip.EquipmentData[0].BaseData)

                            if elementdmg then
                                concat = tostring(elementdmg)
                            end
                        end

                        return "    Element Damage: " .. concat
                    end
                },
                {
                    type = "text",
                    text = function()
                        local concat = "???"

                        if Equip.EquipmentData[0].BaseData then
                            local modelid = EquipDataManager.WeaponBaseData.f_ModelId(Equip.EquipmentData[0].BaseData)

                            if modelid then
                                concat = tostring(modelid)
                            end
                        end

                        return "    Model ID: " .. concat
                    end
                }
            }
        },
        {
            name = "Game",
            controls = {
                {
                    type = "node",
                    name = "Kamura Points",
                    controls = {
                        {
                            type = "drag_int",
                            text = "",
                            speed = 1,
                            min = 1,
                            max = 100000,
                            format = "%d",
                            set_value = function (value)
                                UI.Currency.KamuraPointsToModify = value
                            end,
                            get_value = function ()
                                return UI.Currency.KamuraPointsToModify
                            end
                        },
                        {
                            type = "same_line"
                        },
                        {
                            type = "button",
                            text = "Add",
                            onclick = function()
                                local villagepointdata = DataManager.f_VillagePointData()
                                if not villagepointdata then return end

                                local villagepoint_max = DataManager.VillagePointData.f_MaxValue(villagepointdata)
                                local villagepoint_min = DataManager.VillagePointData.f_MinValue(villagepointdata)

                                local current = DataManager.VillagePointData.f_Point(villagepointdata)
                                DataManager.VillagePointData.f_Point(villagepointdata, Math.Clamp(current + UI.Currency.KamuraPointsToModify, villagepoint_min, villagepoint_max))
                            end
                        },
                        {
                            type = "same_line"
                        },
                        {
                            type = "button",
                            text = "Sub",
                            onclick = function()
                                local villagepointdata = DataManager.f_VillagePointData()
                                if not villagepointdata then return end

                                local villagepoint_max = DataManager.VillagePointData.f_MaxValue(villagepointdata)
                                local villagepoint_min = DataManager.VillagePointData.f_MinValue(villagepointdata)

                                local current = DataManager.VillagePointData.f_Point(villagepointdata)
                                DataManager.VillagePointData.f_Point(villagepointdata, Math.Clamp(current - UI.Currency.KamuraPointsToModify, villagepoint_min, villagepoint_max))
                            end
                        }
                    }
                },
                {
                    type = "node",
                    name = "Zenni",
                    controls = {
                        {
                            type = "drag_int",
                            text = "",
                            speed = 1,
                            min = 1,
                            max = 100000,
                            format = "%d",
                            set_value = function (value)
                                UI.Currency.ZenniToModify = value
                            end,
                            get_value = function ()
                                return UI.Currency.ZenniToModify
                            end
                        },
                        {
                            type = "same_line"
                        },
                        {
                            type = "button",
                            text = "Add",
                            onclick = function()
                                local handmoney = DataManager.f_HandMoney()
                                if not handmoney then return end

                                local handmoney_max = DataManager.HandMoney.f_MaxValue(handmoney)
                                local handmoney_min = DataManager.HandMoney.f_MinValue(handmoney)

                                local current = DataManager.HandMoney.f_Value(handmoney)
                                DataManager.HandMoney.f_Value(handmoney, Math.Clamp(current + UI.Currency.ZenniToModify, handmoney_min, handmoney_max))
                            end
                        },
                        {
                            type = "same_line"
                        },
                        {
                            type = "button",
                            text = "Sub",
                            onclick = function()
                                local handmoney = DataManager.f_HandMoney()
                                if not handmoney then return end

                                local handmoney_max = DataManager.HandMoney.f_MaxValue(handmoney)
                                local handmoney_min = DataManager.HandMoney.f_MinValue(handmoney)

                                local current = DataManager.HandMoney.f_Value(handmoney)
                                DataManager.HandMoney.f_Value(handmoney, Math.Clamp(current - UI.Currency.ZenniToModify, handmoney_min, handmoney_max))
                            end
                        }
                    }
                }
            }
        },
        {
            name = "Player",
            controls = {
                {
                    type = "checkbox",
                    text = "Max Health",
                    set_value = function (value)
                        Settings.Config.Player.health_max = value
                        Settings.Save()
                    end,
                    get_value = function ()
                        return Settings.Config.Player.health_max
                    end
                },
                {
                    type = "checkbox",
                    text = "Max Stamina",
                    set_value = function (value)
                        Settings.Config.Player.stamina_max = value
                        Settings.Save()
                    end,
                    get_value = function ()
                        return Settings.Config.Player.stamina_max
                    end
                },
                {
                    type = "node",
                    name = "Sharpness",
                    controls = {
                        {
                            type = "checkbox",
                            text = "Max Sharpness",
                            set_value = function (value)
                                Settings.Config.Player.sharpness_max_gauge = value
                                Settings.Save()
                            end,
                            get_value = function ()
                                return Settings.Config.Player.sharpness_max_gauge
                            end
                        },
                        {
                            type = "checkbox",
                            text = "Boost Sharpness",
                            set_value = function (value)
                                Settings.Config.Player.sharpness_boost = value
                                Settings.Save()
                            end,
                            get_value = function ()
                                return Settings.Config.Player.sharpness_boost
                            end
                        },
                        {
                            type = "node",
                            name = "Sharpness Level",
                            controls = {
                                {
                                    type = "drag_int",
                                    text = "",
                                    speed = 1,
                                    min = 0,
                                    max = 5,
                                    format = "%d",
                                    set_value = function (value)
                                        Settings.Config.Player.sharpness_lvl_value = value
        
                                        if Player.MasterPlayer then
                                            PlayerManager.Player.f_Sharpness_Lv(Player.MasterPlayer, value)
                                        end
        
                                        Settings.Save()
                                    end,
                                    get_value = function ()
                                        return Settings.Config.Player.sharpness_lvl_value
                                    end
                                },
                                {
                                    type = "same_line"
                                },
                                {
                                    type = "checkbox",
                                    text = "Freeze",
                                    set_value = function (value)
                                        Settings.Config.Player.sharpness_lvl_toggle = value
                                        Settings.Save()
                                    end,
                                    get_value = function ()
                                        return Settings.Config.Player.sharpness_lvl_toggle
                                    end
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            name = "Weapon",
            controls = {
                {
                    type = "node",
                    name = "Attack",
                    controls = {
                        {
                            type = "drag_int",
                            text = "",
                            speed = 1,
                            min = 0,
                            max = 1300,
                            format = "%d",
                            set_value = function (value)
                                if Equip.EquipmentData[0].BaseData then
                                    local attack = EquipDataManager.WeaponBaseData.f_Atk(Equip.EquipmentData[0].BaseData)
        
                                    if attack then
                                        EquipDataManager.WeaponBaseData.f_Atk(Equip.EquipmentData[0].BaseData, value)
                                    end
                                end
                            end,
                            get_value = function ()
                                if Equip.EquipmentData[0].BaseData then
                                    local attack = EquipDataManager.WeaponBaseData.f_Atk(Equip.EquipmentData[0].BaseData)
        
                                    if attack then
                                        return attack
                                    end
                                end
        
                                return 0
                            end
                        }
                    }
                },
                {
                    type = "node",
                    name = "Affinity",
                    controls = {
                        {
                            type = "drag_int",
                            text = "",
                            speed = 1,
                            min = 0,
                            max = 100,
                            format = "%d",
                            set_value = function (value)
                                if Equip.EquipmentData[0].BaseData then
                                    local critical = EquipDataManager.WeaponBaseData.f_CriticalRate(Equip.EquipmentData[0].BaseData)
        
                                    if critical then
                                        EquipDataManager.WeaponBaseData.f_CriticalRate(Equip.EquipmentData[0].BaseData, value)
                                    end
                                end
                            end,
                            get_value = function ()
                                if Equip.EquipmentData[0].BaseData then
                                    local critical = EquipDataManager.WeaponBaseData.f_CriticalRate(Equip.EquipmentData[0].BaseData)
        
                                    if critical then
                                        return critical
                                    end
                                end
        
                                return 0
                            end
                        }
                    }
                },
                {
                    type = "node",
                    name = "Defense Bonus",
                    controls = {
                        {
                            type = "drag_int",
                            text = "",
                            speed = 1,
                            min = 0,
                            max = 2000,
                            format = "%d",
                            set_value = function (value)
                                if Equip.EquipmentData[0].BaseData then
                                    local defense = EquipDataManager.WeaponBaseData.f_DefBonus(Equip.EquipmentData[0].BaseData)
        
                                    if defense then
                                        EquipDataManager.WeaponBaseData.f_DefBonus(Equip.EquipmentData[0].BaseData, value)
                                    end
                                end
                            end,
                            get_value = function ()
                                if Equip.EquipmentData[0].BaseData then
                                    local defense = EquipDataManager.WeaponBaseData.f_DefBonus(Equip.EquipmentData[0].BaseData)
        
                                    if defense then
                                        return defense
                                    end
                                end
        
                                return 0
                            end
                        }
                    }
                },
                {
                    type = "node",
                    name = "Element",
                    controls = {
                        {
                            type = "combo",
                            text = "Type",
                            values = Data.Dictionary.Element,
                            set_value = function (value)
                                if Equip.EquipmentData[0].BaseData then
                                    local element = EquipDataManager.WeaponBaseData.f_Element(Equip.EquipmentData[0].BaseData)
        
                                    if element then
                                        EquipDataManager.WeaponBaseData.f_Element(Equip.EquipmentData[0].BaseData, value - 1)
                                    end
                                end
                            end,
                            get_value = function ()
                                if Equip.EquipmentData[0].BaseData then
                                    local element = EquipDataManager.WeaponBaseData.f_Element(Equip.EquipmentData[0].BaseData)
        
                                    if element then
                                        return element + 1
                                    end
                                end
        
                                return 0
                            end
                        },
                        {
                            type = "drag_int",
                            text = "Damage",
                            speed = 1,
                            min = 0,
                            max = 1300,
                            format = "%d",
                            set_value = function (value)
                                if Equip.EquipmentData[0].BaseData then
                                    local elementdmg = EquipDataManager.WeaponBaseData.f_Element_Damage(Equip.EquipmentData[0].BaseData)
        
                                    if elementdmg then
                                        EquipDataManager.WeaponBaseData.f_Element_Damage(Equip.EquipmentData[0].BaseData, value)
                                    end
                                end
                            end,
                            get_value = function ()
                                if Equip.EquipmentData[0].BaseData then
                                    local elementdmg = EquipDataManager.WeaponBaseData.f_Element_Damage(Equip.EquipmentData[0].BaseData)
        
                                    if elementdmg then
                                        return elementdmg
                                    end
                                end
        
                                return 0
                            end
                        }
                    }
                },
                {
                    type = "function",
                    draw = function()
                        if not Equip.EquipmentData[0].BaseData then return end

                        local weapontype = EquipDataManager.EquipmentInventoryData.c_get_DtWeaponType(Equip.EquipmentData[0].BaseData)
                        local modelid = EquipDataManager.WeaponBaseData.f_ModelId(Equip.EquipmentData[0].BaseData)

                        if UI.WeaponModel.WeaponType ~= weapontype then
                            UI.WeaponModel.WeaponType = weapontype

                            if weapontype == Data.Enum.WeaponTypes.GreatSword then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.GreatSword
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._GreatSword
                            elseif weapontype == Data.Enum.WeaponTypes.LongSword then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.LongSword
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._LongSword
                            elseif weapontype == Data.Enum.WeaponTypes.Lance then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.Lance
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._Lance
                            elseif weapontype == Data.Enum.WeaponTypes.GunLance then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.GunLance
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._GunLance
                            elseif weapontype == Data.Enum.WeaponTypes.ShortSword then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.ShortSword
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._ShortSword
                            elseif weapontype == Data.Enum.WeaponTypes.DualBlades then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.DualBlades
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._DualBlades
                            elseif weapontype == Data.Enum.WeaponTypes.Hammer then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.Hammer
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._Hammer
                            elseif weapontype == Data.Enum.WeaponTypes.Horn then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.Horn
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._Horn
                            elseif weapontype == Data.Enum.WeaponTypes.SlashAxe then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.SlashAxe
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._SlashAxe
                            elseif weapontype == Data.Enum.WeaponTypes.ChargeAxe then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.ChargeAxe
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._ChargeAxe
                            elseif weapontype == Data.Enum.WeaponTypes.InsectGlaive then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.InsectGlaive
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._InsectGlaive
                            elseif weapontype == Data.Enum.WeaponTypes.LightBowgun then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.LightBowgun
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._LightBowgun
                            elseif weapontype == Data.Enum.WeaponTypes.HeavyBowgun then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.HeavyBowgun
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._HeavyBowgun
                            elseif weapontype == Data.Enum.WeaponTypes.Bow then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.Bow
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._Bow
                            elseif weapontype == Data.Enum.WeaponTypes.Insect then
                                UI.WeaponModel.ModelTable = Data.Dictionary.ModelID.Insect
                                UI.WeaponModel._ModelTable = Data.Dictionary.ModelID._Insect
                            end
                        end

                        if UI.WeaponModel.ModelID ~= modelid then
                            UI.WeaponModel.ModelID = modelid

                            Table.ForEach(UI.WeaponModel.ModelTable, function(key, value)
                                if value.id == modelid then
                                    UI.WeaponModel._ModelID = key
                                    return true
                                end
                            end)
                        end

                        local changed = false
                        local changed_value = nil

                        if imgui.tree_node("Model") then

                            changed, changed_value = imgui.combo("Selector", UI.WeaponModel._ModelID, UI.WeaponModel._ModelTable)

                            if changed then
                                EquipDataManager.WeaponBaseData.f_ModelId(Equip.EquipmentData[0].BaseData, UI.WeaponModel.ModelTable[changed_value].id)
                            end

                            imgui.tree_pop()
                        end
                    end
                }
            }
        },
        {
            name = "Item Box",
            controls = {
                {
                    type = "node",
                    name = "Quantities",
                    controls = {
                        {
                            type = "node",
                            name = "Set To",
                            controls = {
                                {
                                    type = "drag_int",
                                    text = "",
                                    speed = 1,
                                    min = 1,
                                    max = 9999,
                                    format = "%d",
                                    set_value = function (value)
                                        UI.ItemBox.ItemQuantitySet = value
                                    end,
                                    get_value = function ()
                                        return UI.ItemBox.ItemQuantitySet
                                    end
                                },
                                {
                                    type = "same_line"
                                },
                                {
                                    type = "button",
                                    text = "Set",
                                    onclick = function()
                                        local itembox = DataManager.f_ItemBox()
                                        if not itembox then return end

                                        local inventorylist = DataManager.ItemBox.f_InventoryList(itembox)
                                        if not inventorylist then return end

                                        local size = DataManager.InventoryList.f_Size(inventorylist)

                                        for index = 0, (size - 1) do
                                            local iteminventorydata = DataManager.ItemInventoryData.GetFromCollection(inventorylist, index)
                                            if not iteminventorydata then goto continue end

                                            local count = DataManager.ItemInventoryData.f_Num(iteminventorydata)
                                            if count <= 0 then goto continue end

                                            DataManager.ItemInventoryData.f_Num(iteminventorydata, UI.ItemBox.ItemQuantitySet)

                                            ::continue::
                                        end
                                    end
                                }
                            }
                        },
                        {
                            type = "node",
                            name = "Cap",
                            controls = {
                                {
                                    type = "node",
                                    name = "Maximun",
                                    controls = {
                                        {
                                            type = "drag_int",
                                            text = "",
                                            speed = 1,
                                            min = 1,
                                            max = 9999,
                                            format = "%d",
                                            set_value = function (value)
                                                Settings.Config.ItemBox.itemcount_cap_max_value = value
                                                Settings.Save()
                                            end,
                                            get_value = function ()
                                                return Settings.Config.ItemBox.itemcount_cap_max_value
                                            end
                                        },
                                        {
                                            type = "same_line"
                                        },
                                        {
                                            type = "checkbox",
                                            text = "Enabled",
                                            set_value = function (value)
                                                Settings.Config.ItemBox.itemcount_cap_max_toggle = value
                                                Settings.Save()
                                            end,
                                            get_value = function ()
                                                return Settings.Config.ItemBox.itemcount_cap_max_toggle
                                            end
                                        }
                                    }
                                },
                                {
                                    type = "node",
                                    name = "Minimun",
                                    controls = {
                                        {
                                            type = "drag_int",
                                            text = "",
                                            speed = 1,
                                            min = 1,
                                            max = 9999,
                                            format = "%d",
                                            set_value = function (value)
                                                Settings.Config.ItemBox.itemcount_cap_min_value = value
                                                Settings.Save()
                                            end,
                                            get_value = function ()
                                                return Settings.Config.ItemBox.itemcount_cap_min_value
                                            end
                                        },
                                        {
                                            type = "same_line"
                                        },
                                        {
                                            type = "checkbox",
                                            text = "Enabled",
                                            set_value = function (value)
                                                Settings.Config.ItemBox.itemcount_cap_min_toggle = value
                                                Settings.Save()
                                            end,
                                            get_value = function ()
                                                return Settings.Config.ItemBox.itemcount_cap_min_toggle
                                            end
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

end

function UI.DrawNodeTable( nodetable )
    local changed = false
    local changed_value = nil

    for nodeindex, node in pairs(nodetable) do
        if imgui.tree_node(node.name) then          
            for controlindex, control in pairs(node.controls) do
                
                if control.type == "node" then
                    UI.DrawNodeTable({control})
                    changed = false
                    changed_value = nil
                elseif control.type == "function" then
                    control.draw()
                    changed = false
                    changed_value = nil
                elseif control.type == "text" then
                    imgui.text(type(control.text) == "function" and control.text() or control.text)
                    changed = false
                    changed_value = nil
                elseif control.type == "spacing" then
                    imgui.spacing()
                    changed = false
                    changed_value = nil
                elseif control.type == "same_line" then
                    imgui.same_line()
                    changed = false
                    changed_value = nil
                elseif control.type == "button" then
                    if imgui.button(control.text) then control.onclick() end
                    changed = false
                    changed_value = nil
                elseif control.type == "checkbox" then
                    changed, changed_value = imgui.checkbox(control.text, control.get_value())
                elseif control.type == "slider_int" then
                    changed, changed_value = imgui.slider_int(control.text, control.get_value(), control.min, control.max)
                elseif control.type == "slider_float" then
                    changed, changed_value = imgui.slider_float(control.text, control.get_value(), control.min, control.max, control.format)
                elseif control.type == "drag_int" then
                    changed, changed_value = imgui.drag_int(control.text, control.get_value(), control.speed, control.min, control.max, control.format)
                elseif control.type == "combo" then
                    changed, changed_value = imgui.combo(control.text, control.get_value(), control.values)
                end
    
                if changed and control.set_value then
                    control.set_value(changed_value)
                end
            end
    
            imgui.tree_pop()
        end
    end
end

function UI.Draw()
    imgui.set_next_window_pos(UI.Window_Position, 1 << 3, UI.Window_Pivot);
	imgui.set_next_window_size(UI.Window_Size, 1 << 3);

    UI.DrawUI = imgui.begin_window("MHR Menu", UI.DrawUI, UI.Window_Flags);

	if not UI.DrawUI then return end

    imgui.spacing()
    imgui.text("  ------------------------------------------")
    imgui.text("     Monster Hunter Rise Menu")
    imgui.text("     Version: " .. Settings.Config.Version)
    imgui.text("     By: LuBuCake (Sr. Wesky)")
    imgui.text("  ------------------------------------------")
    imgui.spacing()

    UI.DrawNodeTable(UI.Nodes)

    imgui.end_window()
end

function UI.Initialize()
    EquipDataManager = require("MHRMenu.singletons.EquipDataManager")
    PlayerManager = require("MHRMenu.singletons.PlayerManager")
    DataManager = require("MHRMenu.singletons.DataManager")
    Settings = require("MHRMenu.settings")
    Player = require("MHRMenu.player")
    Equip = require("MHRMenu.equip")
    Data = require("MHRMenu.data")

    Math = require("MHRMenu.helpers.math")
    Table = require("MHRMenu.helpers.table")

    UI.BuildNodeTable()
end

return UI

--< END MODULE DEFINITION >--
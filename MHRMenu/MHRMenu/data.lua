
log.info("[MHR Menu] Data loaded");

-------------------
-- MHR Menu Data --
-------------------

--< MODULE DEFINITION >--

local Data = {}

Data.Enum = {}
Data.Dictionary = {}

--< ENUM >--

Data.Enum.WeaponTypes = {
    GreatSword = 0,
    Hammer = 1,
    Lance = 2,
    ShortSword = 3,
    LightBowgun = 4,
    HeavyBowgun = 5,
    DualBlades = 6,
    LongSword = 7,
    Horn = 8,
    GunLance = 9,
    Bow = 10,
    SlashAxe = 11,
    ChargeAxe = 12,
    InsectGlaive = 13,
    Insect = 14
}

Data.Enum.Element = {
    None = 0,
    Fire = 1,
    Water = 2,
    Thunder = 3,
    Ice = 4,
    Dragon = 5,
    Posion = 6,
    Sleep = 7,
    Paralyze = 8,
    Bomb = 9
}

--< END ENUM >--

--< DICTIONARY >--

Data.Dictionary.Element = {}

--< END DICTIONARY >--

function Data.Initialize()
    for k,v in pairs(Data.Enum.Element) do
        Data.Dictionary.Element[v] = tostring(k)
    end
end

return Data

--< END MODULE DEFINITION >--

log.info("[MHR Menu] Data loaded");

-------------------
-- MHR Menu Data --
-------------------

--< MODULE DEFINITION >--

local Data = {}

Data.Enum = {}
Data.Dictionary = {}

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
    Bomb = 9,
    Max = 10,
    Error = 11
}

Data.Dictionary.Element = {
    [0] = "None",
    [1] = "Fire",
    [2] = "Water",
    [3] = "Thunder",
    [4] = "Ice",
    [5] = "Dragon",
    [6] = "Posion",
    [7] = "Sleep",
    [8] = "Paralyze",
    [9] = "Bomb",
    [10] = "Max",
    [11] = "Error"
}

return Data

--< END MODULE DEFINITION >--
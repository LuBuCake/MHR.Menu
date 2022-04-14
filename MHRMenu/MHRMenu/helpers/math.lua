log.info("[MHR Menu] Table loaded");

--------------------
-- MHR Menu Table --
--------------------

--< MODULE DEFINITION >--

local Math = {}

function Math.Round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function Math.Clamp(num, min, max)
    return math.max(min, math.min(max, num))
end

return Math

--< END MODULE DEFINITION >--
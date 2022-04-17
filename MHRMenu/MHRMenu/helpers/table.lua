
log.info("[MHR Menu] Table loaded");

--------------------
-- MHR Menu Table --
--------------------

--< MODULE DEFINITION >--

local Table = {}

function Table.IsTable( t )
    return type(t) == "table"
end

function Table.Copy( t, lookup_table )
	if t == nil then return nil end

	local copy = {}

	setmetatable(copy, debug.getmetatable(t))

	for i, v in pairs(t) do
		if not Table.IsTable(v) then
			copy[i] = v
		else
			lookup_table = lookup_table or {}
			lookup_table[t] = copy

			if lookup_table[v] then
				copy[i] = lookup_table[v]
			else
				copy[i] = Table.Copy(v, lookup_table)
			end
		end
	end
	
	return copy
end

function Table.Empty( tab )
	for k, v in pairs(tab) do
		tab[k] = nil
	end
end

function Table.IsEmpty( tab )
	return next(tab) == nil
end

function Table.CopyFromTo( from, to )
	Table.Empty(to)
	Table.Merge(to, from)
end

function Table.Merge( dest, source )
	for k, v in pairs(source) do
		if Table.IsTable(v) and Table.IsTable(dest[k]) then
			Table.Merge(dest[k], v)
		else
			dest[k] = v
		end
	end

	return dest
end

function Table.HasValue( t, val )
	for k, v in pairs( t ) do
		if v == val then return true end
	end
	return false
end

function Table.SortDesc( t )
	return table.sort( t, function( a, b ) return a > b end )
end

function Table.SortByKey( t, desc )
	local temp = {}

	for key, _ in pairs(t) do
		table.insert(temp, key)
	end

	if desc then
		table.sort(temp, function( a, b ) return t[a] < t[b] end )
	else
		table.sort(temp, function( a, b ) return t[a] > t[b] end )
	end

	return temp
end

function Table.Count( t )
	local i = 0

	for k in pairs(t) do
		i = i + 1
	end

	return i
end

function Table.Random( t )
	local rk = math.random(1, Table.Count(t))

	local i = 1

	for k, v in pairs(t) do
		if i == rk then
			return v, k
		end

		i = i + 1
	end
end

function Table.IsSequential( t )
	local i = 1

	for key, value in pairs(t) do
		if t[i] == nil then return false end	
		i = i + 1
	end

	return true
end

function Table.GetFirstKey( t )
	local k, v = next(t)
	return k
end

function Table.GetFirstValue( t )
	local k, v = next(t)
	return v
end

function Table.GetLastKey( t )
	local k, v = next(t, Table.Count(t) - 1)
	return k
end

function Table.GetLastValue( t )
	local k, v = next(t, Table.Count(t) - 1)
	return v
end

function Table.FindNext( tab, val )
	local bfound = false

	for k, v in pairs( tab ) do
		if bfound then return v end
		if val == v then bfound = true end
	end

	return Table.GetFirstValue(tab)
end

function Table.FindPrev( tab, val )
	local last = Table.GetLastValue(tab)

	for k, v in pairs(tab) do
		if val == v then return last end
		last = v
	end

	return last
end

function Table.KeyFromValue( tbl, val )
	for key, value in pairs(tbl) do
		if value == val then return key end
	end
end

function Table.RemoveByValue( tbl, val )
	local key = Table.KeyFromValue(tbl, val)

	if not key then return false end

	if isnumber(key) then
		table.remove(tbl, key)
	else
		tbl[key] = nil
	end

	return key
end

function Table.ForEach( tab, func )
	for k, v in pairs(tab) do
		if func(k, v) then
			break
		end
	end
end

function Table.GetKeys( tab )
	local keys = {}
	local id = 1

	for k, v in pairs(tab) do
		keys[id] = k
		id = id + 1
	end

	return keys
end

return Table

--< END MODULE DEFINITION >--
log.info("[MHR Menu] Object loaded");

--------------------
-- MHR Menu Table --
--------------------

--< MODULE DEFINITION >--

local Object = {}

function Object.Field( obj, field, value )
    if not value then
        return obj:get_field(field)
    end

    obj:set_field(field, value)

    return value
end

function Object.Field_Raw( obj, datatype, offset, value )
    if not value then
        if datatype == "byte" then
            return obj:read_byte(offset)
        elseif datatype == "short" then
            return obj:read_short(offset)
        elseif datatype == "int" then
            return obj:read_dword(offset)
        elseif datatype == "long" then
            return obj:read_qword(offset)
        elseif datatype == "float" then
            return obj:read_float(offset)
        elseif datatype == "double" then
            return obj:read_double(offset)
        else
            return nil
        end
    end

    if datatype == "byte" then
        obj:write_byte(offset, value)
    elseif datatype == "short" then
        obj:write_short(offset, value)
    elseif datatype == "int" then
        obj:write_dword(offset, value)
    elseif datatype == "long" then
        obj:write_qword(offset, value)
    elseif datatype == "float" then
        obj:write_float(offset, value)
    elseif datatype == "double" then
        obj:write_double(offset, value)
    else
        return nil
    end

    return value
end

return Object

--< END MODULE DEFINITION >--
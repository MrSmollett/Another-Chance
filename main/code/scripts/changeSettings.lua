M = {}

local LFW = require("code.libs.libFileWork")
local json = require("json")


M.initSetFile = function()
    settingsDef = {
        ["volume"] = 50,
        ["graphics"] = "medium",
        ["devModEnable"] = false,
        ["showDialogs"] = true,
    }

    local settingsMem = LFW.Read("settings.txt")
        if settingsMem == false then
            LFW.Write(json.encode( settingsDef, { indent=true } ), "settings.txt")
        else
            settings = json.decode(settingsMem)
        end
    end

M.insertSet = function(key, value)
    settings[key] = value
end

M.saveSet = function()
    LFW.Write(json.encode( settings, { indent=true } ), "settings.txt")
end


    return M
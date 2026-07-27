
local function isLidClosed()
    local file = io.open("/proc/acpi/button/lid/LID/state", "r")
    local state = file:read()
    file:close()

    return state == "state:      closed" 
end

local function reload()
    hl.exec_cmd("hyprctl reload")
    hl.exec_cmd("~/.local/bin/reload-waybar")
end

local builtin = {
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "0x550",
    scale    = 1.25,
    disabled = isLidClosed()
}

local external = {
    output   = "HDMI-1-0",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
}

local function load()
    hl.monitor(builtin)
    hl.monitor(external)

    hl.bind("switch:Lid Switch", function ()
        local closed = isLidClosed()
        local msg

        hl.monitor({ output = builtin.output, disabled = closed })
        reload()

        if closed then
            msg = "closed"
        else
            msg = "opened"
        end
        
        hl.exec_cmd("notify-send \"Lid Switch\" \"Lid Switch " .. msg .. ".\"")
    end, { locked = true })
end

return {
    builtin  = builtin,
    external = external,
    load     = load
}

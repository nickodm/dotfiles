--- Monitors module

local function isLidClosed()
    local file = io.open("/proc/acpi/button/lid/LID/state", "r")
    local state = file:read()
    file:close()

    return state == "state:      closed" 
end

local builtin = {
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "0x550",
    scale    = 1.2,
    disabled = isLidClosed()
}

local external = {
    output   = "HDMI-A-1",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
}

local mirroring = false

local function toggleMirroring()
    local src = ""

    if not mirroring then
        src = builtin.output
    end

    hl.monitor({ output = external.output, mirror = src })
    mirroring = not mirroring
end

local function reload()
    hl.exec_cmd("~/.local/bin/reload-waybar")
end

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
    toggleMirroring = toggleMirroring,
    load     = load
}

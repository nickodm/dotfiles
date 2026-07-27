
local core = require("lib.core")

local function autostart()
    hl.exec_cmd(core.wallpaper)
    hl.exec_cmd(core.bar)
    hl.exec_cmd(core.noti)
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("copyq --start-server")
end

local function load()
    hl.on("hyprland.start", autostart)
end

return {
    load = load
}

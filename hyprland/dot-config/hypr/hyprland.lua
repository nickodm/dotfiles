
local core        = require("lib.core")
local input       = require("lib.input")
local monitors    = require("lib.monitors")
local autostart   = require("lib.autostart")
local lnf         = require("lib.lookandfeel")
local permissions = require("lib.permissions")
local keybinds    = require("lib.keybindings")
local windowrules = require("lib.windowrules")

input.load()
monitors.load()
keybinds.load()
lnf.load()
permissions.load()
windowrules.load()
autostart.load()


hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

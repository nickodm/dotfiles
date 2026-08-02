
----- ENVIRONMENT VARIABLES -----

local lang = "en_GB.UTF-8"

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LANG", lang)

-- To make Dolphin use my accent color =)
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_QPA_PLATFORM", "wayland")

return {
    mainMod     = "SUPER",
    fileManager = "dolphin",
    browser     = "firefox",
    screenshot  = "flameshot gui",
    bar         = "waybar",
    noti        = "mako",
    terminal    = "alacritty",
    wallpaper   = "hyprpaper",
    menu        = "wofi -S drun",
    calculator  = "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=qalculate-gtk io.github.Qalculate",
    
    lang        = lang
}

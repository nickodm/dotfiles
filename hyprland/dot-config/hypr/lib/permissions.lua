
local function load()
    hl.permission("/usr/lib/xdg-desktop-portal-hyprland", "screencopy", "allow")
    hl.permission("/usr/bin/flameshot", "screencopy", "allow")
end

return {
    load = load
}

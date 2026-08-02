--- Hyprland keybindings.

local core = require("lib.core")
local monitors = require("lib.monitors")
local mainMod = core.mainMod

local function systemKeys()
    hl.bind(mainMod .. " + DELETE", hl.dsp.exec_cmd("hyprlock"))
    hl.bind(mainMod .. " + SHIFT + DELETE", hl.dsp.exec_cmd("systemctl hibernate"))
    -- Shutdown Hyprland
    hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

    hl.bind(mainMod .. " + P", monitors.toggleMirroring)

    -- Brightness
    hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
end

-- App keybindings
local function appKeys()
    hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(core.menu))

    hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(core.fileManager))
    hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(core.browser))
    hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(core.terminal))
    hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(core.clipboard))
    hl.bind("XF86CALCULATOR", hl.dsp.exec_cmd(core.calculator))
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(core.screenshot))
    hl.bind("PRINT", hl.dsp.exec_cmd(core.screenshot))
end

local function workspaceKeys()
    -- Switch workspace
    hl.bind(mainMod .. " + PAGE_UP", hl.dsp.focus({ workspace = "+1" }))
    hl.bind(mainMod .. " + PAGE_DOWN", hl.dsp.focus({ workspace = "-1" }))

    -- Special workspaces
    hl.bind(mainMod .. " + HOME", hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + HOME", hl.dsp.window.move({ workspace = "special:magic" }))

    -- Workspace bindings
    for i = 1, 10 do
        local key = i % 10 -- 10 maps to key 0
        hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end

    -- Move the workspace to another monitor
    hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.workspace.move({ monitor = "+1" }), { release = true })

    -- Swap monitors
    hl.bind(mainMod .. " + W", hl.dsp.workspace.swap_monitors({ monitor1 = "eDP-1", monitor2 = "HDMI-A-1" }))
end

local function windowKeys()
    hl.bind(mainMod .. " + Y", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

    local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())

    local resizeFactor = 200

    -- Resize window
    hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -resizeFactor, y = 0,             relative = true }))
    hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = resizeFactor,  y = 0,             relative = true }))
    hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0,             y = -resizeFactor, relative = true }))
    hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0,             y = resizeFactor,  relative = true }))

    local directions = {
        ["H"] = "left",
        ["L"] = "right",
        ["J"] = "down",
        ["K"] = "up"
    }

    for key, direction in pairs(directions) do
        -- Focus
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }), { release = true })
        -- Move window
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }), { release = true })
    end

    local mouseKeys = {
        lclick = "mouse:272",
        rclick = "mouse:273",
        scroll = "mouse:274",
        down   = "mouse:275",
        up     = "mouse:276"
    }

    hl.bind(mainMod .. " + " .. mouseKeys.lclick, hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + " .. mouseKeys.rclick, hl.dsp.window.resize(), { mouse = true })
    hl.bind(mainMod .. " + " .. mouseKeys.scroll, hl.dsp.window.float(),  { mouse = true })

    hl.bind(mouseKeys.down, hl.dsp.send_shortcut({ mods = "", key = "XF86Copy" }), { mouse = true })
    hl.bind(mouseKeys.up, hl.dsp.send_shortcut({ mods = "", key = "XF86Paste" }), { mouse = true })
end

local function mediaKeys()
    -- Laptop multimedia keys for volume and LCD brightness
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
    hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

    -- Requires playerctl
    hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
end

local function load()
    systemKeys()
    windowKeys()
    workspaceKeys()
    appKeys()
    mediaKeys()
end

return {
    load = load
}

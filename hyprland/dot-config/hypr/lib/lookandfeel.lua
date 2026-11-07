local colors = require("lib.colors")

local function loadCurves()
    hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
    hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
    hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
    hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

    ------------
    -- SPRINGS
    ------------

    hl.curve("easy", {
        type = "spring",
        mass = 1,
        -- The more stiffness, the more speed
        stiffness = 150,
        -- The more damping, the less bounce
        dampening = 18
    })

    ------------
    -- BEZIERS
    ------------

    hl.curve("linear", {
        type = "bezier",
        points = {
            {0, 0},
            {1, 1}
        }
    })

    hl.curve("ease", {
        type = "bezier",
        points = {
            {0.25, 0.1},
            {0.25, 1}
        }
    })
end

local function loadAnimations()
    hl.animation({
        leaf = "workspaces",
        enabled = true,
        speed = 1,
        spring = "easy",
        style = "slide"

    })

    hl.animation({
        leaf = "windows",
        enabled = true,
        speed = 1,
        spring = "easy",
        style = "popin"
    })

    hl.animation({
        leaf = "windowsMove",
        enabled = true,
        speed = 1,
        spring = "easy"
    })

    hl.animation({
        leaf = "layers",
        enabled = true,
        speed = 2,
        bezier = "ease",
        style = "popin"
    })
end

local function load()
    hl.config({
        general = {
            gaps_in  = 1,
            gaps_out = 1,

            border_size = 2,

            col = {
                active_border   = { colors = {colors.blue, colors.cyan, colors.green}, angle = 45 },
                inactive_border = "rgba(595959aa)",
            },

            -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
            resize_on_border = false,

            -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
            allow_tearing = false,

            layout = "dwindle",
        },

        decoration = {
            rounding       = 10,
            rounding_power = 2,

            -- Change transparency of focused and unfocused windows
            active_opacity   = 1.0,
            inactive_opacity = 1.0,

            shadow = {
                enabled      = true,
                range        = 4,
                render_power = 3,
                color        = 0xee1a1a1a,
            },

            blur = { enabled = false }
        },

        animations = {
            enabled = true,
        },
    })


    loadCurves()
    loadAnimations()
    
    hl.config({
        dwindle = {
            preserve_split = true, -- You probably want this
        },
    })

    -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
    hl.config({
        master = {
            new_status = "master",
        },
    })

    -- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
    hl.config({
        scrolling = {
            fullscreen_on_one_column = true,
        },
    })

    hl.config({
        xwayland = {
            force_zero_scaling = true
        }
    })
end

return {
    load = load
}

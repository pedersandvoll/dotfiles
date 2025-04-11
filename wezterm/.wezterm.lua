local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Gruber (base16)'
-- config.color_scheme = 'rose-pine'
config.text_background_opacity = 1.0
config.term = "xterm-256color"
config.window_background_image_hsb = {
    brightness = 0.1,
}
config.colors = {
    background = 'black',
    cursor_bg = "#ff85a2",
    cursor_fg = "black",
    cursor_border = "#ff85a2",
}
config.window_background_opacity = 0.80
-- config.window_background_opacity = 0

-- config.window_background_image = "./Pictures/wallpapers/wezterm/nope.png"
-- config.window_background_image = "./Pictures/wallpapers/wezterm/totoro.jpeg"

config.warn_about_missing_glyphs = false

config.enable_tab_bar = false
-- config.tab_bar_at_bottom = true
--
-- local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
-- bar.apply_to_config(config)
--
-- local sessionizer = wezterm.plugin.require "https://github.com/mikkasendke/sessionizer.wezterm"
-- sessionizer.config = {
--     paths = {
--         "~/dev/go",
--         "~/dev/rust",
--     }
-- }
-- sessionizer.apply_to_config(config)
--
-- local move_around = function(window, pane, direction_wez, direction_nvim)
--     local result = os.execute("env NVIM_LISTEN_ADDRESS=/tmp/nvim" ..
--         pane:pane_id() .. " " .. wezterm.home_dir .. "/.local/bin/wezterm.nvim.navigator" .. " " .. direction_nvim)
--     if result then
--         window:perform_action(
--             wezterm.action({ SendString = "\x17" .. direction_nvim }),
--             pane
--         )
--     else
--         window:perform_action(
--             wezterm.action({ ActivatePaneDirection = direction_wez }),
--             pane
--         )
--     end
-- end
--
-- wezterm.on("move-left", function(window, pane)
--     move_around(window, pane, "Left", "h")
-- end)
--
-- wezterm.on("move-right", function(window, pane)
--     move_around(window, pane, "Right", "l")
-- end)
--
-- wezterm.on("move-up", function(window, pane)
--     move_around(window, pane, "Up", "k")
-- end)
--
-- wezterm.on("move-down", function(window, pane)
--     move_around(window, pane, "Down", "j")
-- end)
--
-- config.leader = {
--     key = 's',
--     mods = 'CTRL',
--     timeout_milliseconds = 2000,
-- }

config.keys = {
    {
        key = "Enter",
        mods = "ALT",
        action = wezterm.action.SendString('\x1b\r')
    },
    -- {
    --     key = '[',
    --     mods = 'LEADER',
    --     action = wezterm.action.ActivateCopyMode,
    -- },
    -- {
    --     key = 'n',
    --     mods = 'LEADER',
    --     action = wezterm.action.ActivateTabRelative(1),
    -- },
    -- {
    --     key = 'p',
    --     mods = 'LEADER',
    --     action = wezterm.action.ActivateTabRelative(-1),
    -- },
    -- {
    --     key = 'w',
    --     mods = 'LEADER',
    --     action = wezterm.action.ShowTabNavigator,
    -- },
    -- {
    --     key = '&',
    --     mods = 'LEADER|SHIFT',
    --     action = wezterm.action.CloseCurrentTab { confirm = true },
    -- },
    -- {
    --     key = "f",
    --     mods = "LEADER",
    --     action = sessionizer.show,
    -- },
    -- {
    --     key = 'h',
    --     mods = 'CTRL',
    --     action = wezterm.action({ EmitEvent = "move-left" }),
    -- },
    -- {
    --     key = 'j',
    --     mods = 'CTRL',
    --     action = wezterm.action({ EmitEvent = "move-down" }),
    -- },
    -- {
    --     key = 'k',
    --     mods = 'CTRL',
    --     action = wezterm.action({ EmitEvent = "move-up" }),
    -- },
    -- {
    --     key = 'l',
    --     mods = 'CTRL',
    --     action = wezterm.action({ EmitEvent = "move-right" }),
    -- },
    -- {
    --     key = 'h',
    --     mods = 'LEADER',
    --     action = wezterm.action.SplitPane {
    --         direction = 'Right',
    --         size = { Percent = 50 },
    --     },
    -- },
    -- {
    --     -- -
    --     key = '-',
    --     mods = 'LEADER',
    --     action = wezterm.action.SplitPane {
    --         direction = 'Down',
    --         size = { Percent = 50 },
    --     },
    -- },
    -- {
    --     key = '{',
    --     mods = 'LEADER|SHIFT',
    --     action = wezterm.action.PaneSelect { mode = 'SwapWithActiveKeepFocus' }
    -- },
}

return config

local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Gruber (base16)'
config.enable_tab_bar = false
config.text_background_opacity = 1.0
config.term = "xterm-256color"
config.window_background_image_hsb = {
    brightness = 0.1,
}
-- config.colors = {
--     background = '#191724'
-- }
-- config.window_background_opacity = 0.40
-- config.window_background_opacity = 0

-- config.window_background_image = "./Pictures/wallpapers/wezterm/nope.png"
-- config.window_background_image = "./Pictures/wallpapers/wezterm/totoro.jpeg"


-- Key bindings for Ctrl+Tab and Ctrl+Shift+Tab to navigate Tmux windows
config.keys = {
    -- Ctrl+Tab (next window in tmux)
    {
        key = 'Tab',
        mods = 'CTRL',
        action = wezterm.action.SendString('\x1b[27;5;9~'),
    },
    -- Ctrl+Shift+Tab (previous window in tmux)
    {
        key = 'Tab',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SendString('\x1b[27;6;9~'),
    },
}

return config
---@diagnostic disable: param-type-mismatch
local base_color = {
    background = '#000000',
    foreground = '#ad8dc2',
}
require('mini.hues').setup(base_color)
require('utils.color').setup_wenvim_color(base_color)

vim.g.colors_name = 'wenvim-blue'

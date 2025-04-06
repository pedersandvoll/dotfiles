local map = require("utils").map
local add, later = MiniDeps.add, MiniDeps.later

-----------------------------------------------------------
-- Smart split for tmux
-----------------------------------------------------------
later(function()
    add({ source = 'mrjones2014/smart-splits.nvim' })
    require('smart-splits').setup()
    map('n', '<M-h>', require('smart-splits').resize_left,
        'Resize split left')
    map('n', '<M-j>', require('smart-splits').resize_down,
        'Resize split down')
    map('n', '<M-k>', require('smart-splits').resize_up,
        'Resize split up')
    map('n', '<M-l>', require('smart-splits').resize_right,
        'Resize split right')
    map('n', '<C-h>', require('smart-splits').move_cursor_left,
        'Move cursor left to split')
    map('n', '<C-j>', require('smart-splits').move_cursor_down,
        'Move cursor down to split')
    map('n', '<C-k>', require('smart-splits').move_cursor_up,
        'Move cursor up to split')
    map('n', '<C-l>', require('smart-splits').move_cursor_right,
        'Move cursor right to split')
    map('n', '<C-\\>', require('smart-splits').move_cursor_previous,
        'Move cursor to previous split')
    map('n', '<leader><leader>h', require('smart-splits').swap_buf_left,
        'Swap buffer to the left')
    map('n', '<leader><leader>j', require('smart-splits').swap_buf_down,
        'Swap buffer down')
    map('n', '<leader><leader>k', require('smart-splits').swap_buf_up,
        'Swap buffer up')
    map('n', '<leader><leader>l', require('smart-splits').swap_buf_right,
        'Swap buffer to the right')
end)

-----------------------------------------------------------
-- Mini Ai
-----------------------------------------------------------
later(function()
    require('mini.ai').setup()
end)

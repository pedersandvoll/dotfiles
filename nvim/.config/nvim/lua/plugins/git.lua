local map = require("utils").map
local add, later = MiniDeps.add, MiniDeps.later

-----------------------------------------------------------
-- Neogit
-----------------------------------------------------------
later(function()
    add({
        source = 'NeogitOrg/neogit',
        depends = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim'
        }
    })
    require('neogit').setup()
    map('n', '<C-g>', '<cmd>Neogit kind=floating<cr>', 'Open neogit')
end)

-----------------------------------------------------------
-- Git signs
-----------------------------------------------------------
later(function()
    add({
        source = 'lewis6991/gitsigns.nvim'
    })
    require('gitsigns').setup()
    map('n', '<leader>gb', '<cmd>Gitsigns blame<cr>', 'Open git blame buffer')
end)

-----------------------------------------------------------
-- Git conflict
-----------------------------------------------------------
later(function()
    add({
        source = 'akinsho/git-conflict.nvim'
    })
    require('git-conflict').setup()
end)

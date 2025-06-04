local map = require("utils").map
local add, later = MiniDeps.add, MiniDeps.later

-----------------------------------------------------------
-- Undotree
-----------------------------------------------------------
later(function()
    add({
        source = 'ruskei/undotree',
        depends = {
            'nvim-lua/plenary.nvim',
        }
    })
    require('undotree').setup()
    map('n', '<leader>u', '<cmd>lua require("undotree").toggle()<cr>', 'Open undotree')
end)

-----------------------------------------------------------
-- trouble.nvim
-----------------------------------------------------------
later(function()
    add({
        source = 'folke/trouble.nvim'
    })
    require('trouble').setup()
end)

-----------------------------------------------------------
-- mssql.nvim
-----------------------------------------------------------
later(function()
    add({
        source = 'Kurren123/mssql.nvim'
    })
    require('mssql').setup({ keymap_prefix = '<leader>ms' })
end)

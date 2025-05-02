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

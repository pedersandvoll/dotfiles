local map = require("utils").map
local add, later = MiniDeps.add, MiniDeps.later

-----------------------------------------------------------
-- Kulala
-----------------------------------------------------------
later(function()
    add({
        source = 'mistweaverco/kulala.nvim'
    })
    local kulala = require('kulala')
    kulala.setup({})

    map("n", "<leader>rr", function() kulala.run() end, "Kulala run")
    map("n", "<leader>ra", function() kulala.run_all() end, "Kulala run all")
    map("n", "<leader>rb", function() kulala.scratchpad() end, "Kulala open scratchpad")
end)

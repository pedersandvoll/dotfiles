local later, add = MiniDeps.later, MiniDeps.add

-----------------------------------------------------------
-- Pairs
-----------------------------------------------------------
-- now(function()
--     require('mini.completion').setup({
--         mappings = {
--             scroll_up = '<C-p>',
--             scroll_down = '<C-n>'
--         }
--     })
-- end)

-----------------------------------------------------------
-- Pairs
-----------------------------------------------------------
later(function()
    require('mini.pairs').setup()
end)

-----------------------------------------------------------
-- Surround
-----------------------------------------------------------
later(function()
    require('mini.surround').setup()
end)

-----------------------------------------------------------
-- Snippets
-----------------------------------------------------------
-- later(function()
--     local gen_loader = require('mini.snippets').gen_loader
--     require('mini.snippets').setup({
--         snippets = {
--             gen_loader.from_file('~/.config/nvim/snippets/global.json')
--         }
--     })
-- end)

-----------------------------------------------------------
-- Grug FAR
-----------------------------------------------------------
later(function()
    add({
        source = 'MagicDuck/grug-far.nvim'
    })
    require('grug-far').setup()
end)

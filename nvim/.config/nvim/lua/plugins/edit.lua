local now, later = MiniDeps.now, MiniDeps.later

-----------------------------------------------------------
-- Pairs
-----------------------------------------------------------
now(function()
    require('mini.completion').setup({
        mappings = {
            scroll_up = '<C-p>',
            scroll_down = '<C-n>'
        }
    })
end)

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
later(function()
    local gen_loader = require('mini.snippets').gen_loader
    require('mini.snippets').setup({
        snippets = {
            gen_loader.from_file('~/.config/nvim/snippets/global.json')
        }
    })
end)

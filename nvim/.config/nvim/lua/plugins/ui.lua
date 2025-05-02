local now, later, add = MiniDeps.now, MiniDeps.later, MiniDeps.add

-----------------------------------------------------------
-- Icons
-----------------------------------------------------------
now(function()
    require('mini.icons').setup()
end)

-----------------------------------------------------------
-- Notifications
-----------------------------------------------------------
now(function()
    require('mini.notify').setup()
end)

-----------------------------------------------------------
-- Statusline
-----------------------------------------------------------
now(function()
    require('mini.statusline').setup()
end)

-----------------------------------------------------------
-- Indent
-----------------------------------------------------------
now(function()
    require('mini.indentscope').setup()
end)

-----------------------------------------------------------
-- Color Patterns
-----------------------------------------------------------
later(function()
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
        highlighters = {
            -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
            fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
            hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
            todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
            note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })
end)

-----------------------------------------------------------
-- Trailspace
-----------------------------------------------------------
later(function()
    require('mini.trailspace').setup()
end)

-----------------------------------------------------------
-- Cursorword
-----------------------------------------------------------
later(function()
    require('mini.cursorword').setup()
end)

-----------------------------------------------------------
-- Typr
-----------------------------------------------------------
later(function()
    add({
        source = "nvzone/typr",
        depends = {
            "nvzone/volt"
        }
    })
    require("typr").setup()
end)

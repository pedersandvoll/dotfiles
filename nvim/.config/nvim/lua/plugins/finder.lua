local map = require("utils").map
local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

-----------------------------------------------------------
-- Fuzzy finder
-----------------------------------------------------------
later(function()
    local win_config = function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        return {
            anchor = 'NW',
            height = height,
            width = width,
            row = math.floor(0.5 * (vim.o.lines - height)),
            col = math.floor(0.5 * (vim.o.columns - width)),
        }
    end
    require('mini.pick').setup({
        mappings = {
            move_down = "<C-j>",
            move_up = "<C-k>"
        },
        window = {
            config = win_config
        }
    })
    require('mini.extra').setup()

    vim.ui.select = MiniPick.ui_select
    local show_with_icons = function(buf_id, items, query)
        return MiniPick.default_show(buf_id, items, query, { show_icons = true })
    end

    MiniPick.registry.grep_args = function()
        local args = vim.fn.input('Ripgrep args: ')
        local command = {
            'rg',
            '--column',
            '--line-number',
            '--no-heading',
            '--field-match-separator=\\0',
            '--no-follow',
            '--color=never',
        }
        local args_table = vim.fn.split(args, ' ')
        vim.list_extend(command, args_table)

        return MiniPick.builtin.cli(
            { command = command },
            { source = { name = string.format('Grep (rg %s)', args), show = show_with_icons } }
        )
    end

    map('n', '<leader>ff', '<cmd>Pick files<cr>', 'Pick files')
    map('n', '<leader>fG', '<cmd>Pick grep_args<cr>', 'Pick grep with rg args')
    map('n', '<leader>fa', '<cmd>Pick resume<cr>', 'Pick resume')
    map('n', '<leader>fs', '<cmd>Pick grep_live<cr>', 'Pick grep live')
    map('n', '<leader>fc', "<cmd>Pick lsp scope='references'<cr>", 'Pick references')
end)

-----------------------------------------------------------
-- File explorer
-----------------------------------------------------------
later(function()
    require('mini.files').setup()
    map('n', '<C-n>', function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
        MiniFiles.open(path)
        MiniFiles.reveal_cwd()
    end, 'Open file picker')
end)

-----------------------------------------------------------
-- Visits
-----------------------------------------------------------
later(function()
    require('mini.visits').setup()
    map('n', '<leader>mh', '<cmd>lua MiniVisits.select_path()<cr>')
end)

-----------------------------------------------------------
-- Harpoon
-----------------------------------------------------------
later(function()
    add({
        source = 'ThePrimeagen/harpoon',
        checkout = 'harpoon2',
        depends = {
            'nvim-lua/plenary.nvim'
        },
    })

    local harpoon = require("harpoon")

    harpoon:setup()

    map("n", "<leader>a", function() harpoon:list():add() end, "Add file to harpoon list")
    map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle harpoon list")

    map("n", "<leader>hq", function() harpoon:list():select(1) end, "Jump to file 1 of harpoon list")
    map("n", "<leader>hw", function() harpoon:list():select(2) end, "Jump to file 2 of harpoon list")
    map("n", "<leader>he", function() harpoon:list():select(3) end, "Jump to file 3 of harpoon list")
    map("n", "<leader>hr", function() harpoon:list():select(4) end, "Jump to file 4 of harpoon list")
end)

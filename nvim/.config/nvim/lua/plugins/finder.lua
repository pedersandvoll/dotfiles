local map = require("utils").map
local later = MiniDeps.later

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
    map('n', '<C-n>', MiniFiles.open, 'Open file picker')
end)

return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.cursorword").setup()
            require("mini.move").setup()
            require("mini.diff").setup()
            require("mini.visits").setup()
            require("mini.ai").setup()
            require("mini.comment").setup()
            require("mini.indentscope").setup({})
            require("mini.surround").setup()
            -- require("mini.sessions").setup()
            -- require("mini.hues").setup({})
        end,
    },
    -- {
    --   "echasnovski/mini.hues",
    --   version = "*",
    --   opts = {
    --     background = "#1c1c1c",
    --     foreground = "#87afaf",
    --     saturation = "high",
    --   },
    -- },
    {
        "echasnovski/mini.pick",
        config = function()
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

            require("mini.pick").setup({
                mappings = {
                    move_down = "<C-j>",
                    move_up = "<C-k>"
                },
                options = {
                    content_from_bottom = true,
                    use_cache = true,
                },
                window = {
                    config = win_config
                }
            })

            vim.keymap.set("n", "<leader>ff", function()
                require('mini.pick').builtin.files()
            end, { desc = "Fuzzy find files in cwd" })
            vim.keymap.set("n", "<leader>fa", function()
                require('mini.pick').builtin.resume()
            end, { desc = 'Find File' })
            vim.keymap.set("n", "<leader>fs", function()
                require('mini.pick').builtin.grep_live()
            end, { desc = "Fuzzy find files in cwd" })
            vim.keymap.set("n", "<leader>fc", function()
                local wrd = vim.fn.expand("<cword>")
                require('mini.pick').builtin.grep({ pattern = wrd })
            end, { desc = "Fuzzy find files in cwd" })
        end
    }
}

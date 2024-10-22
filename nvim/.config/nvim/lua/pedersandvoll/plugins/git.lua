return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            "ibhagwan/fzf-lua",       -- optional
        },
        config = function()
            require("neogit").setup({})
            local neogit = require("neogit")

            vim.keymap.set("n", "<C-g>", function()
                neogit.open({ kind = "vsplit" })
            end, { desc = "Neogit" })
        end,
    },
    {
        "akinsho/git-conflict.nvim",
        event = "BufReadPre",
        version = "*",
        opts = {
            disable_diagnostics = true,
        },
    },
    {
        "f-person/git-blame.nvim",
        -- load the plugin at startup
        event = "VeryLazy",
        -- Because of the keys part, you will be lazy loading this plugin.
        -- The plugin wil only load once one of the keys is used.
        -- If you want to load the plugin at startup, add something like event = "VeryLazy",
        -- or lazy = false. One of both options will work.
        opts = {
            -- your configuration comes here
            -- for example
            enabled = false, -- if you want to enable the plugin
            message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
            date_format = "%d-%m-%Y %H:%M:%S", -- template for the date, check Date format section for more options
            virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
        },
    },
}

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "qms",
                path = "~/vaults/qms",
            },
            {
                name = "work",
                path = vim.fn.expand("$HOME/vaults/work"),
            },
            {
                name = "ope",
                path = vim.fn.expand("$HOME/vaults/work/ope/"),
            },
            -- {
            --     name = "opeDirectory",
            --     path = vim.fn.expand("$HOME/netpowerDev/ope/operation-privacy-enforcer/"),
            -- },
        },
        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes.
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
            -- Smart action depending on context, either follow link or toggle checkbox.
            ["gd"] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
            }
        },
    },
}

return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                disable_background = true,
                disable_float_background = true,
                palette = {
                    main = {
                        base = "#000000"
                    }
                },
                -- highlight_groups = {
                --     StatusLine = { fg = "iris", bg = "iris", blend = 10 },
                --     StatusLineNC = { fg = "subtle", bg = "surface" },
                -- },
            })
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
        config = function()
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

            vim.api.nvim_set_hl(0, "MiniPickNormal", { link = "Normal" })
            vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickBorderBusy", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickBorderText", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickCursor", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickIconDirectory", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickIconFile", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickHeader", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickMatchMarked", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickMatchRanges", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickPreviewLine", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickPreviewRegion", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickPrompt", { bg = "NONE" })
        end
    },
    {
        "comfysage/evergarden",
        priority = 1000,
        opts = {
            transparent_background = true,
            variant = "medium",
        },
        config = function(_, opts)            -- opts is automatically passed as the second argument
            require("evergarden").setup(opts) -- Pass opts to the plugin setup

            -- Your custom highlights
            vim.api.nvim_set_hl(0, "MiniPickNormal", { link = "Normal" })
            vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickBorderBusy", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickBorderText", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickCursor", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickIconDirectory", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickIconFile", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickHeader", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickMatchMarked", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickMatchRanges", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickPreviewLine", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickPreviewRegion", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "MiniPickPrompt", { bg = "NONE" })
        end,
    },
    {
        "0xstepit/flow.nvim",
        lazy = false,
        priority = 1000,
        tag = "vX.0.0",
        opts = {
            theme = {
                transparent = true
            }
        },
    },
    {
        "zaldih/themery.nvim",
        config = function()
            require("themery").setup({
                themes = { "gruvbox", "rose-pine", "gruber-darker", "evergarden", "flow" },
                livePreview = true,
            })
        end
    },
}

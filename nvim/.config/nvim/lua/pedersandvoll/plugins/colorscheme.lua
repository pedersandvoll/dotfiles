return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
    },
    {
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                -- disable_background = true,
                -- disable_float_background = true,
                palette = {
                    main = {
                        base = "#000000"
                    }
                },
                highlight_groups = {
                    StatusLine = { fg = "iris", bg = "iris", blend = 10 },
                    StatusLineNC = { fg = "subtle", bg = "surface" },
                },
            })
        end
    },
    {
        "aliqyan-21/darkvoid.nvim",
        priority = 1000,
    },
    {
        "zaldih/themery.nvim",
        config = function()
            require("themery").setup({
                themes = { "gruvbox", "rose-pine", "gruber-darker", "darkvoid" },
                livePreview = true,
            })
        end
    },
    {
        "xiyaowong/transparent.nvim"
    },
}

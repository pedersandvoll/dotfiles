return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("gruvbox")
            vim.api.nvim_set_hl(0, "Normal", { bg = "#222222" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#222222" })
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        priority = 1000,
    },
    {
        "slugbyte/lackluster.nvim",
        priority = 1000,
    },
    {
        "zaldih/themery.nvim",
        config = function()
            require("themery").setup({
                themes = { "gruvbox", "rose-pine", "gruber-darker", "lackluster" },
                livePreview = true,
            })
        end
    },
    {
        "xiyaowong/transparent.nvim"
    },
}

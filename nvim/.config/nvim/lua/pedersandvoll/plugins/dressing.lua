return {
    'stevearc/dressing.nvim',
    opts = {},
    config = function()
        require("dressing").setup({
            select = { backend = { "fzf_lua", "telescope" } }
        })
    end
}

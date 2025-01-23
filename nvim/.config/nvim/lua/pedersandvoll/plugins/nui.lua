return {
    "muniftanjim/nui.nvim",
    -- event = "LazyFile",
    config = function()
        require("pedersandvoll.plugins.quickfix").setup()
    end,
}

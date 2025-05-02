local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add({
        source = "rose-pine/neovim",
        name = "rose-pine"
    })
    require("rose-pine").setup({
        styles = {
            transparency = true,
        }
    })
    require('mini.colors').setup()
    -- vim.cmd.colorscheme('wenvim-brown')
    -- vim.cmd.colorscheme('wenvim-dark')
    -- vim.cmd.colorscheme('wenvim-purple')
    vim.cmd.colorscheme('rose-pine')
end)

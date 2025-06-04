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

    add({
        source = "zootedb0t/citruszest.nvim",
    })
    require('citruszest').setup({
        option = {
            transparent = true,
        }
    })

    add({
        source = "folke/tokyonight.nvim",
    })
    require('tokyonight').setup({
        transparent = true,
    })

    -- vim.cmd.colorscheme('rose-pine')
    -- vim.cmd.colorscheme('citruszest')
    vim.cmd.colorscheme('tokyonight')
end)

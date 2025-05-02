local add, later = MiniDeps.add, MiniDeps.later

-----------------------------------------------------------
-- Avante
-----------------------------------------------------------
add({
    source = 'yetone/avante.nvim',
    depends = {
        'nvim-treesitter/nvim-treesitter',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'echasnovski/mini.icons'
    },
    hooks = { post_checkout = function() vim.cmd('make') end }
})
later(function()
    require('avante').setup({})
end)

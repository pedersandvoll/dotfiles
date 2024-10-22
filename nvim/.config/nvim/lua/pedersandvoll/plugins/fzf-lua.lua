return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({})
        vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "Fuzzy find files in cwd" })
        vim.keymap.set("n", "<leader>fr", "<cmd>lua require('fzf-lua').oldfiles()<CR>",
            { desc = "Fuzzy find recent files" })
        vim.keymap.set("n", "<leader>fs", "<cmd>lua require('fzf-lua').live_grep()<CR>", { desc = "Find string in cwd" })
        vim.keymap.set("n", "<leader>fc", "<cmd>lua require('fzf-lua').grep_cword()<CR>",
            { desc = "Find string under cursor in cwd" })
        vim.keymap.set("n", "<leader>fe", "<cmd>lua require('fzf-lua').diagnostics_workspace()<CR>",
            { desc = "Find all lsp errors" })
    end
}

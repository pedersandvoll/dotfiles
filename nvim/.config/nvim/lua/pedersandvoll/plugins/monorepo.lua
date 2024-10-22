return {
    "imNel/monorepo.nvim",
    config = function()
        require("monorepo").setup({})
        -- vim.keymap.set("n", "<C-m>", function()
        --     require("telescope").extensions.monorepo.monorepo()
        -- end)
        vim.keymap.set("n", "<leader>n", function()
            require("monorepo").toggle_project()
        end)
        vim.keymap.set("n", "<leader>k", function()
            require("monorepo").next_project()
        end)
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
        vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
        vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
        vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
    end
}
-- return {
--     -- "folke/trouble.nvim",
--     "xero/trouble.nvim", -- till my pr is merged
--     branch = "custom-indent",
--     event = "VeryLazy",
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--     config = function()
--         require("trouble").setup({
--             auto_fold = false,
--             fold_open = " ",
--             fold_closed = " ",
--             height = 6,
--             indent_str = " ┊   ",
--             include_declaration = {
--                 "lsp_references",
--                 "lsp_implementations",
--                 "lsp_definitions"
--             },
--             mode = "workspace_diagnostics",
--             multiline = true,
--             padding = false,
--             position = "bottom",
--             severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
--             -- signs = require("utils.icons").diagnostics,
--             use_diagnostic_signs = true,
--         })
--         local r = require("utils.remaps")
--         r.noremap("n", "<leader>lr", ":TroubleToggle lsp_references<cr>", "lsp references ")
--         r.noremap("n", "<leader>le", ":TroubleToggle document_diagnostics<cr>", "diagnostics")
--         r.noremap("n", "<leader>t", function()
--             require("lsp_lines").toggle()
--             vim.cmd [[TroubleToggle workspace_diagnostics]]
--         end, "toggle trouble  ")
--     end,
-- }

return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
} -- return {
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

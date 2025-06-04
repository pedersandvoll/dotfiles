require("config.options")
require("config.deps")
require("config.keymaps")

-- vim.lsp.enable({
--     "luals",
--     "gopls",
--     "tsls",
--     "eslint",
--     "efm",
--     "roslyn"
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "lua", "go" },
--     callback = function()
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = vim.api.nvim_get_current_buf(),
--             callback = function()
--                 vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--             end,
--         })
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
--     callback = function()
--         vim.lsp.buf.format({
--             filter = function(client)
--                 return client.name == "efm" -- Only efm-langserver formats
--             end,
--         })
--     end,
-- })

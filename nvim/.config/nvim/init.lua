require("config.options")
require("config.deps")
require("config.keymaps")

vim.lsp.enable({ "luals", "gopls", "tsls", "eslint", "efm" })

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if client:supports_method("textDocument/completion") then
--             vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
--         end
--     end
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "go", "lua" },
--   callback = function()
--     vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { buffer = true, desc = "Format with LSP" })
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "go" },
    callback = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = vim.api.nvim_get_current_buf(),
            callback = function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end,
        })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
    callback = function()
        vim.lsp.buf.format({
            filter = function(client)
                return client.name == "efm" -- Only efm-langserver formats
            end,
        })
    end,
})

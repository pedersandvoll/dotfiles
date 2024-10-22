return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
        require("typescript-tools").setup {
            on_attach =
                function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            settings = {
                seperate_diagnostic_server = true,
                publish_diagnostic_on = "insert_leave"
            }
        }
    end
}

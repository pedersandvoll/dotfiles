return {
    cmd = { "efm-langserver", "-c", vim.fn.expand("~/.config/efm-langserver/config.yaml") },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
    init_options = { documentFormatting = true },
    settings = {
        rootMarkers = { ".git/", "package.json" }, -- Helps EFM find the project root
        languages = {},                            -- Defined in the config.yaml
    },
}

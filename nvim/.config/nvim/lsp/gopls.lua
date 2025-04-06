return {
    cmd = { "gopls" },
    filetypes = { "go" },
    formatters = {
        ignoreComments = false,
    },
    settings = {
        gopls = {
            directoryFilters = { "-.git", "-.vscode" }, -- Ignore these directories
            analyses = {
                unusedparams = false,                   -- Disable certain analyses
            },
            gofumpt = true,                             -- use gofumpt for formatting
            env = {
                GO111MODULE = "on",                     --Ensure go mod
            }
        },
    },
}

local M = {}

-- Function to create colored diagnostic text
local function colored_circle(severity)
    -- Get the diagnostic color and statusline background color
    local diag_fg = vim.fn.synIDattr(vim.fn.hlID("Diagnostic" .. severity), "fg#")
    local status_bg = vim.fn.synIDattr(vim.fn.hlID("StatusLine"), "bg#")

    -- Create a temporary highlight group
    local hl_group = "DiagnosticCircle" .. severity
    vim.cmd(string.format("highlight %s guifg=%s guibg=%s", hl_group, diag_fg, status_bg))

    return string.format("%%#%s#⭘%%#StatusLine# ", hl_group)
end

-- Diagnostic icons with colored circles
M.icons = {
    Error = colored_circle("Error"),
    Warn = colored_circle("Warn"),
    Info = colored_circle("Info"),
    Hint = colored_circle("Hint"),
}

M.diagnostics = function()
    -- Get diagnostics for current buffer
    local diagnostics = vim.diagnostic.get(0)
    local counts = {
        errors = 0,
        warnings = 0,
        info = 0,
        hints = 0
    }

    -- Count each diagnostic by severity
    for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
            counts.errors = counts.errors + 1
        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            counts.warnings = counts.warnings + 1
        elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            counts.info = counts.info + 1
        elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            counts.hints = counts.hints + 1
        end
    end

    local result = {}
    if counts.errors > 0 then
        table.insert(result, M.icons.Error .. counts.errors)
    end
    if counts.warnings > 0 then
        table.insert(result, M.icons.Warn .. counts.warnings)
    end
    if counts.info > 0 then
        table.insert(result, M.icons.Info .. counts.info)
    end
    if counts.hints > 0 then
        table.insert(result, M.icons.Hint .. counts.hints)
    end

    return table.concat(result, " ")
end

return M

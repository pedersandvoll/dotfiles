local M = {}

M.diagnostics = function()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for k, level in pairs(levels) do
        count[k] = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[level] })
    end

    local result = {}
    if count["errors"] > 0 then
        table.insert(result, "E:" .. count["errors"])
    end
    if count["warnings"] > 0 then
        table.insert(result, "W:" .. count["warnings"])
    end
    if count["info"] > 0 then
        table.insert(result, "I:" .. count["info"])
    end
    if count["hints"] > 0 then
        table.insert(result, "H:" .. count["hints"])
    end

    return table.concat(result, " ")
end

return M

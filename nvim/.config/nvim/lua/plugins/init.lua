local M = {}

function M.setup()
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/plugins', [[v:val =~ '\.lua$']])) do
        local module = file:gsub('%.lua$', '')
        if module ~= 'init' then require('plugins.' .. module) end
    end
end

return M

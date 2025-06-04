local map = require("utils").map

map('n', '<leader>sv', '<C-w>v', 'Split window vertically')
map('n', '<leader>sh', '<C-w>s', 'Split window horizontally')
map('n', '<leader>sx', '<cmd>close<cr>', 'Close current split')
map('n', '<leader>nh', '<cmd>nohl<cr>', 'Remove highlighted keyword')

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', 'Go to definition')
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Open code actions')
map('n', '<leader>fr', '<cmd>lua vim.lsp.buf.references()<cr>', 'Find references')
map('n', 'sfe', '<cmd>lua vim.diagnostic.open_float()<cr>', 'Show full error message')

map('n', '<leader>j', '<cmd>cnext<cr>', 'Jump to next in qf list')
map('n', '<leader>k', '<cmd>cprevious<cr>', 'Jump to previos in qf list')

local hover_opts = {
    border = "rounded",
    max_width = 120,
    winopts = {
        conceallevel = 3,
    },
}
map('n', 'K', function() return vim.lsp.buf.hover(hover_opts) end, 'Hover')

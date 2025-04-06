local map = require("utils").map

map('n', '<leader>sv', '<C-w>v', 'Split window vertically')
map('n', '<leader>sh', '<C-w>s', 'Split window horizontally')
map('n', '<leader>sx', '<cmd>close<cr>', 'Close current split')
map('n', '<leader>nh', '<cmd>nohl<cr>', 'Remove highlighted keyword')

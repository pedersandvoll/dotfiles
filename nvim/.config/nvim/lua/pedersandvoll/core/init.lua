require("pedersandvoll.core.options")
require("pedersandvoll.core.keymaps")

local augroup = vim.api.nvim_create_augroup
local lsp_group = augroup("lsp_group_p", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

local border = {
    { "╭", "FloatBorder" }, { "─", "FloatBorder" }, { "╮", "FloatBorder" },
    { "│", "FloatBorder" }, { "╯", "FloatBorder" }, { "─", "FloatBorder" },
    { "╰", "FloatBorder" }, { "│", "FloatBorder" }
}

-- Set up the LSP handler for hover with border
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = border,
    winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None"
})

local keymap = vim.keymap -- for conciseness

-- vim.api.nvim_create_autocmd("VimEnter", {
--     command = "set laststatus=0"
-- })

-- Inform Neovim how to enable and disable undercurl in wezterm
-- vim.o.t_Cs = '\27[60m' -- equivalent to \e[60m
-- vim.o.t_Ce = '\27[24m' -- equivalent to \e[24m

-- Set highlight groups for spelling
vim.api.nvim_set_hl(0, 'SpellBad', { sp = 'red', underline = true, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { sp = 'yellow', underline = true, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { sp = 'blue', underline = true, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = 'orange', underline = true, undercurl = true })

-- Enable spell checking
-- vim.o.spell = true


vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }
        local builtin = require('telescope.builtin')

        opts.desc = "Show full error"
        keymap.set("n", "sfe", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", builtin.lsp_definitions, opts)
        -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        -- Integrating better-diagnostic-virtual-text for the current buffer
        -- require("better-diagnostic-virtual-text.api").setup_buf(ev.buf, {
        --     -- Custom options can be provided here, if necessary
        --     -- For example, you might customize the prefix or the highlight group
        --     -- prefix = '💡',
        --     -- highlight = 'DiagnosticVirtualTextWarning',
        --     -- inline = false,
        -- })
    end,
})

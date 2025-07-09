local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add({
        source = "rose-pine/neovim",
        name = "rose-pine"
    })
    require("rose-pine").setup({
        styles = {
            transparency = true,
        }
    })

    add({
        source = "zootedb0t/citruszest.nvim",
    })
    require('citruszest').setup({
        option = {
            transparent = true,
        }
    })

    add({
        source = "folke/tokyonight.nvim",
    })
    require('tokyonight').setup({
        transparent = true,
    })

    add({
        source = "eldritch-theme/eldritch.nvim",
    })
    require("eldritch").setup({
        transparent = true,
    })

    add({
        source = "ficcdaf/ashen.nvim",
    })
    require("ashen").setup({
        transparent = true,
    })

    vim.cmd.colorscheme('rose-pine')
    -- vim.cmd.colorscheme('citruszest')
    -- vim.cmd.colorscheme('ashen')
end)

-- now(function()
--     add({
--         source = "tinted-theming/tinted-vim"
--     })
--
--     -- local default_theme = "base24-banana-blueberry"
--     local default_theme = "base16-bright"
--
--     local function get_tinty_theme()
--         local theme_name = vim.fn.system("tinty current &> /dev/null && tinty current")
--
--         if vim.v.shell_error ~= 0 then
--             return default_theme
--         else
--             return vim.trim(theme_name)
--         end
--     end
--
--     local function handle_focus_gained()
--         local new_theme_name = get_tinty_theme()
--         local current_theme_name = vim.g.colors_name
--
--         if current_theme_name ~= new_theme_name then
--             vim.cmd.colorscheme(new_theme_name)
--         end
--     end
--
--     local function main()
--         vim.o.termguicolors = true
--         vim.g.tinted_colorspace = 256
--         local current_theme_name = get_tinty_theme()
--
--         vim.cmd.colorscheme(current_theme_name)
--
--         vim.api.nvim_create_autocmd("FocusGained", {
--             callback = handle_focus_gained,
--         })
--     end
--
--     main()
-- end)

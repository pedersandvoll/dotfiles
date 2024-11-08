return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
        },

        config = function()
            local cmp = require("cmp")
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            workspace = {
                                checkThirdparty = false,
                                library = {
                                    "${3rd}/luv/library",
                                    unpack(vim.api.nvim_get_runtime_file("", true)),
                                },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            }
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                },
                handlers = {
                    function(server_name)
                        local cmp_lsp = require("cmp_nvim_lsp")
                        local server = servers[server_name] or {}

                        server.capabilities = vim.tbl_deep_extend(
                            "force",
                            {},
                            vim.lsp.protocol.make_client_capabilities(),
                            cmp_lsp.default_capabilities() or {}
                        )
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
    {
        "iabdelkareem/csharp.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "Tastyep/structlog.nvim",
        },
        config = function()
            require("mason").setup()
            require("csharp").setup()
        end
    },
    {
        'dmmulroy/tsc.nvim',
        config = function()
            local opts = {}

            require('tsc').setup(opts)
        end,
    },
    -- {
    --     'mrcjkb/rustaceanvim',
    --     version = '^5', -- Recommended
    --     lazy = false,   -- This plugin is already lazy
    -- },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    },
}

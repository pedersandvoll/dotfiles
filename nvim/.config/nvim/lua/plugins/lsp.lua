local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

-----------------------------------------------------------
-- Lsp config
-----------------------------------------------------------
now(function()
    add({
        source = "nvim-lspconfig",
        depends = {
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim',
        }
    })
    require("mason").setup({
        registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
        },
    })
    require("mason-lspconfig").setup({
        automatic_enable = true
    })
end)

-----------------------------------------------------------
-- Roslyn
-----------------------------------------------------------
now(function()
    add({
        source = 'seblyng/roslyn.nvim',
    })
    require("roslyn").setup()
end)

-----------------------------------------------------------
-- Conform
-----------------------------------------------------------
now(function()
    add({
        source = 'stevearc/conform.nvim',
    })
    require("conform").setup({
        formatters_by_ft = {
            javascript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true},
            typescriptreact = { "prettierd", "prettier", stop_after_first = true},
            cs = { "csharpier" },
        },
        formatters = {
            csharpier = function()
                local useDotnet = not vim.fn.executable("csharpier")  
                local command = useDotnet and "dotnet csharpier" or "csharpier"
                local version_out = vim.fn.system(command .. " --version")

                local major_version = tonumber((version_out or ""):match("^(%d+)")) or 0
                local is_new = major_version >= 1

                local args = is_new and { "format", "$FILENAME" } or { "--write-stdout" }

                return {
                    command = command,
                    args = args,
                    stdin = not is_new,
                    require_cwd = false,
                }
            end
        }
    })
end)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-----------------------------------------------------------
-- Easy dotnet
-----------------------------------------------------------
later(function()
    add({
        source = "GustavEikaas/easy-dotnet.nvim",
        depends = {
            "nvim-lua/plenary.nvim"
        }
    })
    require("easy-dotnet").setup()
end)


local function rebuild_project(co, path)
  local spinner = require("easy-dotnet.ui-modules.spinner").new()
  spinner:start_spinner "Building"
  vim.fn.jobstart(string.format("dotnet build %s", path), {
    on_exit = function(_, return_code)
      if return_code == 0 then
        spinner:stop_spinner "Built successfully"
      else
        spinner:stop_spinner("Build failed with exit code " .. return_code, vim.log.levels.ERROR)
        error "Build failed"
      end
      coroutine.resume(co)
    end,
  })
  coroutine.yield()
end

-----------------------------------------------------------
-- Dap
-----------------------------------------------------------
later(function()
    add({
        source = "mfussenegger/nvim-dap",
        depends = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui"
        }
    })
    local dap = require("dap")
    local dotnet = require("easy-dotnet")
    local dapui = require("dapui")
    dapui.setup()

    dap.set_log_level("TRACE")
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end


    vim.keymap.set("n", "q", function()
      dap.close()
      dapui.close()
    end, {})

    vim.keymap.set("n", "<leader>c", dap.continue, {})
    vim.keymap.set("n", "<leader>o", dap.step_over, {})
    vim.keymap.set("n", "<leader>dO", dap.step_over, {})
    vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, {})
    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, {})
    vim.keymap.set("n", "<leader>dj", dap.down, {})
    vim.keymap.set("n", "<leader>dk", dap.up, {})
    vim.keymap.set("n", "<leader>si", dap.step_into, {})
    vim.keymap.set("n", "<leader>so", dap.step_out, {})
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<leader>uw", require("dap.ui.widgets").hover, {})

    local function file_exists(path)
      local stat = vim.loop.fs_stat(path)
      return stat and stat.type == "file"
    end

    local debug_dll = nil

    local function ensure_dll()
      if debug_dll ~= nil then
        return debug_dll
      end
    local dll = dotnet.get_debug_dll()
      debug_dll = dll
      return dll
    end

    for _, value in ipairs { "cs", "fsharp" } do
      dap.configurations[value] = {
        {
          type = "coreclr",
          name = "Program",
          request = "launch",
          env = function()
            local dll = ensure_dll()
            local vars = dotnet.get_environment_variables(dll.project_name, dll.absolute_project_path)
            return vars or nil
          end,
          program = function()
            local dll = ensure_dll()
            local co = coroutine.running()
            rebuild_project(co, dll.project_path)
            if not file_exists(dll.target_path) then
              error("Project has not been built, path: " .. dll.target_path)
            end
            return dll.target_path
          end,
          cwd = function()
            local dll = ensure_dll()
            return dll.absolute_project_path
          end,
        },
      }

      dap.listeners.before["event_terminated"]["easy-dotnet"] = function()
        debug_dll = nil
      end

      dap.adapters.coreclr = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      }
  end
end)

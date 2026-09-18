return {
  "mfussennegger/nvim-dap",
  config = function()
    local dap = require("dap")
    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "▨ ", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
    )
    dap.defaults.fallback.external_terminal = {
      command = "/usr/bin/foot",
      args = { "--hold" },
    }
    dap.adapters.codelldb = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
    }
    dap.configurations.c = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        console = "integratedTerminal",
      },
    }
    dap.configurations.cpp = dap.configurations.c
    dap.configurations.rust = dap.configurations.c

    local xcodebuild = require("xcodebuild.integrations.dap")
    xcodebuild.setup()

    vim.keymap.set("n", "<F5>", xcodebuild.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<F6>", xcodebuild.terminate_session, { desc = "Terminate Debugger" })
    -- dap.configurations.rust = {
    --   {
    --     name =  "debug and launch",
    --     type = "codelldb",
    --     request = "launch",
    --     program = "${workspaceFolder}/target/debug/redgb",
    --     mode = "debug",
    --     args = {},
    --     stopAtEntry = false,
    --     cwd = "${workspaceFolder}",
    --     environment = {},
    --     preLaunchTask = "cargo build",
    --     externalConsole = true,
    --     expressions = "simple",
    --     preRunCommands = {
    --       "command script import ~/.local/share/nvim/lazy/rust-prettifier-for-lldb/rust_prettifier_for_lldb.py"
    --     }
    --   },
    -- }
  end,
}

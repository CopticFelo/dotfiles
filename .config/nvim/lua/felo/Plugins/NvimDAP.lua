return {
  "mfussennegger/nvim-dap",
  config = function()
    local dap = require("dap")
    -- dap.adapters.codelldb = {
    --   type = "server",
    --   host = "127.0.0.1",
    --   port = 13000,
    --   executable = {
    --     command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
    --     args = { "--port", 13000 },
    --   },
    -- }
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
    -- dap.configurations.rust = dap.configurations.c
  end
}

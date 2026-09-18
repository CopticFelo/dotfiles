return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text"
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    require("nvim-dap-virtual-text").setup()
    dapui.setup({
      layouts = {
        {
          elements = {
            {
              id = "stacks",
              size = 0.2,
            },
            {
              id = "scopes",
              size = 0.8,
            },
          },
          position = "left",
          size = 10,
        }, {
        elements = { {
          id = "console",
          size = 0.5
        } },
        position = "bottom",
        size = 5
      }
      },
    })
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
  end,
}

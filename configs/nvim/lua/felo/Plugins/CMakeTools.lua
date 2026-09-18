return {
  "Civitasv/cmake-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "rcarriga/nvim-notify"
  },
  opts = {
    cmake_executor = { name = "overseer", opts = {} },
    cmake_runner = { name = "toggleterm", opts = {} },
    cmake_notifications = {
      runner = { enabled = false },
      executor = { enabled = false },
    }
  }
}

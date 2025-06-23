return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sections = {
      lualine_b = { 'branch' },
      lualine_c = {
        {
          "buffers",
          buffers_color = {
            active = { fg = "#000000", bg = "#ffffff" },
            inactive = "lualine_c_inactive",
          },
        },
      },
      lualine_x = { 'encoding', 'fileformat' },
    },
  },
}

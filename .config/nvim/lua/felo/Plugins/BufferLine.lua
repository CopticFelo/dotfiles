return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        themable = true,
        indicator = {
          style = 'none',
        },
        separator_style = "thick",
        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            text_align = "center",
            padding = 1,
            highlight = "ActiveWindow",
            separator = false,
          },
        },
      },
    })
  end,
}

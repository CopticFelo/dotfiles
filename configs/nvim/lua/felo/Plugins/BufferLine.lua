return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        themable = true,
        diagnostics = "nvim_lsp",
        separator_style = { '', '' },
        indicator = {
          style = 'underline',
        },
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

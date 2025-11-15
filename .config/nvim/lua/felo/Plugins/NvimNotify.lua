return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      timeout = 2,
      max_height = 5,
      fps = 60,
      stages = "fade",
    })
  end,
}

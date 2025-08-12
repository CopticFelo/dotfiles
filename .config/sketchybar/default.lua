local settings = require("settings")
local colors = require("colors")

sbar.default({
  padding_left = settings.paddings.item_padding,
  padding_right = settings.paddings.item_padding,
  icon = {
    font = {
      family = settings.font,
      style = "Bold",
      size = 15,
    },
    color = settings.default_colors.icons.idle,
    padding_left = settings.paddings.outer,
  },
  label = {
    font = {
      family = settings.font,
      -- style = "Bold",
      size = 15.0,
    },
    color = settings.default_colors.text.idle,
    padding_left = settings.paddings.inner,
    padding_right = settings.paddings.outer,
  },
  background = {
    color = colors.transparent,
    height = 28,
    corner_radius = 8,
    border_color = settings.default_colors.border,
    border_width = 2,
    padding_left = settings.paddings.item_padding,
    padding_right = settings.paddings.item_padding,
  },
})

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
    padding_right = settings.paddings.inner,
  },
  label = {
    font = {
      family = settings.font,
      -- style = "Bold",
      size = 15.0,
    },
    color = settings.default_colors.text.idle,
    padding_right = settings.paddings.outer,
  },
  background = {
    height = 24,
    corner_radius = 15,
    -- border_color = colors.white,
    -- border_width = 1,
    -- color = colors.white,
  },
})

local colors = require("colors")
local settings = require("settings")

sbar.bar({
  position = "top",
  height = 35,
  blur_radius = 40,
  color = colors.transparent,
  border_color = colors.transparent,
  sticky = true,
  y_offset = 2,
  -- shadow = true,
})

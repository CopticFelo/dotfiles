local colors = require("colors")
local settings = require("settings")

sbar.bar({
  position = "top",
  height = 35,
  blur_radius = 40,
  color = colors.bar.bg,
  border_color = settings.default_colors.border,
  sticky = true,
  margin = 10,
  y_offset = 2,
  corner_radius = 24,
  border_width = 2
  -- shadow = true,
})

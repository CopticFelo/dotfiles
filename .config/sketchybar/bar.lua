local colors = require("colors")

sbar.bar({
	position = "top",
	height = 35,
	blur_radius = 40,
	color = colors.bar.bg,
	border_color = colors.bar.border,
	sticky = true,
	margin = 10,
	y_offset = 4,
	corner_radius = 24,
	shadow = true,
})

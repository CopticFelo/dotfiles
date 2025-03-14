local settings = require("settings")
local colors = require("colors")

sbar.default({
	padding_left = 8,
	padding_right = 8,
	icon = {
		font = {
			family = settings.font,
			style = "Bold",
			size = "17",
		},
		color = colors.white,
		padding_left = settings.paddings,
		padding_right = settings.paddings - 4,
	},
	label = {
		font = {
			family = settings.font,
			style = "Bold",
			size = 15.0,
		},
		color = colors.white,
		padding_left = settings.paddings - 4,
		padding_right = settings.paddings,
	},
	background = {
		height = 24,
		corner_radius = 15,
		-- border_color = colors.white,
		-- border_width = 1,
		-- color = colors.white,
	},
})

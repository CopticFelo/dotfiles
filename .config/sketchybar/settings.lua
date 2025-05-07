local colors = require("colors")
return {
	font = "JetbrainsMono Nerd Font",
	paddings = 6,
	default_colors = {
		hover = colors.white,
		icons = {
			idle = colors.blue,
			warn = colors.blue,
			critical = colors.red,
			selected = colors.blue,
			hover = colors.black,
		},
		text = {
			idle = colors.white,
			critical = colors.red,
			selected = colors.red,
			hover = colors.black,
		},
	},
}

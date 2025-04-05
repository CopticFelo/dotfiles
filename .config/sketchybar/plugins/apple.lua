local settings = require("settings")
local apple = sbar.add("item", {
	icon = {
		string = "",
		color = settings.default_colors.icons.idle,
		font = {
			size = 20,
		},
	},
	label = {
		drawing = false,
	},
	background = {
		drawing = false,
	},
})

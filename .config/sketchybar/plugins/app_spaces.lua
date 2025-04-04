local settings = require("settings")

local function space_selection(env)
	sbar.set(env.NAME, {
		icon = { highlight = env.SELECTED },
		label = { highlight = env.SELECTED },
	})
end

for i = 1, 10, 1 do
	local space = sbar.add("space", {
		associated_space = i,
		icon = {
			string = i,
			padding_left = 10,
			padding_right = 10,
			color = settings.default_colors.text.idle,
			highlight_color = settings.default_colors.icons.selected,
		},
		padding_left = 2,
		padding_right = 2,
		label = {
			drawing = false,
		},
	})

	space:subscribe("space_change", space_selection)
end

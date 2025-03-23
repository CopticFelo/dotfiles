local colors = require("colors")
local settings = require("settings")
local icon_map = require("icon_map")

local front_app = sbar.add("item", "front_app", {
	position = "center",
	icon = {
		font = "sketchybar-app-font:Regular:18.0",
		color = colors.red,
	},
})

front_app:subscribe("front_app_switched", function(env)
	local app_icon = icon_map[env.INFO]
	if app_icon == nil then
		app_icon = icon_map["Default"]
	end
	front_app:set({
		label = {
			string = env.INFO,
		},
		icon = {
			string = app_icon,
		},
	})
end)

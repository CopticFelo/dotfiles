local colors = require("colors")
package.cpath = package.cpath .. ";/Users/" .. os.getenv("USER") .. "/.local/share/sketchybar_lua/?.so"
local sbar = require("sketchybar")
local clock = sbar.add("item", {
	position = "right",
	icon = {
		string = "",
		color = colors.green,
	},
	update_freq = 1,
	label = {
		drawing = true,
	},
})

local function update()
	sbar.exec("date '+%a %b %d %I:%M %p'", function(result, exit)
		local result_fmt = {}
		for t in result:gmatch("%S+") do
			table.insert(result_fmt, t)
		end
		local hour = tonumber(string.sub(result_fmt[4], 1, 2))
		local ampm = result_fmt[5]
		local color = colors.green
		if (hour < 5 or hour == 12) and (ampm == "AM") then
			color = colors.red
		end
		clock:set({
			label = {
				string = result,
			},
			icon = {
				color = color,
			},
		})
	end)
end

clock:subscribe("routine", update)

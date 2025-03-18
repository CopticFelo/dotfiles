local colors = require("colors")
local isVisible = false
local cpu_temp = sbar.add("item", {
	position = "right",
	icon = {
		string = "󰦖",
	},
	label = {
		string = "...",
	},
	update_freq = 2,
})

cpu_temp:subscribe("routine", function()
	local color = colors.green
	sbar.exec("/usr/local/bin/smctemp -c", function(percent)
		local tempicon = "󰦖"
		local percentnum = tonumber(percent)
		if percentnum >= 85 then
			tempicon = ""
			color = colors.red
		elseif percentnum >= 50 then
			tempicon = ""
			color = colors.orange
		else
			tempicon = ""
			color = colors.white
		end
		cpu_temp:set({
			icon = {
				string = tempicon,
				color = color,
			},
			label = {
				string = string.sub(percent, 1, 2) .. "°c",
				color = percentnum > 90 and color or colors.white,
			},
		})
	end)
end)

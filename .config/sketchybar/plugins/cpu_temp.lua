local settings = require("settings")
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
	local color = settings.default_colors.icons.idle
	sbar.exec("/usr/local/bin/smctemp -c", function(percent)
		local tempicon = "󰦖"
		-- percent? i am sorry, what?
		-- TODO: change that variable name
		local percentnum = tonumber(percent)
		if percentnum >= 85 then
			tempicon = ""
			color = settings.default_colors.icons.critical
		elseif percentnum >= 50 then
			tempicon = ""
			color = settings.default_colors.icons.warn
		else
			tempicon = ""
			color = settings.default_colors.icons.idle
		end
		cpu_temp:set({
			icon = {
				string = tempicon,
				color = color,
			},
			label = {
				string = string.sub(percent, 1, 2) .. "°c",
				color = percentnum > 90 and settings.default_colors.text.critical or settings.default_colors.text.idle,
			},
		})
	end)
end)

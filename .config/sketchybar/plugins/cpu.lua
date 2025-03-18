local cpu_util = sbar.add("item", {
	position = "right",
	icon = {
		string = "",
	},
	label = {
		string = "...",
	},
	update_freq = 2,
})

cpu_util:subscribe("routine", function()
	sbar.exec([[top -l  2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5"%" }']], function(result)
		result = string.sub(result, 1, 2) .. "%"
		cpu_util:set({
			label = {
				string = result,
			},
		})
	end)
end)

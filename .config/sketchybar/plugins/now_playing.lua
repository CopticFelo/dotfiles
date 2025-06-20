local settings = require("settings")
local music = sbar.add("item", {
local colors = require("colors")
local music = sbar.add("item", "music", {
	position = "left",
	update_freq = 3,
	scroll_texts = true,
})

local isPaused = false

music:subscribe("routine", function()
	sbar.exec("nowplaying-cli get title playbackRate", function(result)
		local result_fmt = {}
		for s in result:gmatch("([^\n]*)\n?") do
			table.insert(result_fmt, s)
		end
		local isPlaying = (string.sub(result_fmt[1], 1, 4) ~= "null")
		isPaused = (tonumber(result_fmt[2]) == 0)
		if string.len(result_fmt[1]) > 30 then
			result_fmt[1] = string.sub(result_fmt[1], 1, 30) .. ".."
		end
		music:set({
			label = {
				string = isPlaying and result_fmt[1] or "",
			},
			icon = {
				string = isPlaying and "" or "",
				color = isPaused and settings.default_colors.icons.critical or settings.default_colors.icons.idle,
			},
		})
	end)
end)

music:subscribe("mouse.entered", function()
	music:set({
		background = {
			drawing = "on",
			color = settings.default_colors.hover,
		},
		label = {
			color = settings.default_colors.text.hover,
		},
		icon = {
			color = settings.default_colors.icons.hover,
		},
	})
end)

music:subscribe("mouse.exited", function()
	music:set({
		background = {
			drawing = "off",
		},
		label = {
			color = settings.default_colors.text.idle,
		},
		icon = {
			color = isPaused and settings.default_colors.icons.critical or settings.default_colors.icons.idle,
		},
	})
end)

music:subscribe("mouse.clicked", function()
	sbar.exec("nowplaying-cli get playbackRate", function(result)
		local currentColor = music:query().icon.color
		if isPaused then
			isPaused = false
			sbar.exec("nowplaying-cli play", function() end)
		else
			isPaused = true
			sbar.exec("nowplaying-cli pause", function() end)
		end
	end)
end)

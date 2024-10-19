return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- options = {
		-- 	theme = "16color",
		-- },
		sections = {
			lualine_c = {
				{
					"buffers",
					buffers_color = {
						active = { fg = "#000000", bg = "#ffffff" },
						inactive = "lualine_c_inactive",
					},
				},
			},
		},
	},
}

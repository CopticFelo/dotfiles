return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		theme = "ayu_dark",
		sections = {
			lualine_b = { "branch" },
			lualine_c = {},
			lualine_x = { "encoding", "fileformat" },
		},
		globalstatus = false,
	},
}

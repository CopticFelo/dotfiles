return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim",
	},
	opts = {
		window = {
			position = "left",
			width = 30,
		},
		source_selector = {
			tabs_max_width = 5,
		},
	},
	lazy = false,
	---@module "neo-tree"
	---@type neotree.Config?
}

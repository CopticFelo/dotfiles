return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = true,
	opts = {
		debug = true,
		debugger = {
			enabled = true,
			run_via_dap = true,
		},
		dev_log = {
			open_cmd = "belowright split",
		},
	},
}

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local ts = require("telescope")
		ts.load_extension("flutter")
		local actions = require("telescope.actions")
		ts.setup({
			file_ignore_patterns = {
				"%.git/",
				"%.hg/",
				"%.svn/",
				"%.DS_Store",
				"%.AppleDouble",
				"%.LSOverride",
				"%.Spotlight-V100",
				"%.Trashes",
				"%.DocumentRevisions-V100",
				"%.fseventsd",
				"%.metadata",
				"%.Trash",
				"%.VolumeIcon.icns",
				"%.com.apple.timemachine.donotpresent",
				"%.PKInstallSandboxManager",
				"%.PKInstallSandboxManager-%",
				"%._*",
				"%Library/",
			},
			defaults = {
				path_display = { "smart" },
				mappings = {
					n = {
						["<down>"] = actions.move_selection_next,
						["<up>"] = actions.move_selection_previous,
					},
				},
			},
		})
		ts.load_extension("fzf")
	end,
}

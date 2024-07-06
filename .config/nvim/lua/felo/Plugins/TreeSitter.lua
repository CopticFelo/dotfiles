return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			autotag = {
				enable = true,
			},
			ensure_installed = {
				"lua",
				"c",
				"cpp",
				"python",
				"git_config",
				"git_rebase",
				"gitcommit",
				"asm",
				"json",
				"java",
				"make",
				"dart",
				"yaml",
				"html",
				"css",
				"javascript",
				"markdown_inline",
				"bash",
				"vim",
				"dockerfile",
				"gitignore",
				"r",
				"vimdoc",
				"luadoc",
			},
		})
	end,
}

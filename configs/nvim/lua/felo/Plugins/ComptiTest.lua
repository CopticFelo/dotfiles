return {
	"xeluxee/competitest.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("competitest").setup({
			compile_command = {
				cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)", "-std=c++20" } },
			},
		})
	end,
}

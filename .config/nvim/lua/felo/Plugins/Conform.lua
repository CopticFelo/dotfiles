return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			dart = { "dart-formatter" },
			lua = { "stylua" },
			rust = { "rustfmt" },
			python = { "isort", "black" },
			json = { "jq" },
			sql = { "sql-formatter" },
			yaml = { "yamlfix" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	},
}

return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"asm_lsp",
				"java_language_server",
				"autotools_ls",
				"marksman",
				"pylsp",
				"sqls",
				"yamlls",
				"omnisharp_mono",
				"lua_ls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			},
		})
		local cmp = require("cmp")
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<TAB>"] = cmp.mapping.confirm({ select = true }),
			}),
		})
	end,
}

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

		local lsp_attach = function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end

		lsp_zero.extend_lspconfig({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			lsp_attach = lsp_attach,
			float_border = "rounded",
			sign_text = true,
		})
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
				"texlab",
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

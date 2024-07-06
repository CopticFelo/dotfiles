return {
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"python",
				"codelldb",
				"javadbg",
				"dart",
			},
			handlers = {},
		})
		local dap = require("dap")

		dap.adapters.codelldb = {
			type = "server",
			host = "127.0.0.1",
			port = 13000,
			executable = {
				command = vim.fn.exepath("codelldb"),
				args = { "--port", 13000 },
			},
		}
		dap.configurations.c = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				console = "integratedTerminal",
			},
		}
		dap.configurations.cpp = dap.configurations.c

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>D", dap.continue)
		vim.keymap.set("n", "<leader>i", function()
			require("dap").step_into()
		end)
		vim.keymap.set("n", "<leader>o", function()
			require("dap").step_over()
		end)
	end,
}

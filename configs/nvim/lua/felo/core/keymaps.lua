vim.g.mapleader = ";"

vim.keymap.set("n", "<leader>j", "<Cmd>m .+1<CR>==", { desc = "move line up(n)" })
vim.keymap.set("n", "<leader>k", "<Cmd>m .-2<CR>==", { desc = "move line down(n)" })
vim.keymap.set("v", "<leader>j", "<Cmd>m '>+1<CR>gv=gv", { desc = "move line up(v)" })
vim.keymap.set("v", "<leader>k", "<Cmd>m '<-2<CR>gv=gv", { desc = "move line down(v)" })

vim.keymap.set("n", "<leader>w", "yyP", { desc = "duplicate line up (n)" })
vim.keymap.set("n", "<leader>s", "yyp", { desc = "duplicate line down (n)" })
vim.keymap.set("v", "<leader>w", "y'>pgv", { desc = "duplicate line up (v)" })
vim.keymap.set("v", "<leader>s", "yPgv", { desc = "duplicate line down (v)" })

vim.keymap.set("n", "<leader>n", "<Cmd>nohl<CR>", { desc = "clear search highlights" })

vim.keymap.set("n", "<leader>c", "<Cmd>Neotree close<CR>", { desc = "Toggle Nvim Tree" })
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree focus<CR>", { desc = "Focus Nvim Tree" })

vim.keymap.set("n", "<leader>T", "<Cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>q", "<Cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>,", "<Cmd>bprev<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>.", "<Cmd>bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "<leader><leader>", "db", { desc = "Delete word" })

vim.keymap.set("n", "<leader>f", "<Cmd>Telescope find_files<CR>", { desc = "Find" })
vim.keymap.set("n", "<leader>b", "<Cmd>Telescope buffers<CR>", { desc = "Find buffers" })

vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split" })
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>x", "<Cmd>close<CR>", { desc = "Close split" })
vim.keymap.set("n", "<leader>X", "<Cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close buffer" })

vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "Resize Left" })
vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "Resize Down" })
vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "Resize Up" })
vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "Resize Right" })

vim.keymap.set("n", "<C-j>", "<C-W><C-J>", { desc = "Nav to Bottom split (n)" })
vim.keymap.set("n", "<C-k>", "<C-W><C-K>", { desc = "Nav to Upper split (n)" })
vim.keymap.set("n", "<C-l>", "<C-W><C-L>", { desc = "Nav to Right split (n)" })
vim.keymap.set("n", "<C-h>", "<C-W><C-H>", { desc = "Nav to Left split (n)" })

vim.keymap.set("n", "<leader>Z", "<C-w>s<Cmd>TmuxNavigateDown<CR><Cmd>terminal<CR>i", { desc = "Open terminal" })

vim.keymap.set("n", "<leader>Cr", "<Cmd>CompetiTest run<CR>", { desc = "Run testcases" })
vim.keymap.set("n", "<leader>Ca", "<Cmd>CompetiTest add_testcase<CR>", { desc = "Add testcase" })
vim.keymap.set("n", "<leader>Ce", "<Cmd>CompetiTest edit_testcase<CR>", { desc = "Edit testcase" })
vim.keymap.set("n", "<leader>Cd", "<Cmd>CompetiTest delete_testcase<CR>", { desc = "Delete testcase" })
vim.keymap.set("n", "<leader>Cg", "<Cmd>CompetiTest receive testcases<CR>", { desc = "Get testcases" })

vim.keymap.set("n", "<leader>Fd", "<Cmd>FlutterRun<CR>", { desc = "Flutter Run (Debug)" })
vim.keymap.set("n", "<leader>Fq", "<Cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
vim.keymap.set("n", "<leader>Fr", "<Cmd>FlutterReload<CR>", { desc = "Flutter Reload (Hot restart)" })
vim.keymap.set("n", "<leader>FR", "<Cmd>FlutterRestart<CR>", { desc = "Flutter Restart" })
vim.keymap.set("n", "<leader>Ft", "<Cmd>Telescope flutter commands<CR>", { desc = "Flutter commands" })

vim.keymap.set("n", "<leader><TAB>", "<Cmd>tabn<CR>", { desc = "Next tab" })

vim.keymap.set("n", "<leader>`", "<Cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>~", "<Cmd>wa<CR>", { desc = "Save all open buffers" })
vim.keymap.set("n", "<leader>o", "<Cmd>only<CR>", { desc = "Close all other splits" })

vim.keymap.set("i", "<c-h>", "<left>", { desc = "Move left" })
vim.keymap.set("i", "<c-l>", "<right>", { desc = "Move right" })
vim.keymap.set("i", "<c-j>", "<down>", { desc = "Move down" })
vim.keymap.set("i", "<c-k>", "<up>", { noremap = true, desc = "Move up" })

-- LSP
vim.keymap.set("n", "<leader>A", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
vim.keymap.set("n", "<leader>R", "<Cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>d", "<Cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show line errors" })
vim.keymap.set("n", "<leader>D", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Jump to definition" })

-- Running and Debugging (language specific)
vim.keymap.set("n", "<F1>", "<Cmd>CompilerOpen<CR>", { desc = "Open Compiler menu" })

-- local function toggle_breakpoint()
--   local condition = vim.fn.input("Breakpoint condition (optional): ")
--   local hit_condition = vim.fn.input("Hit count (optional): ")
--
--   -- Convert empty strings to nil
--   condition = condition ~= "" and condition or nil
--   hit_condition = hit_condition ~= "" and hit_condition or nil
--
--   require("dap").toggle_breakpoint(condition, hit_condition)
-- end,

vim.keymap.set("n", "<leader>B", "<Cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>K", require("dap.ui.widgets").hover, { desc = "Check Variable (debug)" })
vim.keymap.set("n", "<F10>", "<Cmd>DapStepOver<CR>", { desc = "Step over" })
vim.keymap.set("n", "<F11>", "<Cmd>DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<F12>", "<Cmd>DapStepOut<CR>", { desc = "Step out" })
vim.keymap.set("n", "<F5>", "<Cmd>DapContinue<CR>", { desc = "Debug/Continue" })
vim.keymap.set("n", "<F6>", "<Cmd>DapTerminate<CR>", { desc = "Stop debugging" })

-- Neotest
vim.keymap.set("n", "<leader>tt", function()
	require("neotest").run.run({ suite = true })
end, { desc = "Start test" })
vim.keymap.set("n", "<leader>ts", function()
	require("neotest").summary.toggle()
end, { desc = "Toggle summary panel" })
vim.keymap.set("n", "<leader>to", function()
	require("neotest").output_panel.toggle()
end, { desc = "Toggle output panel" })

local function change_root_to_global_cwd()
	local api = require("nvim-tree.api")
	local global_cwd = vim.fn.getcwd(-1, -1)
	api.tree.change_root(global_cwd)
end
vim.keymap.set("n", "<leader>O", "<Cmd>Telescope workspaces<CR>", { desc = "Change root to cwd" })
vim.keymap.set("n", "<leader>/", change_root_to_global_cwd, { desc = "Change root to cwd" })

vim.keymap.set("n", "<TAB>r", "<Cmd>vertical resize 130 | resize 32<CR>", { desc = "Resize current split" })

if vim.g.neovide then
	vim.keymap.set("n", "<D-s>", "<Cmd>w<CR>") -- Save
	vim.keymap.set("v", "<D-c>", "y") -- Copy
	vim.keymap.set("n", "<D-v>", "p") -- Paste normal mode
	vim.keymap.set("v", "<D-v>", "p") -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", "<ESC>pi") -- Paste insert mode
end

-- harpoon
local harpoon = require("harpoon")
harpoon:setup()

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<leader>y", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add mark" })
vim.keymap.set("n", "<leader><", function()
	toggle_telescope(harpoon:list())
end, { desc = "Harpoon: list" })

vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end, { desc = "Mark 1" })
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end, { desc = "Mark 2" })
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end, { desc = "Mark 3" })
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end, { desc = "Mark 4" })

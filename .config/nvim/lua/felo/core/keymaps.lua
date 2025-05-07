vim.g.mapleader = ";"

vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { desc = "move line up(n)" }) --
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { desc = "move line down(n)" }) --
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "move line up(v)" }) --
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "move line down(v)" }) --

vim.keymap.set("n", "<leader>w", "yyP", { desc = "duplicate line up (n)" }) -- duplicate line up(n)
vim.keymap.set("n", "<leader>s", "yyp", { desc = "duplicate line down (n)" }) -- duplicate line down(n)
vim.keymap.set("v", "<leader>w", "y'>pgv", { desc = "duplicate line up (v)" }) -- duplicate line up(v)
vim.keymap.set("v", "<leader>s", "yPgv", { desc = "duplicate line down (v)" }) -- duplicate line down(v)

vim.keymap.set("n", "<leader>n", ":nohl<CR>", { desc = "clear search highlights" }) -- clear search highlights

vim.keymap.set("n", "<leader>c", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" }) -- Toggle Nvim Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus Nvim Tree" }) -- Focus Nvim Tree
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { desc = "Refresh Nvim Tree" }) -- Refresh Nvim Tree

vim.keymap.set("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "New tab" }) -- New tab
vim.keymap.set("n", "<leader>q", "<cmd>tabclose<CR>", { desc = "Close tab" }) -- Close tab
vim.keymap.set("n", "<leader>,", "<cmd>bprev<CR>", { desc = "Prev buffer" }) -- Prev buffer
vim.keymap.set("n", "<leader>.", "<cmd>bnext<CR>", { desc = "Next buffer" }) -- Next buffer

vim.keymap.set("n", "<leader><leader>", "db", { desc = "Delete word" }) -- Delete word

vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find" }) -- Find
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" }) -- Find buffers

vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split" }) -- Split
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split horizontally" }) -- Split horizontally
vim.keymap.set("n", "<leader>x", ":close<CR>", { desc = "Close split" }) -- Close split
vim.keymap.set("n", "<leader>X", ":bd<CR>", { desc = "Close buffer" }) -- Close buffer

vim.keymap.set("n", "<TAB>j", "<C-W><C-J>", { desc = "Nav to Bottom split (n)" }) -- Nav to Bottom split (n)
vim.keymap.set("n", "<TAB>k", "<C-W><C-K>", { desc = "Nav to Upper split (n)" }) -- Nav to Upper split (n)
vim.keymap.set("n", "<TAB>l", "<C-W><C-L>", { desc = "Nav to Right split (n)" }) -- Nav to Right split (n)
vim.keymap.set("n", "<TAB>h", "<C-W><C-H>", { desc = "Nav to Left split (n)" }) -- Nav to Left split (n)

vim.keymap.set("n", "<leader>z", "<C-w>s<cmd>TmuxNavigateDown<CR><cmd>terminal<CR>i", { desc = "Open terminal" }) -- Open terminal

vim.keymap.set("n", "<leader>]", ":CompetiTest run<CR>", { desc = "Run testcases" }) -- Run testcases
vim.keymap.set("n", "<leader>a", ":CompetiTest add_testcase<CR>", { desc = "Add testcase" }) -- Add testcase
vim.keymap.set("n", "<leader>m", ":CompetiTest edit_testcase<CR>", { desc = "Edit testcase" }) -- Edit testcase
vim.keymap.set("n", "<leader>d", ":CompetiTest delete_testcase<CR>", { desc = "Delete testcase" }) -- Delete testcase
vim.keymap.set("n", "<leader>g", ":CompetiTest receive testcases<CR>", { desc = "Get testcases" }) -- Get testcases from Codeforces

vim.keymap.set("n", "<leader>Fd", "<cmd>FlutterRun<CR>", { desc = "Flutter Run (Debug)" }) -- Flutter Run (Debug)
vim.keymap.set("n", "<leader>Fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" }) -- Flutter Quit
vim.keymap.set("n", "<leader>Fr", "<cmd>FlutterReload<CR>", { desc = "Flutter Reload (Hot restart)" }) -- Flutter Reload (Hot restart)
vim.keymap.set("n", "<leader>FR", "<cmd>FlutterRestart<CR>", { desc = "Flutter Restart" }) -- Flutter Restart
vim.keymap.set("n", "<leader>Ft", "<cmd>Telescope flutter commands<CR>", { desc = "Flutter commands" }) -- Flutter commands

vim.keymap.set("n", "<TAB>r", ":resize ", { desc = "Resize window command" })

vim.keymap.set("n", "<leader><TAB>", "<cmd>tabn<CR>", { desc = "Next tab" })

vim.keymap.set("n", "<leader>`", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>~", "<cmd>wa<CR>", { desc = "Save all open buffers" })

vim.keymap.set("n", "<leader>C", "<cmd>CompilerOpen<CR>", { desc = "Open Compiler menu" })

vim.keymap.set("i", "<c-h>", "<left>", { desc = "Move left" })
vim.keymap.set("i", "<c-l>", "<right>", { desc = "Move right" })
vim.keymap.set("i", "<c-j>", "<down>", { desc = "Move down" })
vim.keymap.set("i", "<c-k>", "<up>", { noremap = true, desc = "Move up" })

-- LSP
vim.keymap.set("n", "<leader>A", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
vim.keymap.set("n", "<leader>R", "<Cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>D", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Jump to definition" })

-- DAP
vim.keymap.set("n", "<leader>B", "<Cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>i", "<Cmd>DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>o", "<Cmd>DapStepOver<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>So", "<Cmd>DapStepOut<CR>", { desc = "Step out" })
vim.keymap.set("n", "<leader>W", "<Cmd>DapContinue<CR>", { desc = "Weiter" })
vim.keymap.set("n", "<leader>T", "<Cmd>DapTerminate<CR>", { desc = "Stop debugging" })

local function change_root_to_global_cwd()
  local api = require("nvim-tree.api")
  local global_cwd = vim.fn.getcwd(-1, -1)
  api.tree.change_root(global_cwd)
end
vim.keymap.set("n", "<leader>O", "<cmd>Telescope workspaces<CR>", { desc = "Change root to cwd" })
vim.keymap.set("n", "<leader>/", change_root_to_global_cwd, { desc = "Change root to cwd" })

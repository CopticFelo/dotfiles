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

vim.keymap.set("n", "<leader>t", "<Cmd>tabnew<CR>", { desc = "New tab" })
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

vim.keymap.set("n", "<TAB>j", "<C-W><C-J>", { desc = "Nav to Bottom split (n)" })
vim.keymap.set("n", "<TAB>k", "<C-W><C-K>", { desc = "Nav to Upper split (n)" })
vim.keymap.set("n", "<TAB>l", "<C-W><C-L>", { desc = "Nav to Right split (n)" })
vim.keymap.set("n", "<TAB>h", "<C-W><C-H>", { desc = "Nav to Left split (n)" })

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
vim.keymap.set("n", "<leader>r", "<Cmd>CompilerOpen<CR>", { desc = "Open Compiler menu" })
vim.keymap.set("n", "<leader>B", "<Cmd>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<F10>", "<Cmd>DapStepOver<CR>", { desc = "Step over" })
vim.keymap.set("n", "<F11>", "<Cmd>DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<F12>", "<Cmd>DapStepOut<CR>", { desc = "Step out" })
vim.keymap.set("n", "<F5>", "<Cmd>DapContinue<CR>", { desc = "Debug/Continue" })
vim.keymap.set("n", "<F6>", "<Cmd>DapTerminate<CR>", { desc = "Stop debugging" })

local function change_root_to_global_cwd()
  local api = require("nvim-tree.api")
  local global_cwd = vim.fn.getcwd(-1, -1)
  api.tree.change_root(global_cwd)
end
vim.keymap.set("n", "<leader>O", "<Cmd>Telescope workspaces<CR>", { desc = "Change root to cwd" })
vim.keymap.set("n", "<leader>/", change_root_to_global_cwd, { desc = "Change root to cwd" })

vim.keymap.set("n", "<TAB>r", "<Cmd>vertical resize 130 | resize 32<CR>", { desc = "Resize current split" })

if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', '<Cmd>w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', 'y')          -- Copy
  vim.keymap.set('n', '<D-v>', 'p')          -- Paste normal mode
  vim.keymap.set('v', '<D-v>', 'p')          -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+')     -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>pi')    -- Paste insert mode
end

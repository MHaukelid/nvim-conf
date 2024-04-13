-- Local Variables
local cmd = vim.cmd
local g = vim.g

-- Plugins
require("plugins") -- ./lua/plugins.lua

-- Theme
cmd("colorscheme base16-default-dark")

-- LSP
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- LSP servers
require("lspconfig").gopls.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").terraformls.setup({})
require("lspconfig").jedi_language_server.setup({})

-- Completion engine
require("nvim-cmp")

-- Notifications and LSP progress messages
require("fidget").setup({})

-- DAP
require("dap-python").setup()
require("dap-go").setup()

require("dap.ext.vscode").load_launchjs(nil, {})

local dap, dapui = require("dap"), require("dapui")
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Options
cmd("highlight clear LineNr")

cmd("set colorcolumn=120")
cmd("hi ColorColumn guifg=grey")

cmd("set guicursor=") -- Disable cursor shape mode
cmd("set nocompatible")
cmd("set number")
cmd("set relativenumber")
cmd("set encoding=utf-8")
cmd("set laststatus=2")
cmd("set t_Co=256")
cmd("set ruler")
cmd("set tabstop=2 softtabstop=2")
cmd("set shiftwidth=2")
cmd("set softtabstop=0")
cmd("set noexpandtab")
cmd("set noerrorbells")
cmd("set nowrap")
cmd("set noswapfile")
cmd("set nobackup")
cmd("set clipboard+=unnamedplus") -- Often this is the global clipboard, remeber to install a clipboard manager (xclip).
cmd("set termguicolors")
cmd("set cursorcolumn")
cmd("set scrolloff=5")

-- Give more space for displaying messages.
cmd("set cmdheight=2")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
cmd("set updatetime=50")

-- Keybinds
cmd("let mapleader = ' '")

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- Tabpage
map("n", "<leader><Left>", "<cmd>:tabprevious<cr>")
map("n", "<leader><Right>", "<cmd>:tabnext<cr>")
map("n", "<leader>tc", "<cmd>:tabclose<cr>")
map("n", "<leader>tn", "<cmd>:tabnew<cr>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- Snippets
map("n", "<leader>html", "<cmd>-1read ~/.config/nvim/snippets/html.txt<cr>3jwf>a")
map("n", "<leader>py", "<cmd>-1read ~/.config/nvim/snippets/python.txt<cr>")

-- DAP
map("n", "<F5>", "<cmd>:lua require('dap').continue()<cr>")
map("n", "<F10>", "<cmd> require('dap').step_over()<cr>")
map("n", "<F11>", "<cmd>:lua require('dap').step_into()<cr>")
map("n", "<F12>", "<cmd>:lua require('dap').step_out()<cr>")
map("n", "<leader>b", "<cmd>:lua require('dap').toggle_breakpoint()<cr>")

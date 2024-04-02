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

require("lspconfig").gopls.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").terraformls.setup({})

require("nvim-cmp")

require("fidget").setup({})

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

-- Give more space for displaying messages.
cmd("set cmdheight=2")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
cmd("set updatetime=50")

-- Debugger
g.vimspector_enable_mappings = "HUMAN"

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

-- File browsing
map("n", "<leader>b", "<cmd>:e#1<cr>")

-- Debugger (vimspector)
map("n", "<leader>dd", "<cmd>call vimspector#Launch()<cr>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- Snippets
map("n", "<leader>html", "<cmd>-1read ~/.config/nvim/snippets/html.txt<cr>3jwf>a")
map("n", "<leader>py", "<cmd>-1read ~/.config/nvim/snippets/python.txt<cr>")

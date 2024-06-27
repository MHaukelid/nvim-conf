-- Plugins
require("init-plugins")

-- Treesitter
require("init-treesitter")

-- LSP
require("init-lsp")

-- DAP
require("init-dap")

-- Theme
vim.cmd("colorscheme base16-default-dark")

-- Notifications and LSP progress messages
require("fidget").setup({})

-- Options
vim.cmd("highlight clear LineNr")

vim.cmd("set colorcolumn=120")
vim.cmd("hi ColorColumn guifg=grey")

vim.cmd("set guicursor=") -- Disable cursor shape mode
vim.cmd("set nocompatible")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set encoding=utf-8")
vim.cmd("set laststatus=2")
vim.cmd("set t_Co=256")
vim.cmd("set ruler")
vim.cmd("set tabstop=4 softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=0")
vim.cmd("set expandtab")
vim.cmd("set smartindent")
vim.cmd("set noerrorbells")
vim.cmd("set nowrap")
vim.cmd("set noswapfile")
vim.cmd("set nobackup")
vim.cmd("set clipboard+=unnamedplus") -- Often this is the global clipboard, remeber to install a clipboard manager (xclip).
vim.cmd("set termguicolors")
vim.cmd("set cursorcolumn")
vim.cmd("set scrolloff=5")

-- Give more space for displaying messages.
vim.cmd("set cmdheight=2")

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.cmd("set updatetime=50")

-- Keybinds
vim.cmd("let mapleader = ' '")

function Map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- Tabpage
Map("n", "<leader><Left>", "<cmd>:tabprevious<cr>")
Map("n", "<leader><Right>", "<cmd>:tabnext<cr>")
Map("n", "<leader>tc", "<cmd>:tabclose<cr>")
Map("n", "<leader>tn", "<cmd>:tabnew<cr>")

-- Telescope
Map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
Map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- Snippets
Map("n", "<leader>html", "<cmd>-1read ~/.config/nvim/snippets/html.txt<cr>3jwf>a")
Map("n", "<leader>py", "<cmd>-1read ~/.config/nvim/snippets/python.txt<cr>")

-- LSP
Map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
Map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")

-- DAP
Map("n", "<F5>", "<cmd>:lua require('dap').continue()<cr>")
Map("n", "<F10>", "<cmd> require('dap').step_over()<cr>")
Map("n", "<F11>", "<cmd>:lua require('dap').step_into()<cr>")
Map("n", "<F12>", "<cmd>:lua require('dap').step_out()<cr>")
Map("n", "<leader>b", "<cmd>:lua require('dap').toggle_breakpoint()<cr>")

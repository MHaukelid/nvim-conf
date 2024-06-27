return require("packer").startup(function(use)

	-- Packer can manage itself
  use "wbthomason/packer.nvim"

	-- Theme
	use "chriskempson/base16-vim"

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",

		requires = {
			-- Lua functions libary
			"nvim-lua/plenary.nvim"
		}
	}

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Autopair
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup({}) end
	}

	-- LSP zero conf
	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- Quickstart configs for LSP
			"neovim/nvim-lspconfig",

            -- Completion engine
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip"
        }
	}

	-- LSP progress notifications
	use {
		"j-hui/fidget.nvim",
		config = function() require("fidget").setup({}) end
	}

	-- DAP (Debug Adapter Protocol)
	use {
		"rcarriga/nvim-dap-ui",
		requires = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
		}
	}

	use "mfussenegger/nvim-dap-python"
	use "leoluz/nvim-dap-go"

end)

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
			-- LSP Support
			"neovim/nvim-lspconfig"
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

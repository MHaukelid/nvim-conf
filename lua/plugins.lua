return require("packer").startup(function(use)
  
	-- Packer can manage itself
  use "wbthomason/packer.nvim"

	-- Theme
	use "chriskempson/base16-vim"

	-- Debugger
	use "puremourning/vimspector"

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",

		requires = {
			-- Lua functions libary
			{ "nvim-lua/plenary.nvim" },
		}
	} 

	-- Tresitter
	use "nvim-treesitter/nvim-treesitter"

	-- Autopair
	use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}

	-- LSP zero conf
	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "L3MON4D3/LuaSnip" },
		}
	}

	-- LSP progress notifications
	use {
		"j-hui/fidget.nvim",
		config = function() require("fidget").setup {} end
	}

end)

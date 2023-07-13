vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itselfpacker
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'ayu-theme/ayu-vim',
		config = function()
			-- vim.g.ayucolor = "mirage" -- Choose the desired color variant: "light", "mirage", or "dark"
			-- vim.g.ayucolor = "light" -- Choose the desired color variant: "light", "mirage", or "dark"
			vim.g.ayucolor = "dark" -- Choose the desired color variant: "light", "mirage", or "dark"
			vim.cmd('colorscheme ayu')
		end
	}
	use({ 
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	})
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}
use "olimorris/onedarkpro.nvim"
use ("theprimeagen/harpoon")
use ("mbbill/undotree")
use ("tpope/vim-fugitive")
end)
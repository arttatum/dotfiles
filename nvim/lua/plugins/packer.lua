local packer_download_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Download Packer if it doesn't already exist
if vim.fn.empty(vim.fn.glob(packer_download_path)) > 0 then
	print("Packer not found, downloading...")
	vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_download_path })
end

-- Equivalent to running packadd packer.nvim in Command Mode
vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
	-- Declare plugins here
	use { 'ojroques/nvim-osc52' }

	use { "catppuccin/nvim", as = "catppuccin" }

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'           -- optional, updated every week. (see issue #1193)
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use { 'mbbill/undotree' }

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },         -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },     -- Required
			{ 'hrsh7th/cmp-buffer' },       -- Optional
			{ 'hrsh7th/cmp-path' },         -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' },     -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	use { 'eandrju/cellular-automaton.nvim' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		'goolord/alpha-nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('plugins.config.alpha.screen')
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }


	-- Colorschemes
	use 'folke/tokyonight.nvim'

	-- Packer can manage it's own updates
	use 'wbthomason/packer.nvim'
end
)

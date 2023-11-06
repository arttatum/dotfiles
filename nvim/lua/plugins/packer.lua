local packer_download_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Download Packer if it doesn't already exist
if vim.fn.empty(vim.fn.glob(packer_download_path)) > 0 then
	print("Packer not found, downloading...")
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_download_path })
end

-- Equivalent to running packadd packer.nvim in Command Mode
vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
	-- Copy paste over ssh
	use("ojroques/nvim-osc52")

	-- Themes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")

	-- File explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly",
	})

	-- Syntax Parser
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Undo history
	use("mbbill/undotree")

	-- Language Server Management
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})

	-- Pure fun
	use({ "eandrju/cellular-automaton.nvim" })

	-- Modal searching (files, words, commits, buffers, planets...)
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Splash screen
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Packer can manage it's own updates
	use("wbthomason/packer.nvim")

	-- Formatter
	use({ "mhartington/formatter.nvim" })

	-- Harpoon -> like marks, but better
	use({ "ThePrimeagen/harpoon" })

	-- Sessions (odd interaction with alpha)
	-- use({ "rmagatti/auto-session" })

	--

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Surround things with things:
	-- cs[old_surround][new_surround] -> change old to new,
	-- ys[motion_to_select_object][new_surround] -> create,
	-- yss[new_surround]-> create surround around whole line,
	-- ds[surround_to_delete] -> delete,
	-- S[new_surround] -> for visual / visual line mode,
	use("tpope/vim-surround")

	-- Java
	use({
		"mfussenegger/nvim-jdtls",
		disable = false,
	})

	-- folds
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- refactoring
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- git
	use("tpope/vim-fugitive")

	-- toggleterm
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
end)

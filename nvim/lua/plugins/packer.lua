local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap =
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
	-- Copy paste over ssh
	use("ojroques/nvim-osc52")

	-- Themes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")

	-- Notifications
	use("rcarriga/nvim-notify")

	-- UI config
	use("stevearc/dressing.nvim")

	-- Which Key?

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wk = require("which-key")
			wk.setup({
				plugins = {
					spelling = true,
					presets = {
						operators = true, -- adds help for operators like d, y, ...
						motions = true, -- adds help for motions
						text_objects = true, -- help for text objects triggered after entering an operator
						windows = true, -- default bindings on <c-w>
						nav = true, -- misc bindings to work with windows
						z = true, -- bindings for folds, spelling and others prefixed with z
						g = true, -- bindings for prefixed with g
					},
				},
				key_labels = { ["<leader>"] = "SPC" },
			})
			wk.register({
				mode = { "n", "v" },
				["<leader>f"] = { name = "+find" },
				["<leader>g"] = { name = "+git" },
				["<leader>q"] = { name = "+quit/session" },
				["<leader>t"] = { name = "+toggle" },
				["<leader>v"] = { name = "+lsp" },
				["<leader><tab>"] = { name = "+tabs" },
			})
		end,
	})

	-- Add symbols to LSP suggestions
	use("onsails/lspkind.nvim")

	-- File explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly",
	})

	use({
		"mrcjkb/rustaceanvim",
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
		branch = "v2.x",
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
	use({ "ThePrimeagen/harpoon", branch = "harpoon2", requires = "nvim-lua/plenary.nvim" })

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
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
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

	-- debugger
	use({
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
					args = { "--port", "${port}" },
				},
			}
			dap.configurations.rust = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)

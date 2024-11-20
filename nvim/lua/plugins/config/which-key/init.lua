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
	{
		mode = { "n", "v" },
		{ "<leader><tab>", group = "tabs" },
		{ "<leader>D", group = "debugger" },
		{ "<leader>f", group = "find" },
		{ "<leader>g", group = "git" },
		{ "<leader>q", group = "quit/session" },
		{ "<leader>t", group = "toggle" },
		{ "<leader>v", group = "lsp" },
	},
})

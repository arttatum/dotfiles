-- Must be before lsp is configured for lua
require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lsp_zero = require("lsp-zero")

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
		-- force mason-lspconfig NOT to handle rust-analyzer...
		-- rustacean will deal with it automatically
		rust_analyzer = function() end,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local lspkind = require("lspkind")
cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			-- can also be a function to dynamically calculate max width such as
			-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { buffer = bufnr, remap = false, desc = "Go to definition" })
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end, { buffer = bufnr, remap = false, desc = "Hover" })
vim.keymap.set("n", "<leader>vws", function()
	vim.lsp.buf.workspace_symbol()
end, { buffer = bufnr, remap = false, desc = "Search workspace symbols" })
vim.keymap.set("n", "<leader>vd", function()
	vim.diagnostic.open_float()
end, { buffer = bufnr, remap = false, desc = "Show diagnostics" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_next()
end, { buffer = bufnr, remap = false, desc = "Go to next diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_prev()
end, { buffer = bufnr, remap = false, desc = "Go to prev diagnostic" })
vim.keymap.set("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end, { buffer = bufnr, remap = false, desc = "Code actions" })
vim.keymap.set("n", "<leader>vrr", function()
	vim.lsp.buf.references()
end, { buffer = bufnr, remap = false, desc = "View references" })
vim.keymap.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end, { buffer = bufnr, remap = false, desc = "Rename" })
vim.keymap.set("i", "<C-h>", function()
	vim.lsp.buf.signature_help()
end, { buffer = bufnr, remap = false, desc = "Show signature info" })

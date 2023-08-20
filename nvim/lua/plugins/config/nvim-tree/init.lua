vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local fileexplorer = require("nvim-tree")

fileexplorer.setup({
	view = {
		width = 45,
	},
	filters = {
		dotfiles = true,
	},
})

vim.keymap.set("n", "<leader>s", function()
    fileexplorer.open()
end)

local view = require("nvim-tree.view")

vim.keymap.set("n", "<leader>w", function()
    view.close()
end
)


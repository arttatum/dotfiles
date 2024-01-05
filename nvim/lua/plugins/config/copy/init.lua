require("osc52").setup({
	max_length = 0, -- Maximum length of selection (0 for no limit)
	silent = false, -- Disable message on successful copy
	trim = false, -- Trim surrounding whitespaces before copy
})
vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true, desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>c", require("osc52").copy_visual, { desc = "Copy to system clipboard" })

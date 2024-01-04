require("harpoon").setup()

-- <leader>fm via telescope for ui
vim.keymap.set("n", "<leader>m", function()
	require("harpoon.mark").add_file()
end)

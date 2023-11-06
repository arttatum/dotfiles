require("harpoon").setup()

vim.keymap.set("n", "<leader>m", function()
	require("harpoon.mark").add_file()
end)
-- <leader>fm via telescope for ui

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

vim.keymap.set("n", "<leader>fgs", builtin.git_stash, {})
vim.keymap.set("n", "<leader>fgc", builtin.git_commits, {})

vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local telescope = require("telescope")
telescope.load_extension("harpoon")
vim.keymap.set("n", "<leader>fm", telescope.extensions.harpoon.marks)

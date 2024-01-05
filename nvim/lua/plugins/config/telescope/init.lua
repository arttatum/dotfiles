local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Search commands" })
vim.keymap.set("n", "<leader>fgs", builtin.git_stash, { desc = "Search stash" })
vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "Search commits" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Search recent" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Search keymaps" })

local telescope = require("telescope")
telescope.load_extension("harpoon")
vim.keymap.set("n", "<leader>fm", telescope.extensions.harpoon.marks, { desc = "Search harpoons" })

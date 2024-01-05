local opts = { noremap = true, silent = true, desc = "Fugitive" }
vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>vert rightb Git<CR>", opts)

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>vert rightb Git<CR>", opts)

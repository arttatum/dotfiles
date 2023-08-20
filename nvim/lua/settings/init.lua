vim.g.mapleader = " "
vim.opt.number = true

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)

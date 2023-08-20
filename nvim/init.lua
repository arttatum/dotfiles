vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true

local function copy(lines, _)
	require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
	return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
end

vim.g.clipboard = {
	name = 'osc52',
	copy = { ['+'] = copy, ['*'] = copy },
	paste = { ['+'] = paste, ['*'] = paste },
}

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({insertSpaces = true, trimTrailingWhitespace = true, insertFinalNewline = true})]]


-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('n', '<leader>c', '"+y')
vim.keymap.set('n', '<leader>cc', '"+yy')

local set = vim.opt -- set options
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
require("settings")
require("plugins")

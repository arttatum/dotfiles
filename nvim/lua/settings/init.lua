-- don't show the built-in file exlporer on startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- colorful terminal
vim.o.termguicolors = true

-- How many spaces make a tab?
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- shortcut key
vim.g.mapleader = " "

-- show line numbers
vim.o.number = true
--
-- show relative line numbers, for simpler jumping
vim.wo.relativenumber = true

-- traverse start/end of lines when backspacing, or moving left/right off one end.
vim.o.backspace = [[indent,eol,start]]
vim.o.whichwrap = "<,>,[,]"

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

vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Start Alpha when vim is opened with no arguments, set current dir to target file/folder",
	group = vim.api.nvim_create_augroup("alpha_autostart", { clear = true }),
	callback = function()
		local should_skip
		local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)
		if
			vim.fn.argc() > 0 -- don't start when opening a file
			or #lines > 1 -- don't open if current buffer has more than 1 line
			or (#lines == 1 and lines[1]:len() > 0) -- don't open the current buffer if it has anything on the first line
			or #vim.tbl_filter(function(bufnr)
				return vim.bo[bufnr].buflisted
			end, vim.api.nvim_list_bufs()) > 1 -- don't open if any listed buffers
			or not vim.o.modifiable -- don't open if not modifiable
		then
			should_skip = true
		else
			for _, arg in pairs(vim.v.argv) do
				if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
					should_skip = true
					break
				end
			end
		end
		if should_skip then
			-- always set current dir to file/tolder if specified
			vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
			local fileexplorer = require("nvim-tree")
			fileexplorer.open()
		else
			require("alpha").start(true, require("alpha").default_config)
			vim.schedule(function()
				vim.cmd.doautocmd("FileType")
			end)
		end
	end,
})

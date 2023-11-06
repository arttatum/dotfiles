require("settings")
require("plugins")
-- setup must be called before loading
vim.cmd.colorscheme("kanagawa")

local group_cdpwd = vim.api.nvim_create_augroup("group_cdpwd", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	group = group_cdpwd,
	pattern = "*",
	callback = function()
		vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
	end,
})

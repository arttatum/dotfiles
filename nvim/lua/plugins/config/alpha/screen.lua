-- Create button for initial keybind.
--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position       = "center",
		shortcut       = sc,
		cursor         = 5,
		width          = 50,
		align_shortcut = "right",
		hl_shortcut    = "Conditional",
	}
	if keybind then
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(sc_ .. '<Ignore>', true, false, true)
		vim.api.nvim_feedkeys(key, "normal", false)
	end

	return {
		type     = "button",
		val      = txt,
		on_press = on_press,
		opts     = opts,
	}
end
local buttons = {
	type = "group",
	val = {
		button("e", "  New Buffer", ':tabnew<CR>'),
		button("f", "  Find file", ':Telescope find_files<CR>'),
		button("h", "  Recently opened files", ':Telescope oldfiles<CR>'),
		button("r", "  Frecency/MRU", ':Telescope oldfiles<CR>'),
		button("g", "  Open Last Session", ':source ~/.config/nvim/session.vim<CR>'),
		button("m", "  Word Finder", ':Telescope live_grep<CR>'),
		button("l", "  Marks", ':Telescope marks<CR>'),
	},
	opts = {
		spacing = 1
	}
}

local term_height = 10
local config = {
	layout = {
		{ type = "padding", val = 5 },
		{
			type = "terminal",
			command = require("plugins.config.alpha.commands").go_code(),
			width = 80,
			height = term_height,
			opts = {
				redraw = true,
			},
		},
		{ type = "padding", val = 10 },
		buttons,
		{ type = "padding", val = 5 },
		{
			type = "text",
			val = require("plugins.config.alpha.ascii").eatsleep,
			opts = {
				position = "center",
				hl = "Type"
			}
		},
	},
	opts = {
		noautocmd = false,
	},
}

local alpha = require("alpha")
require("alpha.term")

alpha.setup(config)

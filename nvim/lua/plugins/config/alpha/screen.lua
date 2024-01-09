-- Create button for initial keybind.
--- @param shortcut string
--- @param txt string
--- @param keybind string optional
local function button(shortcut, txt, keybind)
	local sc_ = shortcut:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		shortcut = shortcut,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Conditional",
	}

	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true, nowait = true } }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "normal", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end
local buttons = {
	type = "group",
	val = {
		button("e", "📜 New Buffer", ":tabnew<CR>"),
		button("f", "🕵️ Find file", ":Telescope find_files<CR>"),
		button("h", "🕰️ Recently opened files", ":Telescope oldfiles<CR>"),
		button("r", "🚛 Frecency/MRU", ":Telescope oldfiles<CR>"),
		button("m", "🔎 Word Finder", ":Telescope live_grep<CR>"),
		button("l", "🏹 Harpoons", ":Telescope harpoon marks<CR>"),
	},
	opts = {
		spacing = 1,
	},
}

local term_height = 25
local config = {
	layout = {
		{
			type = "terminal",
			command = require("plugins.config.alpha.commands").bonsai(),
			width = 120,
			height = term_height,
			opts = {
				redraw = true,
			},
		},
		{ type = "padding", val = 3 },
		buttons,
		--	{
		--		type = "terminal",
		--		command = require("plugins.config.alpha.commands").matrix(),
		--		width = 80,
		--		height = term_height,
		--		opts = {
		--			redraw = true,
		--		},
		--	},
		--{
		--	type = "terminal",
		--	command = require("plugins.config.alpha.commands").go_code(vim.fn.getcwd():match("[^/]*$"), 120),
		--	width = 120,
		--	height = 14,
		--	opts = {
		--		redraw = true,
		--	},
		--},
		--	{ type = "padding", val = 5 },
		--	{
		--		type = "text",
		--		val = require("plugins.config.alpha.ascii").eatsleep,
		--		opts = {
		--			position = "center",
		--			hl = "Type",
		--		},
		--	},
	},
	opts = {
		noautocmd = false,
	},
}

local alpha = require("alpha")
require("alpha.term")
alpha.setup(config)

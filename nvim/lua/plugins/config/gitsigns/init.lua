require("gitsigns").setup({
	signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
	numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
})
local gs = package.loaded.gitsigns

local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

-- Navigation
map("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		gs.next_hunk()
	end)
	return "<Ignore>"
end, { expr = true, desc = "Next hunk" })

map("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		gs.prev_hunk()
	end)
	return "<Ignore>"
end, { expr = true, desc = "Previous hunk" })

-- Actions
map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
map("v", "<leader>gs", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk" })
map("v", "<leader>gr", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk" })
map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
map("n", "<leader>gb", function()
	gs.blame_line({ full = true })
end, { desc = "Blame line" })
map("n", "<leader>gd", gs.diffthis, { desc = "Diff buffer with index" })
map("n", "<leader>gD", function()
	gs.diffthis("~")
end, { desc = "Diff buffer with HEAD" })
map("n", "<leader>gtw", gs.toggle_word_diff, { desc = "Toggle word diff" })
map("n", "<leader>gtn", gs.toggle_numhl, { desc = "Toggle number highlight" })
map("n", "<leader>gtl", gs.toggle_linehl, { desc = "Toggle line highlight" })
map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle current line blame" })
map("n", "<leader>gts", gs.toggle_signs, { desc = "Toggle signs" })
map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle show deleted" })

-- Hunk navigation
map("n", "<leader>ggp", gs.prev_hunk, { desc = "Go to previous hunk" })
map("n", "<leader>ggn", gs.next_hunk, { desc = "Go to next hunk" })

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })

local harpoon = require("harpoon")
harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<leader>fm", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

-- <leader>fm via telescope for ui
vim.keymap.set("n", "<leader>m", function()
	harpoon:list():append()
end, { desc = "Make harpoon" })

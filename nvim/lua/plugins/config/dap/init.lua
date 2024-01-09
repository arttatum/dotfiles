local dap = require("dap")
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
		args = { "--port", "${port}" },
	},
}
dap.configurations.rust = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

vim.keymap.set("n", "<leader>Db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
vim.keymap.set("n", "<leader>Dc", dap.continue, { desc = "continue" })
vim.keymap.set("n", "<leader>Do", dap.step_over, { desc = "step over" })
vim.keymap.set("n", "<leader>Di", dap.step_into, { desc = "step into" })

local dapui = require("dapui")
dapui.setup()

vim.keymap.set("n", "<leader>Dx", dap.terminate, { desc = "step over" })

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup()

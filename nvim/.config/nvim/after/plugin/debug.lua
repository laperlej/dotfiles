require("dap-go").setup()
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap, dapui = require("dap"), require("dapui")
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

--local mason_python_path = vim.fn.stdpath("data") + "/mason/packages/debugpy/venv/bin/python"
local mason_python_path = "/home/laperlej/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			return mason_python_path
			-- return "/usr/bin/python3"
		end,
	},
}
dap.adapters.python = {
	type = "executable",
	command = mason_python_path,
	-- command = "python3",
	args = { "-m", "debugpy.adapter" },
}

local notify = require("notify")
local ts = vim.treesitter

local M = {}

local function round(float)
	return math.floor(float + 0.5)
end

local function get_cursor()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local row, col = cursor[1], cursor[2]
	return row - 1, col
end

local function get_parent_by_type(node, type)
	local cur = node
	while cur and cur:type() ~= type do
		cur = cur:parent()
	end
	return cur
end

local function get_child_by_type(node, type)
	local children = node:iter_children()
	for child in children do
		if child:type() == type then
			return child
		end
	end
end

local function get_text(node)
	local start_row, start_col, end_row, end_col = node:range()
	local lines = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
	return table.concat(lines, "")
end

function M.toggle()
	local row, col = get_cursor()
	local node = ts.get_node_at_pos(0, row, col, { ignore_injections = false })
	if node == nil then
		notify("No node found", "info", { timeout = 1000 })
		return
	end
	local function_node = get_parent_by_type(node, "function_declaration")
	if function_node == nil then
		notify("No function node found", "info", { timeout = 1000 })
		return
	end
	local parameters_node = get_child_by_type(function_node, "parameters")
	if parameters_node == nil then
		notify("No parameters node found", "info", { timeout = 1000 })
		return
	end

	local str = ""
	for child in parameters_node:iter_children() do
		if child:type() == "identifier" then
			str = str .. get_text(child) .. "\n"
		end
	end
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, 0, false, vim.split(str, "\n"))
	local ui = vim.api.nvim_list_uis()[1]
	local width = 20
	local height = 4
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = (ui.width - width) / 2,
		row = (ui.height - height) / 2,
		anchor = "NW",
		style = "minimal",
		border = "single",
	}
	vim.api.nvim_open_win(buf, true, opts)
end

return M

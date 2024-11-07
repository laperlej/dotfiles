local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>gd", function()
	vim.cmd.RustLsp("debug")
end, { silent = true, buffer = bufnr })

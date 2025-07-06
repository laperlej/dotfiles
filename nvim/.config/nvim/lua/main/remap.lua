local zenmode = require("zen-mode").toggle
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local neogit = require("neogit")
local fzf = require("fzf-lua")

vim.g.mapleader = " "

vim.api.nvim_create_user_command("G", neogit.open, { desc = "Open Neogit Status" })

-- copy paste
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

-- NetRw
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

--hardmode
vim.keymap.set("n", "<leader>hh", "<esc>:HardTimeToggle<cr>")

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--telescope
-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- vim.keymap.set("n", "<leader>fi", "<cmd>Telescope git_files<cr>")
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

--fzf-lua
vim.keymap.set("n", "<leader>ff", fzf.files)
vim.keymap.set("n", "<leader>fi", fzf.git_files)
vim.keymap.set("n", "<leader>fg", fzf.live_grep)
vim.keymap.set("n", "<leader>fb", fzf.buffers)
vim.keymap.set("n", "<leader>fh", fzf.tags)

--harpoon
vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hc", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>h1", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>h2", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>h3", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>h4", function()
	ui.nav_file(4)
end)
vim.keymap.set("n", "<leader>h5", function()
	ui.nav_file(5)
end)
vim.keymap.set("n", "<leader>h6", function()
	ui.nav_file(6)
end)

--navigation
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--lsp
local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
vim.keymap.set("n", "gr", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

--diagnostic
vim.keymap.set("n", "g?", '<cmd>lua vim.diagnostic.open_float({scope="line"})<CR>')

--zenmode
vim.keymap.set("n", "<leader>zz", function()
	zenmode({})
end, { noremap = true, silent = true })

--oil
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

--Trouble
vim.keymap.set("n", "<leader>tr", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })

-- Custom
vim.api.nvim_set_keymap(
	"n",
	"<leader>sc",
	"<cmd>lua require'plugins.custom'.toggle()<cr>",
	{ silent = true, noremap = true }
)

-- terminal
vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", { silent = true, noremap = true })

-- DAP
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>do", ":lua require'dapui'.toggle()<CR>")

-- Avante
vim.keymap.set("n", "<leader>aa", function()
	require("avante.api").ask()
end, { desc = "avante: ask" })
vim.keymap.set("v", "<leader>aa", function()
	require("avante.api").ask()
end, { desc = "avante: ask" })
vim.keymap.set("n", "<leader>ar", function()
	require("avante.api").refresh()
end, { desc = "avante: refresh" })
vim.keymap.set("v", "<leader>ae", function()
	require("avante.api").edit()
end, { desc = "avante: edit" })

-- Parrot
vim.keymap.set("n", "<leader>ac", ":PrtChatToggle<CR>")
vim.keymap.set("n", "<leader>am", ":PrtModel<CR>")
vim.keymap.set("n", "<leader>an", ":PrtChatNew<CR>")
vim.keymap.set("n", "<leader>ap", ":PrtProvider<CR>")
vim.keymap.set("n", "<leader>ag", ":PrtChatRespond<CR>")
vim.keymap.set("n", "<leader>ad", ":PrtChatDelete<CR>")

--format
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)

local trouble = require("trouble.providers.telescope")
local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		path_display = { "smart" },
		mappings = {
			i = {
				["<c-t>"] = trouble.open_with_trouble,
				["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble,
				["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = false,
			no_ignore_parent = false,
		},
	},
})
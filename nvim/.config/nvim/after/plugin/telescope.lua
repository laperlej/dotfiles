local trouble = require("trouble.sources.telescope")
local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		path_display = { "smart" },
		mappings = {
			i = {
				["<c-t>"] = trouble.open,
				["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble,
				["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
			},
		},
		file_ignore_patterns = {
			"node%_modules/.*",
			".git/.*",
			"release%-info/.*",
			"build/.*",
			".bemol/.*",
			".brazil/.*",
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

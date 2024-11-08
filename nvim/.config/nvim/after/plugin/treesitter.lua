require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"css",
		"dockerfile",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"hcl",
		--"html",
		"java",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"regex",
		"rust",
		"sql",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

require("treesitter-context").setup()

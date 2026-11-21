-- nvim 0.11: treesitter highlighting must be explicitly started.
-- nvim-treesitter plugin only manages parser installation now.

local ensure_installed = {
	"bash",
	"c",
	"css",
	"dockerfile",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"hcl",
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
}

local installed = require("nvim-treesitter").get_installed()
local to_install = vim.tbl_filter(function(lang)
	return not vim.list_contains(installed, lang)
end, ensure_installed)

if #to_install > 0 then
	require("nvim-treesitter").install(to_install)
end

-- Enable treesitter highlighting for all buffers with a parser
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

require("treesitter-context").setup()

require("colorizer").setup()

vim.opt.background = "dark"

require("tokyonight").setup({
	-- use the night style
	style = "night",
	transparent = true,
	transparent_sidebar = true,
	styles = {
		floats = "transparent",
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	},
	on_highlights = function(hl, c)
		hl.LineNr = { fg = c.orange }
		hl.CursorLineNr = { fg = c.orange }
	end,
})

require("catppuccin").setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	transparent_background = true,
	cmp = true,
	treesitter = true,
	notify = true,
	harpoon = true,
	markdown = true,
	mason = true,
	dap = true,
	dap_ui = true,
	ts_rainbow2 = true,
	render_markdown = true,
	telescope = true,
	trouble = true,
	custom_highlights = function(c)
		return {
			LineNr = { fg = c.peach },
			CursorLineNr = { fg = c.maroon },
		}
	end,
})

--vim.cmd([[colorscheme tokyonight]])
vim.cmd([[colorscheme catppuccin]])

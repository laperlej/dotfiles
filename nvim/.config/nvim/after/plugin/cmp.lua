-- Completion Plugin Setup
local cmp = require("cmp")
cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-j>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
        }),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	-- Installed sources:
	sources = {
		{ name = "path" }, -- file paths
		{ name = "nvim_lua" }, -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = "nvim_lsp" }, -- from language server
		{ name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
		{ name = "buffer", keyword_length = 2 }, -- source current buffer
		{ name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
		{ name = "calc" }, -- source for math calculation
	},
    sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,

          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find "^_+"
            local _, entry2_under = entry2.completion_item.label:find "^_+"
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,

          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
	experimental = {
		native_menu = false,
        ghost_text = true,
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				vsnip = "⋗",
				buffer = "Ω",
				path = "🖫",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

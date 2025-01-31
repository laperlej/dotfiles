require("lspconfig").pyright.setup({})
require("lspconfig").ts_ls.setup({
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})
require("lspconfig").terraformls.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim", "bufnr", "use" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})
require("lspconfig").html.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").zls.setup({})
require("lspconfig").helm_ls.setup({})
require("lspconfig").hls.setup({
	cmd = { "haskell-language-server-wrapper", "--lsp" },
})
require("lspconfig").jsonls.setup({})
--require("java").setup()
require("lspconfig").jdtls.setup({})

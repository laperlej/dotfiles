local null_ls = require("null-ls")

local sources = {
	-- null_ls.builtins.diagnostics.mypy.with({
	-- 	method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	-- }),
	null_ls.builtins.formatting.stylua,
	--null_ls.builtins.formatting.eslint_d,
	-- null_ls.builtins.diagnostics.eslint.with({
	-- 	method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	-- }),
	null_ls.builtins.formatting.prettierd,
	--null_ls.builtins.formatting.gofmt.with({ args = { "-w", "$FILENAME" }, to_stdin = false, to_temp_file = true }),
	null_ls.builtins.formatting.goimports,
	null_ls.builtins.diagnostics.golangci_lint,
	null_ls.builtins.diagnostics.revive,
	null_ls.builtins.diagnostics.sqlfluff.with({
		extra_args = { "--dialect", "postgres" }, -- change to your dialect
	}),
	null_ls.builtins.formatting.sqlfluff.with({
		extra_args = { "--dialect", "postgres" }, -- change to your dialect
	}),
    null_ls.builtins.formatting.isort,
	-- null_ls.builtins.diagnostics.checkstyle.with({
	-- 	extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
	-- }),
	-- null_ls.builtins.formatting.google_java_format,
	-- null_ls.builtins.diagnostics.pmd.with({
	-- 	extra_args = {
	-- 		"--cache",
	-- 		"/tmp/pmd_cache",
	-- 		"--rulesets",
	-- 		"category/java/bestpractices.xml,category/jsp/bestpractices.xml", -- or path to self-written ruleset
	-- 	},
	-- }),
}

require("null-ls").setup({
	debug = true,
	sources = sources,
	-- 	-- you can reuse a shared lspconfig on_attach callback here
	-- 	on_attach = function(client, bufnr)
	-- 		if client.server_capabilities.documentFormattingProvider then
	-- 			vim.cmd([[
	--                 augroup LspFormatting
	--                 autocmd! * <buffer>
	--                 autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
	--                 augroup END
	--                 ]])
	-- 		end
	-- 	end,
})

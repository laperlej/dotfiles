require("mason")

vim.lsp.config("pyright", {})
vim.lsp.config("ts_ls", {
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})
vim.lsp.config("terraformls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("lua_ls", {
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
vim.lsp.config("html", {})
vim.lsp.config("clangd", {})
vim.lsp.config("zls", {})
vim.lsp.config("elp", {})
vim.lsp.config("helm_ls", {})
vim.lsp.config("hls", {
	cmd = { "haskell-language-server-wrapper", "--lsp" },
})
vim.lsp.config("jsonls", {})
vim.lsp.config("jinja_lsp", {})

local function bemol()
	local buf_path = vim.api.nvim_buf_get_name(0)
	local bemol_dir = vim.fs.find({ ".bemol" }, { upward = true, type = "directory", path = vim.fs.dirname(buf_path) })[1]
	local ws_folders_lsp = {}
	if bemol_dir then
		local file = io.open(bemol_dir .. "/ws_root_folders", "r")
		if file then
			for line in file:lines() do
				table.insert(ws_folders_lsp, line)
			end
			file:close()
		end
	end

	local root = vim.fn.getcwd()
	for _, line in ipairs(ws_folders_lsp) do
		if line ~= root then
			pcall(vim.lsp.buf.add_workspace_folder, line)
		end
	end
end

local function jdtls_attach(_, bufnr)
	bemol()
end

vim.lsp.config("jdtls", {
	on_attach = jdtls_attach,
	cmd_env = {
		JAVA_HOME = "/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home",
	},
	cmd = {
		vim.fn.expand("~/.local/share/jdtls/bin/jdtls"),
		"--jvm-arg=-javaagent:" .. vim.fn.expand("~/.local/share/jdtls/lombok.jar"),
	},
	settings = {
		java = {
			configuration = {
				runtimes = {
					{ name = "JavaSE-1.8", path = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home" },
					{ name = "JavaSE-17", path = "/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home" },
					{ name = "JavaSE-21", path = "/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home" },
					{ name = "JavaSE-25", path = "/Library/Java/JavaVirtualMachines/amazon-corretto-25.jdk/Contents/Home", default = true },
				},
			},
			imports = {
				gradle = {
					wrapper = {
						checksums = {
							{
								sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
								allowed = true,
							},
						},
					},
					home = vim.fn.expand("$HOME/.gradle"),
				},
				trustAllGradleWrappers = true,
			},
		},
	},
})

vim.lsp.enable({
	"pyright", "ts_ls", "terraformls", "gopls", "lua_ls",
	"html", "clangd", "zls", "elp", "helm_ls", "hls",
	"jsonls", "jinja_lsp", "jdtls",
})

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Trust gradle wrappers in our Brazil workspaces
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "jdtls" then
			client:notify("workspace/didChangeConfiguration", {
				settings = {
					java = {
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
							},
						},
					},
				},
			})
		end
	end,
})

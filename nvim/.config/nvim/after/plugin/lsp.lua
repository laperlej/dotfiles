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

local function bemol()
    local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory' })[1]
    local ws_folders_lsp = {}
    if bemol_dir then
        local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
        if file then
            for line in file:lines() do
                table.insert(ws_folders_lsp, line)
            end
            file:close()
        end
    end

    for _, line in ipairs(ws_folders_lsp) do
        vim.lsp.buf.add_workspace_folder(line)
    end
end

local function jdtls_attach(_, bufnr)
    bemol()
end

require("lspconfig").jdtls.setup({
    on_attach = jdtls_attach,
    cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:" .. require("mason-registry")
        .get_package("jdtls")
        :get_install_path() .. "/lombok.jar",
    },
})

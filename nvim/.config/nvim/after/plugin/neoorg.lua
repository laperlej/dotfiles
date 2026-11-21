vim.opt.conceallevel = 3
require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {}, -- We added this line!
        ["core.qol.todo_items"] = {},
    }
})

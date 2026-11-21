require("fzf-lua").setup({
    file_ignore_patterns = {
        "node_modules/", ".git/", "release%-info/",
        "build/", ".bemol/", ".brazil/",
    },
    keymap = {
        fzf = {
            ["ctrl-q"] = "select-all+accept"
        }
    },
    files = {
        fd_opts = "--type f --hidden --exclude .git --exclude build --exclude bin --exclude node_modules --exclude .bemol --exclude .brazil --exclude release-info",
    },
    grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --glob '!build/' --glob '!bin/' --glob '!.bemol/' --glob '!.brazil/' --glob '!node_modules/' --glob '!release-info/'",
    },
})

require("main.set")
require("main.remap")

-- yank highlight
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
augroup END
]])

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
--vim.g.hardtime_default_on = 1

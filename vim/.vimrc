set relativenumber
"for typescipt syntax speed
set re=0
set hidden
set noswapfile
"set autoindent
"set expandtab
set paste
"set shiftround
"set softtabstop=2
set nocompatible
set redrawtime=20000
syntax on

command -nargs=1 V vertical resize <args>

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

"set termguicolors
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"let g:tokyonight_transparent_background = 1
"colorscheme tokyonight
"let g:airline_theme = "tokyonight"


let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-css']

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

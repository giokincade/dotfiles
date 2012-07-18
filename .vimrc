call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
let g:molokai_original = 0 
set t_Co=256
colorscheme molokai 
syntax on
set ignorecase
set expandtab
set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set incsearch
set number
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest,full

"make < > keep selection 
vnoremap < <gv
vnoremap > >gv

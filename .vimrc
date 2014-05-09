call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
let g:molokai_original = 0 
set t_Co=256
colorscheme molokai 
syntax on
set ignorecase
set expandtab
set nowrap
set nocompatible
set autoindent
filetype plugin indent on
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

"ctrlp settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 1

""turning off delimitMate for scala
au FileType scala let b:delimitMate_quotes = "\""

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.jar,*.sqllite,*pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f -not -path "*.class" -not -path "*.pyc" -not -path "*/tmp/*"'"

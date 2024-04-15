syntax on
filetype plugin indent on

" Add syntax highlighting on dotfiles
au BufReadPost .90poe set syntax=sh

" Set 2 space indentation for JS files
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

" Make backspace work like most other programs
set backspace=indent,eol,start

" Set Ctl-J as a shortcut to pretty-print JSON
:nnoremap <C-j> :%!python3 -m json.tool<CR>

" Set Ctrl-A to copy all lines to the clipboard
:nnoremap <C-a> :%y+<CR>

set ruler
set showcmd
set hlsearch

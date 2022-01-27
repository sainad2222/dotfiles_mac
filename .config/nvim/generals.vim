" setting leader
let mapleader=","
let g:mapleader=","

set updatetime=100          " default 4000ms results in poor user experience
set shortmess+=c            " don't show short messages like PATTERN NOT FOUND during searchs
set nu rnu                  " setting realtive numbers to lines
set tabstop=4               " sets tab to 4 spaces
set softtabstop=4           " inserts 4 spaces instead of 1 tab
set expandtab               " Use appropriate no of tabs acc to indentation
set shiftwidth=4            " useful in indentation
set splitbelow              " split below not above
set noswapfile              " no swap files plz
set nobackup                " no backup files too
set mouse=a                 " use mouse in vim
set clipboard=unnamedplus   " se system clipboard not just regiesters(imp)
set shell=zsh               " set zsh as shell
set scrolloff=8             " Just use this and thank me later
filetype on                 " to detect filetypes
filetype indent on          " indent based on filetype
set autoindent              " autoindent on 
set nowrap                  " don't wrap plz it's ugly
set hidden                  " When on a buffer becomes hidden when it is abandoned
set timeoutlen=250          " reduces timeoutlen from 1000 to 250u
set undofile


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

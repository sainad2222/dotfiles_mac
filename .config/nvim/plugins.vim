call plug#begin('~/.vim/plugged')
Plug 'hoob3rt/lualine.nvim'                                 " status bar
Plug 'jiangmiao/auto-pairs'                                 " Autocomplete bracket pairs
Plug 'Pocco81/AutoSave.nvim'                                " AutoSave
Plug 'scrooloose/nerdcommenter'                             " Commenting and uncommenting
Plug 'justinmk/vim-sneak'                                   " vim sneak for fast motion
Plug 'mbbill/undotree'                                      " undo tree
Plug 'lifepillar/vim-gruvbox8'                              " colorscheme gruvbox
Plug 'dracula/vim'                                          " colorscheme dracula
Plug 'ryanoasis/vim-devicons'                               " dev icons
Plug 'airblade/vim-gitgutter'                               " git status symbols in sidebar
Plug 'Yggdroot/indentLine'                                  " shows indentation with visual lines
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter mainly for syntax highlighting
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-fugitive'                                   " git tool for vim
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
" LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'neovim/nvim-lspconfig'

call plug#end()

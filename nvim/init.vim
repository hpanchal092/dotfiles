"
"  (_)__  (_) /_ _  __(_)_ _
" / / _ \/ / __/| |/ / /  ' \
"/_/_//_/_/\__(_)___/_/_/_/_/
"


" General settings
set nocompatible

set hidden
set wildmenu
set showcmd
set mouse=a

set backspace=indent,eol,start
set autoindent

set confirm
set clipboard=unnamedplus

set number relativenumber
set nowrap
set scrolloff=8
set signcolumn=number

set shiftwidth=4
set softtabstop=4
set expandtab
set splitright
set splitbelow

let mapleader=" "

" Vim Plug stuff
call plug#begin('~/.vim/plugged')

Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-commentary'

Plug 'navarasu/onedark.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

" Autopairs
lua require('nvim-autopairs').setup()

" Colorscheme
set termguicolors
lua require('onedark').setup { code_style = { comments = 'none' } }
colorscheme onedark

" Lualine
lua require('lualine').setup { options = { theme = 'onedark', icons_enabled = false } }

" Commentary
nmap <C-_> gcc
vmap <C-_> gc

" Telescope
lua require('telescope').load_extension('fzy_native')
nnoremap <C-P> <cmd>Telescope find_files<cr>
nnoremap <C-F> <cmd>Telescope live_grep<cr>
nnoremap <C-B> <cmd>Telescope buffers<cr>

" Fugitive
nnoremap <leader>gs <cmd>G<cr>

" Treesitter
lua << EOF
require('nvim-treesitter.configs').setup {
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    },
}
EOF

" LSP
source $HOME/.config/nvim/lsp.lua

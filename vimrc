" Use Vim settings, rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" Start by having Pathogen load any external bundles
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

syntax on
set number
set ruler

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Use solarized
set background=dark
colorscheme solarized

" Map <leader> to ,
let mapleader = ","

" Hit jj to exit insert mode
imap jj <Esc>

" Reload all config files
nnoremap <leader>rl :so ~/.vimrc<cr>:so ~/.gvimrc<cr>

" Minimum number of lines below/above the cursor when scrolling
set scrolloff=3

" Open a vertical/horizontal split, switch over to it
nnoremap <leader>s <C-w>s<C-w>j
nnoremap <leader>v <C-w>v<C-w>l

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

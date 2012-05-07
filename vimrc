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
set nowrap
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Search
set incsearch  " search as you type
set nohlsearch " don't highlight terms when searching
set ignorecase " make searching case insensitive
set smartcase  " unless there is a uppercase character

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Map <leader> to ,
let mapleader = ","

map <Leader>ee :tabedit ~/.vim/vimrc<CR>

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  
  " Source my vimrc file on save
  autocmd! BufWritePost vimrc source $MYVIMRC

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use solarized
set background=dark
colorscheme solarized

" Hit jj to exit insert mode
imap jj <Esc>

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

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Shortcut to rapidly toggle `set list`
nmap <Leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Ack options
map <Leader>a :Ack!<space>
map <Leader>h :nohlsearch<CR>

" NERDtree options
" convenient to have a hotkey for the NERDtree
nnoremap <F4> :NERDTreeToggle<CR>
" open up a NERDtree at startup if there are no files provided
autocmd vimenter * if !argc() | NERDTree | endif
" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CoffeeScript
" To recompile a file when it's written
autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

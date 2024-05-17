" ------------------------------------------------------------------------------
"
" Andrey A. Ugolnik
"
" ------------------------------------------------------------------------------
" List of plugins
" ------------------------------------------------------------------------------

" --- disable detection and indenting in one step ------------------------------
filetype indent off

call plug#begin('~/.vim/bundle')

" ------------------------------------------------------------------------------
" --- the list of plugins starts here ------------------------------------------

Plug 'morhetz/gruvbox'        " pretty nice colorscheme

Plug 'mhinz/vim-startify'

" Plug 'itchyny/lightline.vim', { 'on': [] }  " one of the best status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'     " is the premier Vim plugin for Git
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter' " a git diff in the sign column

Plug 'christoomey/vim-tmux-navigator' " easy vim/nvim + tmux pane navigation

Plug 'Chiel92/vim-autoformat' " clang-format for C, C++, Objective-C

" https://github.com/neoclide/coc.nvim
" clangd: https://github.com/clangd/coc-clangd
" snippets: https://github.com/neoclide/coc-snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'szw/vim-maximizer'      " maximizes and restores the current window in vim
Plug 'Valloric/ListToggle'    " toggle the display of the location and quickfix windows
Plug 'qpkorr/vim-bufkill'     " delete buffer without killing windows layout
Plug 'godlygeek/tabular'      " useful to line up text

Plug 'justinmk/vim-syntax-extra' " a collection of syntax definitions not yet shipped with stock vim
Plug 'tikhomirov/vim-glsl', { 'for': ['glsl'] }
Plug 'noahfrederick/vim-skeleton', { 'for': ['c','cpp','objc','objcpp'] }
Plug 'samsaga2/vim-z80', { 'for': ['asm'] }

" --- the list of plugins ends here --------------------------------------------
" ------------------------------------------------------------------------------

call plug#end()

" --- enable detection, plugins and indenting in one step ---------------------
filetype plugin indent on

" --- defer load --------------------------------------------------------------
" augroup OnReady
"     autocmd!
"     autocmd VimEnter * call plug#load('lightline.vim')
"                 \| autocmd! OnReady
" augroup END

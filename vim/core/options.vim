if &t_Co > 256 && has("termguicolors")
    set termguicolors
endif

syntax on               " allow syntax highlighting

set title               " change the terminal's title
set showcmd             " display incomplete commands
set nobackup
set nowritebackup
set noswapfile
set viminfo='100,<50,s10,h,n~/.vim/viminfo
set autoread            " W11: autoread file after it changed outside vim

set nomodeline

" highlight whitespaces in a convenient way
set list
"set listchars=tab:→\ ,trail:·,extends:»,nbsp:·,eol:¶
set listchars=tab:→\ ,trail:·,extends:»,nbsp:·
set listchars+=precedes:<,extends:>

let c_space_errors=1    " Highlight any spaces before tabs, and any whitespace at the end of a line
set hidden              " hides buffers instead of closing them
set switchbuf=useopen   " reveal already opened files from the quickfix window
                        " instead of opening new buffers
set number              " show the line number for each line
set nowrap              " don't wrap lines
set sidescroll=5
set scrolloff=5         " rows number to show while scrolling

set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch           " show search matches as you type
set encoding=utf-8      " character encoding used inside Vim
set fencs=utf-8,ucs-bom,cp1251   " a list of character encodings considered when starting to edit
set ffs=unix,dos        " formats that will be tried when starting to edit
" set lazyredraw          " don't update the display while executing macros

set showfulltag         " When completing by tag, show the whole tag, not just the function name
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set tabstop=4           " number of spaces a <Tab> in the text stands for
set shiftwidth=4        " number of spaces used for each step of (auto)indent
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab           " expand <Tab> to spaces in Insert mode
set autoindent          " automatically set the indent of a new line
set copyindent          " copy the previous indentation on autoindenting
set smartindent         " do clever autoindenting
set cindent             " enable specific indenting for C code
set smarttab            " insert tabs on the start of a line according to shiftwidth, not tabstop
" set cino+=N-s           " no namespace indent
set cino+=:0            " case: indent
set cino+=g0            " public: indent
set cino+=t0            " function return declaration
set cino+=(0            " unclosed prarntheses
set cino+=j1,(0,ws,Ws   " enable partial c++11 (lambda) support
set formatoptions-=t    " don't auto-indent plaintext

set history=1024        " keep N lines of command history
set cc=81,101
set ruler               " show the cursor position all the time
set hlsearch            " highlight searches
" set mouse=a             " have the mouse enabled all the time
" set virtualedit=all     " allow virtual editing in all modes
set diffopt+=iwhite     " add ignorance of whitespace to diff
set diffopt+=internal,algorithm:patience " handle diff internally (Vim 8.1.0360+)
let g:loaded_matchparen=1
set foldmethod=marker
" set foldopen&
" set foldclose=all
set popt+=syntax:y      " syntax when printing
set pastetoggle=<F10>   " mode that allow to paste text from clipboard without formating
set laststatus=2        " always show status line
set wildmenu            " enable command-line completion
set wildoptions+=pum    " matches are shown in a popup menu
set clipboard=unnamedplus,unnamed

" set completeopt=menu,menuone,longest
set completeopt=menuone,menu,longest,preview
set pumheight=15        " limit popup menu height

" set tags+=./tags

" --- persistent undo ---------------------------------------------------------
if v:version >= 703
    let s:undodir=$HOME.'/.local/state/vim/undo'

    if !isdirectory(s:undodir)
        call mkdir(s:undodir, 'p', 0700)
    endif

    set undofile " enable persistent undo
    let &undodir=s:undodir
endif

" --- netrw related config ----------------------------------------------------
let g:netrw_banner       = 0 " disable annoying banner
let g:netrw_altv         = 1 " open splits to the right
let g:netrw_altfile      = 1 " return to last browsing buffer
let g:netrw_liststyle    = 1 " 3 - tree view
" let g:netrw_list_hide    = netrw_gitignore#Hide()
" let g:netrw_list_hide   .= ',\(^\|\s\s\)\zs\.\S\+'

autocmd FileType netrw setlocal bufhidden=delete
autocmd FileType netrw nnoremap <buffer> gq :bd!<CR>


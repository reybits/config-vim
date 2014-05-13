scriptencoding utf-8
" ^^ Please leave the above line at the start of the file.


"" ----------------------------------------------------------------------------
""
"" Andrey A. Ugolnik / _Andrey_
"" created: 01.01.2009
"" modified: 23.07.2013
""
"" ----------------------------------------------------------------------------

" --- Use vim settings, rather then vi settings (much better!) ----------------
" --- This must be first, because it changes other options as a side effect ---
set nocompatible

filetype off " required before vundle or pathogen

" --- vundle plugin manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" -----------------------------------------------------------------------------
" vundle managed plugins
" -----------------------------------------------------------------------------

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle.git'

"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'Rip-Rip/clang_complete.git'
"Bundle 'TwitVim.git'
"Bundle 'bufexplorer.zip'
"Bundle 'calendar.vim'
"Bundle 'cscope.vim'
"Bundle 'errormarker.vim'
"Bundle 'ervandew/supertab'
"Bundle 'file-line'
"Bundle 'garbas/vim-snipmate'
"Bundle 'gregsexton/gitv'
"Bundle 'honza/vim-snippets'
"Bundle 'ifdef.vim'
"Bundle 'inccomplete'
"Bundle 'jceb/vim-orgmode'
"Bundle 'spolu/dwm.vim.git'
"Bundle 'tomtom/tlib_vim'
"Bundle 'tpope/vim-git'
" must have
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'a.vim'
" very useful
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'emezeske/manpageview.git'
Bundle 'majutsushi/tagbar'
"Bundle 'scrooloose/syntastic'
Bundle 'spacehi.vim'
Bundle 'tpope/vim-fugitive'
"Bundle 'YankRing.vim'
Bundle 'TaskList.vim'
"Bundle 'airblade/vim-gitgutter.git'
"Bundle 'sjl/gundo.vim.git'
"Bundle 'toggle_words.vim'
Bundle 'renamer.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'vim-scripts/Conque-GDB.git'

" -----------------------------------------------------------------------------



" --- enable detection, plugins and indenting in one step ---------------------
filetype plugin indent on
" -----------------------------------------------------------------------------

"set t_Co=256

" --- font used in Gvim -------------------------------------------------------
if has("gui_running")
    " Remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    " remove menubar
    set guioptions-=m

    if has("gui_macvim")
        set guifont=Pragmata:h18
    else
        set guifont=Pragmata\ 13
        "set guifont=Droid\ Sans\ Mono\ 12
        "set guifont=Liberation\ Mono\ 12
        "set guifont=Inconsolata\ 13
        "set guifont=Bitstream\ Vera\ Sans\ Mono\ 13
        "set guifont=Monospace\ 9
    endif

    " nice theme collection available at
    " http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
    "colorscheme torte
    "colorscheme asu1dark
    "colorscheme paintbox
    "colorscheme asmdev
    colorscheme Tomorrow-Night

    "set background=dark
    "colorscheme solarized

elseif (&t_Co == 256 || &t_Co == 88)
    "colorscheme asmdev
    colorscheme Tomorrow-Night

    "set background=dark
    "colorscheme solarized
else
    "colorscheme paintbox
    colorscheme asmdev
endif

syntax on               " allow syntax highlighting

set title               " change the terminal's title
set showcmd             " display incomplete commands
set nobackup
set noswapfile
set viminfo='100,<50,s10,h,n~/.vim/viminfo

" highlight whitespaces in a convenient way
set list
"set listchars=tab:→\ ,trail:·,extends:»,nbsp:·,eol:¶
set listchars=tab:→\ ,trail:·,extends:»,nbsp:·
let c_space_errors=1    " Highlight any spaces before tabs, and any whitespace at the end of a line

set autoread            " auto read file that has changed since editing started
set showmode            " always show what mode we're currently editing in
set hidden              " hides buffers instead of closing them
set switchbuf=useopen   " reveal already opened files from the quickfix window
                        " instead of opening new buffers
set nowrap              " don't wrap lines
set backspace=indent,eol,start          " allow backspacing over everything in insert mode
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch           " show search matches as you type

set fencs=utf8,ucs-bom,cp1251   " порядок перебора кодировок при открытии файла
set ffs=unix,dos        " порядок перебора fileformats
set cscopetag           " по Ctrl+] вести себя так же, как по g] (показывать варианты)
set lazyredraw          " don't update the display while executing macros

set tabstop=4           " number of spaces a <Tab> in the text stands for
set shiftwidth=4        " number of spaces used for each step of (auto)indent
set shiftround          " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab           " expand <Tab> to spaces in Insert mode
set autoindent          " automatically set the indent of a new line
set copyindent          " copy the previous indentation on autoindenting
set smartindent         " do clever autoindenting
set cindent             " enable specific indenting for C code
"set showfulltag         " When completing by tag, show the whole tag, not just the function name
set diffopt+=iwhite     " Add ignorance of whitespace to diff
set smarttab            " insert tabs on the start of a line according to shiftwidth, not tabstop
set cino+=:0            " case: indent
set cino+=g0            " public: indent
"set cursorline          " highlight current line
set number              " show the line number for each line
"set mouse=a             " have the mouse enabled all the time
set formatoptions-=t    " don't auto-indent plaintext
set history=1024        " keep N lines of command history
set cc=80,100
set ruler               " show the cursor position all the time
set hlsearch            " highlight searches
set showmatch           " проверка скобок
set foldmethod=syntax   " folds defined by syntax highlighting
set foldlevelstart=10    " set start folding level at file open
"set foldmethod=manual
"set foldopen&
"set foldclose=all
set popt+=syntax:y      " syntax when printing
set pastetoggle=<F10>   " mode that allow to paste text from clipboard without formating
set scrolloff=5         " rows number to show while scrolling
"set paste              " set this mode by default
" internal keyboard layout switcher Ctrl-^
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=-1
"set imcmdline

" complete options (disable preview scratch window)
"set completeopt=menuone,menu,longest,preview
set completeopt=menu,menuone,longest
set pumheight=15        " Limit popup menu height

" --- format od status line ---------------------------------------------------
set laststatus=2 " always put a status line in, even if there is only one window
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%k\                          " show current keymap
set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V,%{strlen(getline('.'))}%)\  " row / column position
set statusline+=%<%P                         " position in percent

" --- additional tags ---------------------------------------------------------
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/hgex
set tags+=~/.vimtags
set tags+=./tags

" --- force filetype for some files -------------------------------------------
autocmd BufNewFile,BufRead *.m set filetype=objc
autocmd BufNewFile,BufRead *.mm set filetype=objcpp

" --- enable cursor line only for current buffer ------------------------------
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au VimEnter,WinEnter,BufWinEnter *.xml setlocal nocursorline
    au WinLeave * setlocal nocursorline
augroup END

" --- higlight redundant tabs / spaces ----------------------------------------
autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * SpaceHi
autocmd FileType help NoSpaceHi

" --- show git diff in split window -------------------------------------------
autocmd FileType gitcommit DiffGitCached | wincmd p

"autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"autocmd BufEnter *.org call org#SetOrgFileType()

" --- switch to us keyboard layout when insert mode leaved --------------------
autocmd InsertLeave * call SetUsLayout()

function! SetUsLayout()
    if has('unix') && &term == 'builtin_gui'
        silent !qdbus ru.gentoo.KbddService /ru/gentoo/KbddService ru.gentoo.kbdd.set_layout 0 >/dev/null
    endif
endfunction

" --- always jump to the last cursor position "  ------------------------------
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \    exe "normal g'\"" |
    \ endif

" --- clean trailing whitespace before write buffer ---------------------------
autocmd BufWritePre * silent! execute '%s/\s\+$//'

" --- redraw window at startup because lazyredraw prevent screen redraw -------
autocmd VimEnter * redraw

" --- redate file headers automatically ---------------------------------------
"autocmd BufWritePre * call RedateHeader()

function! RedateHeader()
    " Mark the current position, and find the end of the header (if possible)
    silent! normal! msHmtgg$%

    if &modified
        set nomodified

        let lastline = line('.')
        if lastline == 1
            " Header not found, so use fifteen lines or the full file
            let lastline = Min(15, line('$'))
        endif
        " Replace any timestamps discovered, in whatever format
        silent! execute '1,' . lastline . 's/\m\%(date\|changed\?\|modifi\w\+\):\s\+"\?\zs\%(\a\|\d\|[/, :-.]\)*/\=strftime("%d.%m.%Y")/ie'
        " Increment the version marker
        silent! execute '1,' . lastline . "g/[Vv]ersion:/normal! $\<C-a>"
    endif

    " Restore the marked position
    silent! normal! 'tzt`s
endf

function! Min(number, ...)
    let result = a:number
    let index = a:0
    while index > 0
        let result = (a:{index} > result) ? result : a:{index}
        let index = index - 1
    endwhile
    return result
endf
" -----------------------------------------------------------------------------

" --- persistent undo ---------------------------------------------------------
if v:version >= 703
    set undofile " enable persistent undo

    " сделаем так, чтобы файлы undo появлялись не в текущей директории, а в нашей
    if has('win32') || has('win64')
        let s:undodir=$VIM.'/undofiles'
    else
        let s:undodir=$HOME.'/.vim/undofiles'
    endif
    let &undodir=s:undodir

    "" если каталог не существует, создадим его рекурсивно
    if !isdirectory(s:undodir)
        call mkdir(s:undodir, 'p', 0700)
    endif
endif
" -----------------------------------------------------------------------------



" --- ex command for toggling hex mode - define mapping if desired ------------
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary " make sure it overrides any textwidth, etc.
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
    else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction

" --- folding -----------------------------------------------------------------
"nnoremap <Space> za
"vnoremap <Space> za

" --- clean trailing whitespace -----------------------------------------------
nmap <silent> <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" --- go to defenition by semantic --------------------------------------------
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" --- toggle word under cursor ------------------------------------------------
nnoremap <leader>tw :ToggleWord<CR>

" --- clears the search register ----------------------------------------------
nmap <silent> <space> :nohlsearch<CR>

" --- useful movement in wrap mode --------------------------------------------
nnoremap <down> gj
nnoremap <up>   gk
nnoremap j      gj
nnoremap k      gk

" --- перемещение по элементам в quickfix -------------------------------------
nnoremap <A-j>      :cn<CR>zvzz:cc<CR>
inoremap <A-j> <Esc>:cn<CR>zvzz:cc<CR>a
nnoremap <A-k>      :cp<CR>zvzz:cc<CR>
inoremap <A-k> <Esc>:cp<CR>zvzz:cc<CR>a

" --- общение с буфером обмена X-сервера --------------------------------------
vmap <C-c> "+y
nmap <S-Insert> "*p
imap <S-Insert> <C-o><C-Insert>

" --- add highlighting for function definition in C++ -------------------------
autocmd Syntax cpp call EnhanceCppSyntax()

"function! EnhanceCppSyntax()
    "syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    "hi def link cppFuncDef Special
"endfunction

function! EnhanceCppSyntax()
    syn match    cCustomParen    "(" contains=cParen contains=cCppParen
    syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
    syn match    cppCustomScope    "::"
    syn match    cppCustomClass    "\w\+\s*::" contains=cCustomScope
    hi def link cCustomFunc  Function
endfunction

" --- show / hide the line number for each line -------------------------------
imap <F1> <Esc>:set<Space>nu!<CR>a
nmap <F1>      :set<Space>nu!<CR>

" --- show / hide TagBar window ----------------------------------------------
nnoremap <silent> <S-F1> :TagbarToggle<CR>

" --- show / hide NERDTree window ---------------------------------------------
map <S-F2> <Esc>:NERDTreeToggle<CR>

" --- toggles the quickfix window ---------------------------------------------
map <silent><F2> <Esc>:QFix<CR>

let g:jah_Quickfix_Win_Height = 10

command! -bang -nargs=? QFix call QFixToggle(<bang>0)

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        execute "copen " . g:jah_Quickfix_Win_Height
    endif
endfunction

" used to track the quickfix window
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
" -----------------------------------------------------------------------------

" --- TwitVim shortcuts -------------------------------------------------------
"nnoremap <F3> :FriendsTwitter<cr>
"nnoremap <S-F3> :UserTwitter<cr>
"nnoremap <A-F3> :RepliesTwitter<cr>
"nnoremap <C-F3> :DMTwitter<cr>

" --- search world under cursor in all files with current ext -----------------
"map <F4> :execute "noa vim /" . expand("<cword>") . "/gj **/*" . (expand("%:e")=="" ? "" : "." . expand("%:e")) <Bar> cw<CR>
map <F4> :execute "noa vim /" . expand("<cword>") . "/gj **/*.h **/*.c **/*.cpp" <Bar> cw<CR>

" --- copy definition in to implementation file -------------------------------
"nmap <F5> :CopyDefinition<CR>
"nmap <S-F5> :ImplementDefinition<CR>
"command! CopyDefinition :call s:GetDefinitionInfo()
"command! ImplementDefinition :call s:ImplementDefinition()
"function! s:GetDefinitionInfo()
    "exe 'normal ma'
    "" Get class
    "call search('^\s*\<class\>', 'b')
    "exe 'normal ^w"ayw'
    "let s:class = @a
    "let l:ns = search('^\s*\<namespace\>', 'b')
    "" Get namespace
    "if l:ns != 0
        "exe 'normal ^w"ayw'
        "let s:namespace = @a
    "else
        "let s:namespace = ''
    "endif
    "" Go back to definition
    "exe 'normal `a'
    "exe 'normal "aY'
    "let s:defline = substitute(@a, ';\n', '', '')
"endfunction

"function! s:ImplementDefinition()
    "call append('.', s:defline)
    "exe 'normal j'
    "" Remove keywords
    "s/\<virtual\>\s*//e
    "s/\<static\>\s*//e
    "if s:namespace == ''
        "let l:classString = s:class . "::"
    "else
        "let l:classString = s:namespace . "::" . s:class . "::"
    "endif
    "" Remove default parameters
    "s/\s\{-}=\s\{-}[^,)]\{1,}//e
    "" Add class qualifier
    "exe 'normal ^f(bi' . l:classString
    "" Add brackets
    "exe "normal $o{\<CR>\<TAB>\<CR>}\<CR>\<ESC>kkkk"
    "" Fix indentation
    "exe 'normal =4j^'
"endfunction
" -----------------------------------------------------------------------------

" --- show marks browser window -----------------------------------------------
"map <F6> <Esc>:MarksBrowser<CR>

" --- apell checking ----------------------------------------------------------
"map <F7> :w!<CR>:!aspell -c --encoding=utf-8 --lang=ru %<CR>:e! %<CR>

" --- show / hide Project window ----------------------------------------------
"nmap <silent> <F9> <Plug>ToggleProject

" --- клавиши для компиляции --------------------------------------------------
map <C-F9> <Esc>:make! linux<CR>

" --- find file in current directory tree -------------------------------------
"map <F10> <Esc>:FufCoverageFile<CR>

" --- run program if supported in Makefile ------------------------------------
map <C-F10> :!make run<CR>

" --- switch header / release -------------------------------------------------
map <F11> <Esc>:A<CR>
"map <F11> <Esc>:FSHere<CR>
" switching between .h and .cpp files that in the SAME directory.
"map <F11> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" --- open buffer explorer ----------------------------------------------------
"map <F12> <Esc>:BufExplorer<CR>
"map <F12> <Esc>:FufBuffer<CR>

" --- create tags -------------------------------------------------------------
map <C-F12> <Esc>:call MakeTags()<CR>
command! Maketags call MakeTags()
function! MakeTags()
    !ctags -R --sort=yes --c++-kinds=+p --fields=+liaS --extra=+q .
endfunction

" --- indent / unindent lines by Tab / Shift+Tab ------------------------------
"vmap   <Tab> :s/^/	/<CR>
" map   <Tab> :s/^/	/<CR>
"vmap <S-Tab> :s/^	//<CR>
" map <S-Tab> :s/^	//<CR>

" --- next / previous buffer by Ctrl+Tab / Ctrl+Shift+Tab ---------------------
set <F13>=[27;5;9~
set <F14>=[27;6;9~
nmap <F13> <Esc>:bn<CR>
nmap <F14> <Esc>:bp<CR>
" works in Gvim
map <C-Tab>   <Esc>:bn<CR>
map <C-S-Tab> <Esc>:bp<CR>

" --- automaticaly insert a closing parenthesis when typing an opening --------
" --- parenthesis  ------------------------------------------------------------
"inoremap { {<CR>}<Esc>O
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i

" --- Intelligent Home moves to the first non-blank character on the line, ----
" --- then to the very first character on the line ----------------------------
nmap <Home> :call HomeButton()<CR>
imap <Home> <C-O>:call HomeButton()<CR>
function! HomeButton()
    if col(".") != 1
        let current_cursor_column = col(".")
        execute("normal ^")
        if col(".") == current_cursor_column
            execute("normal 0")
        endif
    endif
endfunction

" --- In Normal mode intelligent End moves after the last character on the ----
" --- line if the line is not empty -------------------------------------------
nmap <End> :call EndButton()<CR>
function! EndButton()
    execute("normal $")
    if col("$") != 1
        execute("normal l")
    endif
endfunction


" --- show encoding menu by F8 ------------------------------------------------
set wildmenu
set wcm=<Tab>
menu Encoding.utf-8        :e ++enc=utf-8 <CR>
menu Encoding.ucs-bom      :e ++enc=ucs-bom<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.koi8-r       :e ++enc=koi8-r<CR>
menu Encoding.ibm-866      :e ++enc=ibm866<CR>
map <F8> :emenu Encoding.<TAB>



" -----------------------------------------------------------------------------
"  common config
" -----------------------------------------------------------------------------
let Grep_Skip_Dirs='.git .svn CVS .sass-cache'
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
" UltiSnips related config
" -----------------------------------------------------------------------------
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/ultisnips/UltiSnips'
let g:UltiSnipsExpandTrigger = '<c-\>'
"let g:UltiSnipsJumpForwardTrigger = '<c-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
" youcompleteme related config
" -----------------------------------------------------------------------------
let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_echo_current_diagnostic = 1
let g:ycm_enable_diagnostic_signs = 0
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
" syntastic related config
" -----------------------------------------------------------------------------
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = 'w'
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['c', 'cpp', 'objc', 'objcpp'],
            \ 'passive_filetypes': [''] }
"let g:syntastic_c_include_dirs = [ 'include', '../include', '/usr/src/include/hgex' ]
"let g:syntastic_cpp_include_dirs = [ 'include', '../include', '/usr/src/include/hgex' ]
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_config_file = '/home/andrey/.config/syntastic_cpp_config'
"" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
"  Task List related config
" -----------------------------------------------------------------------------
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  OmniCppComplete related config
" -----------------------------------------------------------------------------
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_ShowAccess = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_LocalSearchDecl = 1
"let OmniCpp_SelectFirstItem = 2

"" close automatically the preview window after a completion
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" -----------------------------------------------------------------------------


" -----------------------------------------------------------------------------
" NERDTree related config
" -----------------------------------------------------------------------------
let NERDTreeIgnore = ['.*\.o$', '.*\~$', '.*\.out$', '.*\.so$', '.*\.a$']
let NERDTreeQuitOnOpen = 1          " Quit on opening files from the tree
let NERDTreeHighlightCursorline = 1 " Highlight the selected entry in the tree
let NERDTreeChDirMode = 2           " change working directory
let NERDTreeMinimalUI = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  BufExplorer related config
" -----------------------------------------------------------------------------
"let g:bufExplorerShowTabBuffer = 1     " Yes.
"let g:bufExplorerShowRelativePath = 1  " Show relative paths.
"let g:bufExplorerShowUnlisted = 1      " Show unlisted buffers.
"let g:bufExplorerSortBy = 'mru'
""let g:bufExplorerSortBy = 'name'       " Sort by the buffer's name.
""let g:bufExplorerSortBy = 'fullpath'   " Sort by full file path name.
"let g:bufExplorerSplitBelow = 0        " Split new window above current.
"let g:bufExplorerSplitRight = 1        " Split right.
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" SuperTab option for context aware completion
" -----------------------------------------------------------------------------
"let g:SuperTabDefaultCompletionType = "context"
""let g:SuperTabContextDefaultCompletionType = '<c-x><c-o>'
""let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" Clang_complete related options
" -----------------------------------------------------------------------------
"let g:clang_complete_auto = 0 " Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_copen = 1 " Show clang errors in the quickfix window
"let g:clang_auto_select = 1
"let g:clang_complete_macros = 1
"" This gives access to many more clang features. Furthermore it automatically
"" caches all includes in memory. Updates after changes in the same file
"" will therefore be a lot faster.
"let g:clang_use_library = 1
"let g:clang_library_path = '/usr/lib64/llvm'
"" do some snippets magic after a ( or a , inside function call.
"let g:clang_close_preview = 1
"let g:clang_snippets = 0
"let g:clang_sort_algo = 'alpha'
""let g:clang_user_options = '-I/usr/lib64/clang/3.2/include/ -std=c++0x'
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" manpageview related options
" -----------------------------------------------------------------------------
let g:manpageview_options = '-a'
let g:manpageview_multimanpage = 3
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  Session related config
" -----------------------------------------------------------------------------
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_default_to_last = 1
let g:session_command_aliases = 1 " Session commands starts from 'Session'
set sessionoptions-=help     " If you don't want help windows to be restored:
set sessionoptions-=options  " Don't persist options and mappings because it can corrupt sessions.
"set sessionoptions-=tabpages " If you only want to save the current tab page.
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  TagBar related config
" -----------------------------------------------------------------------------
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  delimitMate related config
" -----------------------------------------------------------------------------
"let delimitMate_autoclose = 0
" -----------------------------------------------------------------------------
"


" -----------------------------------------------------------------------------
"  ProtoDef related config
" -----------------------------------------------------------------------------
"let g:protodefprotogetter = $VIM.'/bundle/protodef/pullproto.pl'
" let g:disable_protodef_mapping = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" doxygentoolkit related config
" -----------------------------------------------------------------------------
let g:DoxygenToolkit_authorName="Andrey A. Ugolnik"
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" CtrlP related config
" -----------------------------------------------------------------------------
"let g:ctrlp_dotfiles = 0

"When starting up, CtrlP sets its local working directory according to this
"variable:
  "c - the directory of the current file.
  "a - like "c", but only applies when the current working directory outside of
      "CtrlP isn't a direct ancestor of the directory of the current file.
  "r - the nearest ancestor that contains one of these directories or files:
      ".git .hg .svn .bzr _darcs
  "w - begin finding a root from the current working directory outside of CtrlP
      "instead of from the directory of the current file (default). Only applies
      "when "r" is also present.
  "0 or <empty> - disable this feature.
let g:ctrlp_working_path_mode = 'ra'

" Set this to 1 to enable the lazy-update feature: only update the match window
" after typing's been stopped for a certain amount of time:
let g:ctrlp_lazy_update = 0

" Set this to 1 to set searching by filename (as opposed to full path)
let g:ctrlp_by_filename = 0

"let g:ctrlp_mruf_include = '\.h$|\.c$\|\.cpp$|\.m$|\.mm$'
let g:ctrlp_extensions = ['mixed', 'bookmarkdir']
let g:ctrlp_cmd = 'CtrlPMixed'

"unlet g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|build)$|\v[\/](gen|bin|obj|build|libs|assets)$',
            \ 'file': '\v\.(o|o\.d|so|dll|exe)$@<!$'
            \ }
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux

" Set this to 1 to show only MRU files in the current working directory: >
let g:ctrlp_mruf_relative = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  YankRing related config
" -----------------------------------------------------------------------------
let g:yankring_paste_using_g = 0
let g:yankring_manage_numbered_reg = 1
let g:yankring_history_dir = $HOME.'/.vim'
let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  IncComplete related config
" -----------------------------------------------------------------------------
"let g:inccomplete_sort = 'ignorecase'
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  ErrorMarker related config
" -----------------------------------------------------------------------------
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  gitgutter related config
" -----------------------------------------------------------------------------
  let g:gitgutter_enabled = 0
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  TaskList related config
" -----------------------------------------------------------------------------
let g:tlTokenList = ['todo', 'fixme']
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  AirLine related config
" -----------------------------------------------------------------------------
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline_paste_symbol = 'ρ'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_branch_prefix = '⎇  '
let g:airline_readonly_symbol = ''

let g:airline_enable_branch = 1
let g:airline_enable_tagbar = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  TwitVim related config
" -----------------------------------------------------------------------------
"let twitvim_enable_python = 1
"let twitvim_api_root = "https://api.twitter.com/1"
"let twitvim_browser_cmd = "firefox"
"let twitvim_show_header = 0
"let twitvim_timestamp_format = '%I:%M %p'
"let twitvim_net_timeout = 30
" -----------------------------------------------------------------------------


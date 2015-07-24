scriptencoding utf-8
" ^^ Please leave the above line at the start of the file.

"" ----------------------------------------------------------------------------
""
"" Andrey A. Ugolnik / _Andrey_
""
"" ----------------------------------------------------------------------------

let s:MSWindows = has('win95') + has('win16') + has('win32') + has('win64')

" on Windows use .vim instead vimfiles
if s:MSWindows
    set runtimepath=$HOME/.vim
    set runtimepath+=$VIM/vimfiles
    set runtimepath+=$VIMRUNTIME
    set runtimepath+=$VIM/vimfiles/after
    set runtimepath+=$HOME/.vim/after
endif

if has('vim_starting')
    " --- Use vim settings, rather then vi settings (much better!) ----------------
    " --- This must be first, because it changes other options as a side effect ---
    set nocompatible

    if s:MSWindows
        lan mes en_EN.UTF-8
        set langmenu=en_EN.UTF-8
    endif
endif

filetype off " required before vundle or pathogen

" -----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

" must have
Plug 'bling/vim-airline'
Plug 'Shougo/vimproc.vim'
Plug 'a.vim', { 'for': ['c','cpp','objc','objcpp'] }
Plug 'kien/ctrlp.vim'
if s:MSWindows
    Plug 'Shougo/neocomplete.vim'
else
    Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': './install.sh --clang-completer --system-libclang' }
endif
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'scrooloose/nerdcommenter'
" very useful
Plug 'andreyugolnik/manpageview'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'renamer.vim'
Plug 'scrooloose/syntastic', { 'for': ['c','cpp','objc','objcpp'] }
Plug 'spacehi.vim'
Plug 'TaskList.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'dart-lang/dart-vim-plugin', { 'for': ['dart'] }

"Plug 'jeaye/color_coded', { 'do': 'cmake . && make && make install' }
"Plug 'derekwyatt/vim-protodef', { 'for': ['c','cpp'] }
"Plug 'derekwyatt/vim-fswitch', { 'for': ['c','cpp','objc','objcpp'] }
"Plug 'mtth/scratch.vim'
"Plug 'DoxygenToolkit.vim'

call plug#end()

augroup load_snippets
    autocmd!
    autocmd InsertEnter * call plug#load('ultisnips')
                \| autocmd! load_snippets
augroup END
augroup load_ycm
    autocmd!
    autocmd InsertEnter *.c,*.cpp,*.h,*.m,*.mm call plug#load('YouCompleteMe')
                \| call youcompleteme#Enable() | autocmd! load_ycm
augroup END
" -----------------------------------------------------------------------------

" --- enable detection, plugins and indenting in one step ---------------------
filetype plugin indent on

" -----------------------------------------------------------------------------

set t_Co=256

if v:version >= 704
    " The new Vim regex engine is currently slooooow as hell which makes syntax
    " highlighting slow, which introduces typing latency.
    " Consider removing this in the future when the new regex engine becomes
    " faster.
    set regexpengine=1
endif

" --- font used in Gvim -------------------------------------------------------
if has("gui_running")
    set guioptions-=T " disable toolbar
    set guioptions-=l " disable left scroolbar
    set guioptions-=L " disable left scroolbar
    set guioptions-=r " disable right scroolbar
    set guioptions-=R " disable right scroolbar
    set guioptions-=m " remove menubar
    set guioptions+=c " use console dialogs instead of popup dialogs for simple choices.
    set guioptions-=e " disable gui tabs

    " Русский текст для теста начертания символов
    if has("gui_macvim")
        set guifont=Menlo:h18
        colorscheme Tomorrow-Night
    elseif s:MSWindows
        set guifont=lucida_console:h14:cRUSSIAN
        colorscheme asmdev
    else
        "set guifont=Pragmata\ 13
        set guifont=Droid\ Sans\ Mono\ 12
        "set guifont=Liberation\ Mono\ 12
        "set guifont=Inconsolata\ 13
        "set guifont=Bitstream\ Vera\ Sans\ Mono\ 13
        "set guifont=Monospace\ 9
        colorscheme Tomorrow-Night
    endif

    " nice theme collection available at
    " http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
    "colorscheme torte
    "colorscheme asu1dark
    "colorscheme paintbox

    "set background=dark
    "colorscheme solarized

elseif (&t_Co == 256 || &t_Co == 88)
    if s:MSWindows
        colorscheme asmdev
    else
        colorscheme Tomorrow-Night
    endif
else
    "colorscheme asmdev
endif

syntax on               " allow syntax highlighting

set title               " change the terminal's title
set showcmd             " display incomplete commands
set nobackup
set noswapfile
set viminfo='100,<50,s10,h,n~/.vim/viminfo
set autoread            " W11: autoread file after it changed outside vim

" highlight whitespaces in a convenient way
set list
"set listchars=tab:→\ ,trail:·,extends:»,nbsp:·,eol:¶
set listchars=tab:→\ ,trail:·,extends:»,nbsp:·
let c_space_errors=1    " Highlight any spaces before tabs, and any whitespace at the end of a line

set showmode            " always show what mode we're currently editing in
set hidden              " hides buffers instead of closing them
set switchbuf=useopen   " reveal already opened files from the quickfix window
                        " instead of opening new buffers
set nowrap              " don't wrap lines
set backspace=indent,eol,start          " allow backspacing over everything in insert mode
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch           " show search matches as you type

set encoding=utf-8
set fencs=utf-8,ucs-bom,cp1251   " порядок перебора кодировок при открытии файла
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
set foldmethod=marker
"set foldopen&
"set foldclose=all
set popt+=syntax:y      " syntax when printing
set pastetoggle=<F10>   " mode that allow to paste text from clipboard without formating
set scrolloff=5         " rows number to show while scrolling

" complete options (disable preview scratch window)
"set completeopt=menuone,menu,longest,preview
set completeopt=menu,menuone,longest
set pumheight=15        " Limit popup menu height

" --- format od status line ---------------------------------------------------
set laststatus=2 " always put a status line in, even if there is only one window
"set statusline=
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%m%r%w                     " flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding},                " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
"set statusline+=%k\                          " show current keymap
"set statusline+=0x%-8B\                      " current char
"set statusline+=%-14.(%l,%c%V,%{strlen(getline('.'))}%)\  " row / column position
"set statusline+=%<%P                         " position in percent

" --- additional tags ---------------------------------------------------------
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/hgex
"set tags+=~/.vimtags
set tags+=./tags

" --- force filetype for some files -------------------------------------------
autocmd BufNewFile,BufRead *.m set filetype=objc
autocmd BufNewFile,BufRead *.mm set filetype=objcpp

" --- add header for new file -------------------------------------------------
autocmd BufNewFile *.c,*.cpp,*.h,*.m,*.mm
    \ if !empty(glob('~/.vim/snippets/header.cpp')) |
    \   0r ~/.vim/snippets/header.cpp |
    \ endif

" --- higlight word under cursor ----------------------------------------------
augroup AutoHighlight
    au!
    au CursorHold * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    setlocal updatetime=300
augroup END

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
"autocmd FileType gitcommit DiffGitCached | wincmd p
"autocmd FileType gitcommit
    "\ if exists(':DiffGitCached') |
    "\   if ! &previewwindow && expand('%:t') !~# 'index' |
    "\     :DiffGitCached |
    "\   endif |
    "\ endif

"autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"autocmd BufEnter *.org call org#SetOrgFileType()

" --- switch to us keyboard layout when insert mode leaved --------------------
autocmd InsertLeave *
    \ if has('unix') && &term == 'builtin_gui' |
    \   silent !qdbus ru.gentoo.KbddService /ru/gentoo/KbddService ru.gentoo.kbdd.set_layout 0 >/dev/null |
    \ endif

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

"function! RedateHeader()
    "" Mark the current position, and find the end of the header (if possible)
    "silent! normal! msHmtgg$%

    "if &modified
        "set nomodified

        "let lastline = line('.')
        "if lastline == 1
            "" Header not found, so use fifteen lines or the full file
            "let lastline = Min(15, line('$'))
        "endif
        "" Replace any timestamps discovered, in whatever format
        "silent! execute '1,' . lastline . 's/\m\%(date\|changed\?\|modifi\w\+\):\s\+"\?\zs\%(\a\|\d\|[/, :-.]\)*/\=strftime("%d.%m.%Y")/ie'
        "" Increment the version marker
        "silent! execute '1,' . lastline . "g/[Vv]ersion:/normal! $\<C-a>"
    "endif

    "" Restore the marked position
    "silent! normal! 'tzt`s
"endf

"function! Min(number, ...)
    "let result = a:number
    "let index = a:0
    "while index > 0
        "let result = (a:{index} > result) ? result : a:{index}
        "let index = index - 1
    "endwhile
    "return result
"endf
" -----------------------------------------------------------------------------

" --- persistent undo ---------------------------------------------------------
if v:version >= 703
    set undofile " enable persistent undo

    " сделаем так, чтобы файлы undo появлялись не в текущей директории, а в нашей
    "if s:MSWindows
        "let s:undodir=$VIM.'/undofiles'
    "else
        let s:undodir=$HOME.'/.vim/undofiles'
    "endif
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

" --- disable arrow keys ------------------------------------------------------
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" --- useful movement in wrap mode --------------------------------------------
nnoremap j gj
nnoremap k gk
"nnoremap <down> gj
"nnoremap <up>   gk

" --- перемещение по элементам в quickfix -------------------------------------
nnoremap <A-j>      :cn<CR>zvzz:cc<CR>
inoremap <A-j> <Esc>:cn<CR>zvzz:cc<CR>a
nnoremap <A-k>      :cp<CR>zvzz:cc<CR>
inoremap <A-k> <Esc>:cp<CR>zvzz:cc<CR>a

" --- общение с буфером обмена X-сервера --------------------------------------
vmap <C-c> "+y
nmap <S-Insert> "+p
imap <S-Insert> <C-o><C-Insert>

" --- add highlighting for function definition in C++ -------------------------
autocmd Syntax cpp call EnhanceCppSyntax()
function! EnhanceCppSyntax()
    syn match cCustomParen   "(" contains=cParen contains=cCppParen
    syn match cCustomFunc    "\w\+\s*(" contains=cCustomParen
    syn match cppCustomScope "::"
    syn match cppCustomClass "\w\+\s*::" contains=cCustomScope
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

" --- search world under cursor in all files with current ext -----------------
map <F4> <Esc>:GrepWordInFiles<CR>:cw<CR>
command! GrepWordInFiles :call s:GrepInFiles()
function! s:GrepInFiles()
    let s:ext = expand("%:e")
    if s:ext == "cpp" || s:ext == "c" || s:ext == "h"
        let s:mask = "**/*.h **/*.c **/*.cpp"
    else
        let s:mask = "**/*" . (s:ext == "" ? "" : ".") . s:ext
    endif

    let s:word = expand("<cword>")
    execute "noa vim /\\<" . s:word . "\\>/gj " . s:mask
endfunction

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

" --- клавиши для компиляции --------------------------------------------------
if has("mac")
    map <C-F9> <Esc>:make! osx<CR>
elseif s:MSWindows
    map <C-F9> <Esc>:make! win<CR>
else
    map <C-F9> <Esc>:make! linux<CR>
endif

" --- run program if supported in Makefile ------------------------------------
map <C-F10> :!make run<CR>

" --- switch header / release -------------------------------------------------
map <F11> <Esc>:A<CR>
"map <F11> <Esc>:FSHere<CR>
"au! BufEnter *.cpp let b:fswitchdst = 'h,hpp'
"au! BufEnter *.h let b:fswitchdst = 'cpp,mm,m'
"au! BufEnter *.m,*.mm let b:fswitchdst = 'h'

" --- create tags -------------------------------------------------------------
map <C-F12> <Esc>:call MakeTags()<CR>
command! Maketags call MakeTags()
function! MakeTags()
    if has("gui_macvim")
        " ctags from brew
        !/usr/local/bin/ctags -R --sort=yes --c++-kinds=+p --fields=+liaS --extra=+q .
    else
        !ctags -R --sort=yes --c++-kinds=+p --fields=+liaS --extra=+q .
    endif
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
let Grep_Skip_Dirs = '.git .svn CVS .sass-cache'
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
" UltiSnips related config
" -----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger      = '<c-\>'
let g:UltiSnipsEnableSnipMate     = 1
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/snippets'
"let g:UltiSnipsJumpForwardTrigger = '<c-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
" neocomplete related config
" -----------------------------------------------------------------------------
if s:MSWindows
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_overwrite_completefunc = 1
    let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.objc = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
    let g:neocomplete#force_omni_input_patterns.objcpp = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0
    let g:clang_use_library = 1
endif
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" youcompleteme related config
" -----------------------------------------------------------------------------
let g:ycm_global_ycm_extra_conf               = $HOME.'/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                  = 0
let g:ycm_complete_in_comments                = 1
let g:ycm_complete_in_strings                 = 1
let g:ycm_echo_current_diagnostic             = 1
let g:ycm_enable_diagnostic_signs             = 1
let g:ycm_enable_diagnostic_highlighting      = 0
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_min_num_identifier_candidate_chars  = 0
let g:ycm_use_ultisnips_completer             = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" A.vim related config
" -----------------------------------------------------------------------------
let g:alternateExtensions_cpp = "h,H,hpp,HPP"
let g:alternateExtensions_CPP = "h,H,hpp,HPP"
let g:alternateExtensions_mm  = "h"
let g:alternateExtensions_m   = "h"
let g:alternateExtensions_c   = "h,H"
let g:alternateExtensions_C   = "h,H"
let g:alternateExtensions_h   = "cpp,mm,c,m,CPP,C"
let g:alternateExtensions_H   = "cpp,mm,c,m,CPP,C"
let g:alternateExtensions_hpp = "cpp,mm,c,CPP"
let g:alternateExtensions_HPP = "cpp,mm,c,CPP"
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" syntastic related config
" -----------------------------------------------------------------------------
let g:syntastic_error_symbol         = '✗'
let g:syntastic_warning_symbol       = '⚠'
let g:syntastic_style_error_symbol   = '⚡'
let g:syntastic_style_warning_symbol = '⚡'
let g:syntastic_mode_map             = {
            \ 'mode' : 'passive',
            \ 'active_filetypes' : ['c', 'cpp', 'objc', 'objcpp'],
            \ 'passive_filetypes': ['']
            \ }
"let g:syntastic_c_include_dirs = [ 'include', '../include', '/usr/src/include/hgex' ]
"let g:syntastic_cpp_include_dirs = [ 'include', '../include', '/usr/src/include/hgex' ]
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_config_file = '/home/andrey/.config/syntastic_cpp_config'
"" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
"  Task List related config
" -----------------------------------------------------------------------------
let g:tlTokenList                 = ['todo', 'fixme']
let Tlist_Auto_Update             = 1
let Tlist_Close_On_Select         = 1
let Tlist_Exit_OnlyWindow         = 1
let Tlist_GainFocus_On_ToggleOpen = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" NERDTree related config
" -----------------------------------------------------------------------------
let NERDTreeIgnore = ['.*\.o$', '.*\~$', '.*\.out$', '.*\.so$', '.*\.a$']
let NERDTreeQuitOnOpen          = 1 " Quit on opening files from the tree
let NERDTreeHighlightCursorline = 1 " Highlight the selected entry in the tree
let NERDTreeChDirMode           = 2 " change working directory
let NERDTreeMinimalUI           = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" manpageview related options
" -----------------------------------------------------------------------------
let g:manpageview_options      = '-a'
let g:manpageview_multimanpage = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  Session related config
" -----------------------------------------------------------------------------
let g:session_directory       = '~/.vim/sessions'
let g:session_autoload        = 'yes'
let g:session_autosave        = 'yes'
let g:session_default_to_last = 1
let g:session_command_aliases = 1 " Session commands starts from 'Session'
let g:session_persist_colors  = 0 " Prevent save the color scheme and the ‘background’ option
set sessionoptions-=help     " If you don't want help windows to be restored:
set sessionoptions-=options  " Don't persist options and mappings because it can corrupt sessions.
"set sessionoptions-=tabpages " If you only want to save the current tab page.
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  TagBar related config
" -----------------------------------------------------------------------------
let g:tagbar_left      = 1
let g:tagbar_width     = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" doxygentoolkit related config
" -----------------------------------------------------------------------------
let g:DoxygenToolkit_authorName = "Andrey A. Ugolnik"
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
"let g:ctrlp_working_path_mode = 'ra'

" Set this to 1 to enable the lazy-update feature: only update the match window
" after typing's been stopped for a certain amount of time:
let g:ctrlp_lazy_update = 0

" Set this to 1 to set searching by filename (as opposed to full path)
let g:ctrlp_by_filename = 1

"let g:ctrlp_mruf_include = '\.h$|\.c$\|\.cpp$|\.m$|\.mm$'
let g:ctrlp_extensions = ['mixed', 'bookmarkdir', 'funky']
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
let g:yankring_paste_using_g       = 0
let g:yankring_manage_numbered_reg = 1
let g:yankring_history_dir         = $HOME.'/.vim'
let g:yankring_replace_n_pkey      = '<m-p>'
let g:yankring_replace_n_nkey      = '<m-n>'
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  ErrorMarker related config
" -----------------------------------------------------------------------------
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" Java error format support by walker from LOR
" -----------------------------------------------------------------------------
set efm^=\ %#[javac]\ %#%f:%l:\ %m
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  AirLine related config
" -----------------------------------------------------------------------------
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.paste = 'ρ'
if s:MSWindows || has("mac")
    let g:airline_symbols.branch = 'b'
    let g:airline_symbols.readonly = '-'
    let g:airline_symbols.linenr = ''
else
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '¶'
endif

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
" -----------------------------------------------------------------------------

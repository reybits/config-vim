" --- disable arrow keys ------------------------------------------------------
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <up> <cmd>echo 'Use k to move!'<cr>
nnoremap <down> <cmd>echo 'Use j to move!'<cr>

" --- navigate tabs -----------------------------------------------------------
nnoremap <right> <cmd>tabnext<cr>
nnoremap <left> <cmd>tabprevious<cr>

" --- simplified window navigation --------------------------------------------
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" --- move selected line / block of text in visual mode -----------------------
vnoremap J :m'>+1<CR>gv=`<my`>mzgv`yo`z
vnoremap K :m'<-2<CR>gv=`>my`<mzgv`yo`z

" --- useful movement in wrap mode --------------------------------------------
nnoremap j gj
nnoremap k gk

" --- clears the search register ----------------------------------------------
nnoremap <silent> <esc> <cmd>nohlsearch<cr>

" --- split window ------------------------------------------------------------
nnoremap <silent> <leader>wv <c-w>v
nnoremap <silent> <leader>wh <c-w>s

" --- toggle split ------------------------------------------------------------
nnoremap <silent> <leader>ws <cmd>exe '1wincmd w \| wincmd '.(winwidth(0) == &columns ? 'H' : 'K')<cr>

" --- close window ------------------------------------------------------------
nnoremap <silent> <leader>wd <cmd>close<cr>
nnoremap <silent> <leader>wD <c-w><c-o>

" --- maximize / restore ------------------------------------------------------
nnoremap <silent> <leader>wz <cmd>MaximizerToggle<cr>

" --- clean trailing whitespace -----------------------------------------------
nnoremap <silent> <leader>W :silent! %s/\s\+$//<cr>:let @/=''<cr>

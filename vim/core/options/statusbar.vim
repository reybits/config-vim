" remove '-- INSERT --'
set noshowmode

" --- airline -----------------------------------------------------------------
set ttimeoutlen=10

let g:airline_powerline_fonts = 1
" let g:airline_theme = 'atomic'


" --- lightline ---------------------------------------------------------------
function! LightlineFileformat()
    return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 80 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

let g:lightline = {
        \ 'active': {
        \   'left': [
        \             [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename' ],
        \           ],
        \   'right': [
        \             [ 'lineinfo', 'percent' ],
        \             [ 'fileformat', 'fileencoding' ],
        \             [ 'cocstatus' ],
        \           ],
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \   'cocstatus': 'coc#status',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype'
        \ },
        \ 'component': {
        \   'paste': '%{&paste?"P":""}',
        \   'lineinfo': '%3l:%-2v%<',
        \ },
        \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
    \ }


" -----------------------------------------------------------------------------
"  Lightline related config
" -----------------------------------------------------------------------------
let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
            \ },
            \ 'component_function': {
            \   'fileformat': 'LightlineFileformat',
            \   'filetype': 'LightlineFiletype',
            \   'gitbranch': 'fugitive#head',
            \   'cocstatus': 'coc#status'
            \ },
            \ 'component': {
            \   'lineinfo': '0x%02B : %3l:%-2v',
            \ },
            \ }

function! LightlineFileformat()
    return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 80 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

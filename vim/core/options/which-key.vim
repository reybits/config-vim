" -----------------------------------------------------------------------------
" vim-which-key related config
" -----------------------------------------------------------------------------

nnoremap <silent> <leader> :WhichKey '<space>'<cr>
let g:which_key_map = {}
call which_key#register('<space>', 'g:which_key_map')
set timeoutlen=500
let g:which_key_use_floating_win = 1


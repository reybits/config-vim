" -----------------------------------------------------------------------------
" vim-which-key related config
" -----------------------------------------------------------------------------

nnoremap <silent> <leader> :WhichKey '<space>'<cr>
let g:which_key_map = {}

let g:which_key_map.a = { 'name' : '+AI' }
let g:which_key_map.a.a = 'toggle copilot chat'
let g:which_key_map.a.c = 'commit copilot message'

let g:which_key_map.b = { 'name' : '+Buffer' }
let g:which_key_map.b.f = 'Format'

let g:which_key_map.c = { 'name' : '+Code' }
let g:which_key_map.c.a = 'code action'
let g:which_key_map.c.f = 'quickfix'
let g:which_key_map.c.d = 'diagnostics'
let g:which_key_map.c.o = 'code outline'
let g:which_key_map.c.R = 'rename references'

let g:which_key_map.f = { 'name' : '+File' }
let g:which_key_map["<spc>"] = 'Files'

let g:which_key_map.g = { 'name' : '+Git' }
let g:which_key_map.g.g = 'git'
let g:which_key_map.g.b = 'blame'
let g:which_key_map.g.l = 'log'

let g:which_key_map.s = { 'name' : '+Search' }
let g:which_key_map.s.g = 'live grep'
let g:which_key_map.s.w = 'grep word'

let g:which_key_map.q = 'toggle quickfix'

let g:which_key_map.w = { 'name' : '+Window' }
let g:which_key_map.w.d = 'close current window'
let g:which_key_map.w.D = 'close other windows'
let g:which_key_map.w.h = 'split window horizontally'
let g:which_key_map.w.v = 'split window verticaly'
let g:which_key_map.w.s = 'toggle split layout'
let g:which_key_map.w.z = 'maximize window'

" To register the descriptions when using the on-demand load feature,
" use the autocmd hook to call which_key#register(), e.g., register for the Space key:
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
" call which_key#register('<Space>', 'g:which_key_map')

set timeoutlen=500
let g:which_key_use_floating_win = 1


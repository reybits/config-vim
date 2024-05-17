set sessionoptions=blank,curdir,folds,help,tabpages,winpos

let g:startify_custom_indices = ['a', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm']
let g:startify_padding_left = 3

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'
" let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'

let g:startify_session_dir = '$HOME/.local/state/vim/sessions'

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_enable_special      = 0
let g:startify_files_number        = 5
let g:startify_relative_path       = 0
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1

autocmd User Startified setlocal cursorline

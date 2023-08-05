" -----------------------------------------------------------------------------
" syntastic related config
" -----------------------------------------------------------------------------

let g:syntastic_error_symbol         = '✖' " '✗'
let g:syntastic_warning_symbol       = '►' " '⚠'
let g:syntastic_style_error_symbol   = '⚡'
let g:syntastic_style_warning_symbol = '⚡'
let g:syntastic_mode_map             = {
            \ 'mode' : 'active',
            \ 'active_filetypes' : ['c', 'cpp', 'objc', 'objcpp'],
            \ 'passive_filetypes': ['']
            \ }
"let g:syntastic_c_include_dirs            = [ 'include', '../include' ]
"let g:syntastic_cpp_include_dirs          = [ 'include', '../include' ]
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_compiler              = 'clang++'
"let g:syntastic_cpp_config_file           = $HOME.'/.vim/syntastic_cpp_config'

let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++
            \ -Wall -Wextra -Wshadow -Wpointer-arith
            \ -Wcast-align -Wwrite-strings -Wmissing-prototypes
            \ -Wmissing-declarations -Wredundant-decls -Wnested-externs
            \ -Winline -Wno-long-long -Wuninitialized -Wconversion
            \ -Wstrict-prototypes -pedantic'
let g:syntastic_tex_checkers         = ['lacheck']
let g:syntastic_c_compiler_options   = '-std=c11 -stdlib=libc++
            \ -Wall -Wextra -Wshadow -Wpointer-arith
            \ -Wcast-align -Wwrite-strings -Wmissing-prototypes
            \ -Wmissing-declarations -Wredundant-decls -Wnested-externs
            \ -Winline -Wno-long-long -Wuninitialized -Wconversion
            \ -Wstrict-prototypes -pedantic'
let g:syntastic_stl_format               = '[ = > ln:%F (%t)]'
let g:syntastic_aggregate_errors         = 1
let g:syntastic_enable_signs             = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 2
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_c_no_include_search      = 1
let g:syntastic_c_auto_refresh_includes  = 1
let g:syntastic_c_check_header           = 1

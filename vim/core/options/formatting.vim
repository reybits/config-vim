" -----------------------------------------------------------------------------
"  vim-autoformat related config
" -----------------------------------------------------------------------------

" use clang-format with G=gg or other = indent options.
" autocmd FileType c,cpp,objc,objcpp setlocal equalprg=clang-format

" json, javascript, html support:
" $ npm install -g js-beautify

" astyle for C++, C and ObjC
" let g:formatdef_astyle_c = '"astyle --mode=c --style=ansi -xC80 -U -j -k1 -m0 -xW -w -Y -pcH".(&expandtab ? "s".shiftwidth() : "t")'
let g:formatdef_astyle_c = '"astyle --mode=c --style=ansi -N -U -j -k1 -m0 -xW -w -Y -pcH".(&expandtab ? "s".shiftwidth() : "t")'
let g:formatters_c = ['clangformat', 'astyle_c']

let g:formatdef_astyle_cpp = g:formatdef_astyle_c
let g:formatters_cpp = ['clangformat', 'astyle_cpp']

let g:formatdef_astyle_objc = '"astyle --mode=c --style=ansi -xM -xQ -xP2 -N -U -j -k1 -m0 -xW -w -Y -pcH".(&expandtab ? "s".shiftwidth() : "t")'
let g:formatters_objc = ['clangformat', 'astyle_objc']

let g:formatdef_astyle_objcpp = g:formatdef_astyle_objc
let g:formatters_objcpp = ['clangformat', 'astyle_objcpp']

nnoremap <silent><leader>bf <cmd>Autoformat<cr>

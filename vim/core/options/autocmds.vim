" --- enable cursor line only for current buffer ------------------------------
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au VimEnter,WinEnter,BufWinEnter *.xml setlocal nocursorline
au WinLeave * setlocal nocursorline

" --- always jump to the last cursor position ---------------------------------
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \    exe "normal g'\"" |
    \ endif


" --- close window with q -----------------------------------------------------
au FileType help,qf nmap q <cmd>close<cr>

" --- force filetype for some files -------------------------------------------
au BufNewFile,BufRead *.m set filetype=objc
au BufNewFile,BufRead *.mm set filetype=objcpp
au BufNewFile,BufRead *.ino set filetype=cpp
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.vsh,*.fsh set filetype=glsl

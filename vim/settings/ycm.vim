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

" let g:ycm_show_diagnostics_ui            = 0

" Move and resize widow on YcmDiags command
function! s:CustomizeYcmLocationWindow()
    " Move the window to the top of the screen.
    wincmd K
    " Set the window height to 5.
    5wincmd _
    " Switch back to working window.
    wincmd p
endfunction
autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

" Move and resize widow on YcmDiags command
function! s:CustomizeYcmQuickFixWindow()
    " Move the window to the top of the screen.
    wincmd K
    " Set the window height to 5.
    5wincmd _
endfunction

autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()
" -----------------------------------------------------------------------------

" --- YCM go to defenition by semantic ----------------------------------------
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>a :YcmCompleter GoTo<cr>
nnoremap <leader>d :YcmCompleter GoToDefinition<cr>
nnoremap <leader>s :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>o :YcmCompleter GetDoc<cr>



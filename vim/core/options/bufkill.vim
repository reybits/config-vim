" INFO: Due to BufKill plugin can't correctly close netrw window.
augroup BufKillNetrw
  autocmd!
  autocmd FileType netrw nnoremap <buffer> <leader>bd :bd!<CR>
augroup END


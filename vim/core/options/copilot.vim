" -----------------------------------------------------------------------------
"  copilot-chat.vim related config
" -----------------------------------------------------------------------------

let g:copilot_chat_disable_mappings = 0
let g:copilot_reuse_active_chat = 1

" Toggle or open a new CopilotChat window.
nnoremap <leader>aa :CopilotChatToggle<cr>

" Toggle or open a new CopilotChat window with prompts.
nnoremap <leader>ac :CopilotChat > gitcommit<cr>
nnoremap <leader>ae :CopilotChat > explain<cr>
nnoremap <leader>ar :CopilotChat > refactor<cr>
nnoremap <leader>ad :CopilotChat > docs<cr>

" Add visual selection to CopilotChat window.
vmap <leader>a <Plug>CopilotChatAddSelection

augroup CopilotChatMaps
    autocmd!

    " Close the CopilotChat buffer with gq (forcefully).
    autocmd FileType copilot_chat nnoremap <buffer> gq :bd!<cr>

    " Submit message to Copilot.
    autocmd FileType copilot_chat inoremap <buffer> <c-s> <esc>:CopilotChatSubmit<cr>
    autocmd FileType copilot_chat nnoremap <buffer> <c-s> :CopilotChatSubmit<cr>
augroup END

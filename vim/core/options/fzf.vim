" -----------------------------------------------------------------------------
" FZF related config
" -----------------------------------------------------------------------------

nnoremap <silent><leader>, <cmd>Buffers<cr>
nnoremap <silent><leader>bl <cmd>Buffers<cr>

nnoremap <silent><leader><space> <cmd>Files<cr>
nnoremap <silent><leader>ff <cmd>Files<cr>
nnoremap <silent><leader>sw <cmd>execute 'Rg ' . expand("<cword>")<cr>
nnoremap <silent><leader>sg <cmd>Rg<cr>

" mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

if has("popupwin")
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
    let g:fzf_vim = {}
    let g:fzf_vim.preview_window = ['up,75%', 'ctrl-/']
else
    let g:fzf_layout = { 'down': '30%' }
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" let g:fzf_action = {
"             \ 'ctrl-t': 'tab split',
"             \ 'ctrl-x': 'split',
"             \ 'ctrl-v': 'vsplit' }

" let g:fzf_command_prefix = 'Fzf'
let g:fzf_history_dir = $HOME.'/.local/state/vim/fzf-history'
let g:fzf_tags_command = 'ctags -R --sort=yes --c++-kinds=+p --fields=+liaS --extra=+q'

let $FZF_DEFAULT_OPTS="--inline-info"

if executable('fd')
    let $FZF_DEFAULT_COMMAND = 'fd --ignore-vcs -tl -tf'
elseif executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --vimgrep'
endif


" -----------------------------------------------------------------------------
" CtrlP related config
" -----------------------------------------------------------------------------
"let g:ctrlp_dotfiles = 0

"When starting up, CtrlP sets its local working directory according to this
"variable:
  "c - the directory of the current file.
  "a - like "c", but only applies when the current working directory outside of
      "CtrlP isn't a direct ancestor of the directory of the current file.
  "r - the nearest ancestor that contains one of these directories or files:
      ".git .hg .svn .bzr _darcs
  "w - begin finding a root from the current working directory outside of CtrlP
      "instead of from the directory of the current file (default). Only applies
      "when "r" is also present.
  "0 or <empty> - disable this feature.
"let g:ctrlp_working_path_mode = 'ra'

" Set this to 1 to enable the lazy-update feature: only update the match window
" after typing's been stopped for a certain amount of time:
let g:ctrlp_lazy_update = 1

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'

" Set this to 1 to set searching by filename (as opposed to full path)
let g:ctrlp_by_filename = 1

"let g:ctrlp_mruf_include = '\.h$|\.c$\|\.cpp$|\.m$|\.mm$'
let g:ctrlp_extensions = ['mixed']
let g:ctrlp_cmd = 'CtrlPMixed'

"unlet g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/](gen|bin|obj|build|libs|assets|tmp|temp)$',
            \ 'file': '\v\.(o|o\.d|so|dll|exe)$@<!$'
            \ }

let g:ctrlp_mruf_relative = 1 " MRU only in the current working directory.
let g:ctrlp_mruf_exclude = '' " exclude all MRU mask
let g:ctrlp_mruf_save_on_update = 0

if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
else
    " Ignore files in .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

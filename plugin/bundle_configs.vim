"
" kien/ctrlp.vim
" ==============

map <leader>] :CtrlP<CR>
map <leader>} :CtrlPLine<CR>
" Use The Silver Searcher
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif



"
" tpope/vim-markdown
" ==================

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']



"
" christoomey/vim-tmux-navigator
" ==============================

let g:tmux_navigator_no_mappings = 1
nmap <silent> <c-h> :TmuxNavigateLeft<cr>
nmap <silent> <c-j> :TmuxNavigateDown<cr>
nmap <silent> <c-k> :TmuxNavigateUp<cr>
nmap <silent> <C-l> :TmuxNavigateRight<cr>
nmap <silent> <c-\> :TmuxNavigatePrevious<cr>

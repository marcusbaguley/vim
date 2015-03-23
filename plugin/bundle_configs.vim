"
" thoughtbot/vim-rspec
" ====================

let g:rspec_command = "!clear; zeus rspec {spec}"
" let g:rspec_command = "Make {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>



"
" thoughtbot/pick.vim
" ===================

nnoremap <Leader>] :call PickFile()<CR>


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

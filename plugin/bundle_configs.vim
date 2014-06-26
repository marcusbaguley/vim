"
" kien/ctrlp.vim
" ==============

map <leader>] :CtrlP<CR>
map <leader>} :CtrlPLine<CR>
let g:ctrlp_custom_ignore = 'public/spree/products'
" Use The Silver Searcher
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif



"
" scrooloose/nerdtree
" ===================

map <leader>[ :NERDTreeToggle<CR>
map <leader>{ :NERDTreeFind<CR>



"
" tpope/vim-markdown
" ==================

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']



"
" scrooloose/syntastic
" ====================

let g:syntastic_always_populate_loc_list=1



"
" christoomey/vim-tmux-navigator
" ==============================

let g:tmux_navigator_no_mappings = 1
nmap <silent> <c-h> :TmuxNavigateLeft<cr>
nmap <silent> <c-j> :TmuxNavigateDown<cr>
nmap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:TmuxNavigateRight<CR><C-l>
nmap <silent> <c-\> :TmuxNavigatePrevious<cr>



"
" AndrewRadev/switch.vim
" ======================

nnoremap - :Switch<cr>



"
" thoughtbot/vim-rspec
" ====================

let g:rspec_command = "!clear; zeus rspec {spec}"
nmap <leader>R :let g:rspec_command = "!clear; bundle exec rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>



" "
" " tomtom/quickfixsigns_vim
" " ========================

" highlight SignColumn guibg=background
" highlight SignColumn ctermbg=8
" let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']
" let g:quickfixsigns_balloon=0

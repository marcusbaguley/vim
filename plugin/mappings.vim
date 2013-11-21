" Rspec.vim mappings
let g:rspec_command = "!clear; zeus rspec {spec}"
nmap <leader>R :let g:rspec_command = "!clear; zeus rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>



" Tmux navigator
let g:tmux_navigator_no_mappings = 1
nmap <silent> <c-h> :TmuxNavigateLeft<cr>
nmap <silent> <c-j> :TmuxNavigateDown<cr>
nmap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:TmuxNavigateRight<CR><C-l>
nmap <silent> <c-\> :TmuxNavigatePrevious<cr>



" Pretty json
nmap <leader>j :%!python -m json.tool
vmap <leader>j :!python -m json.tool



" re-highlight after indenting
vnoremap < <gv
vnoremap > >gv



" navigate tabs
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprevious<CR>



" Switch.vim
nnoremap - :Switch<cr>



" hide highlighting
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>



" NERDTree
map <leader>[ :NERDTreeToggle<CR>
map <leader>{ :NERDTreeFind<CR>



" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>



" ctrl-p
map <leader>] :CtrlP<CR>
map <leader>} :CtrlPLine<CR>



" grep
command! -nargs=+ NewGrep execute "silent grep! -i <args>" | copen 20 | redraw!
nmap <leader>g :NewGrep 
nmap <leader>G :NewGrep <cword><CR>
vmap <leader>g "hy:NewGrep '<C-r>h'
vmap <leader>G "hy:NewGrep '<C-r>h'<CR>



" visual star
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction



" searching and replace
xnoremap <C-r> :<C-u>call <SID>VSetSearch()<CR>:,$s/<C-R>=@/<CR>//gc<left><left><left>



" remove trailing whitespace
nmap <leader>w :%s/\s\+$//g<CR>



" tidy html
nmap <leader>T :%!tidy --tidy-mark no -indent --indent-spaces 2 -quiet -xml
vmap <leader>T :'<,'>!tidy --tidy-mark no -indent --indent-spaces 2 -quiet -xml



" Center the display line after searches. (This makes it *much* easier to see
" the matched line.)
"
" More info: http://www.vim.org/tips/tip.php?tip_id=528
"
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

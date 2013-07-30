set pastetoggle=<F12>



let g:tmux_navigator_no_mappings = 1
nmap <silent> <c-h> :TmuxNavigateLeft<cr>
nmap <silent> <c-j> :TmuxNavigateDown<cr>
nmap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:TmuxNavigateRight<CR><C-l>
nmap <silent> <c-\> :TmuxNavigatePrevious<cr>



nmap <leader>j :%!python -m json.tool
vmap <leader>j :!python -m json.tool



let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'open %URL%'



" set paste toggle
set pastetoggle=<F2>



" re-highlight after indenting
vnoremap < <gv
vnoremap > >gv



" run rails_best_practices on current file
nmap <leader>b :!rails_best_practices --without-color %<CR>



" open markdown preview in background
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>



" dont use arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>



" surround.vim
let g:surround_{char2nr("c")} = "<div\1class: \r..*\r class=\"&\"\1>\r</div>"



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



" Netrw
" map <leader>[ :E<CR>




" Use CTRL-S for saving, also in Insert mode
noremap <M-s> :update<CR>
vnoremap <M-s> <C-C>:update<CR>
inoremap <M-s> <C-O>:update<CR>



" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>



" save and load sessions, respectively
nmap <F3> :call SaveSession()<CR>
nmap <F4> :so ~/.vim/sessions/



" ctrl-p
map <leader>] :CtrlP<CR>
map <leader>} :CtrlPLine<CR>



" ack
nmap <leader>a :Ack! -i '<cword>'<CR>
nmap <leader>A :Ack! -i ''<left>
vmap <leader>a "hy:Ack! -iQ '<C-r>h'<CR>
vmap <leader>A "hy:Ack! -iQ '<C-r>h'



" grep
" nmap <leader>g :grep -ir . --exclude-dir log --exclude-dir tmp '<cword>'<CR>
" nmap <leader>G :grep -ir . --exclude-dir log --exclude-dir tmp ''<left>
" vmap <leader>g "hy:grep -iQ '<C-r>h'<CR>
" vmap <leader>G "hy:grep -iQ '<C-r>h'



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
" xnoremap <C-r> "hy:,$s/<C-r>h//gc<left><left><left>
xnoremap <C-r> :<C-u>call <SID>VSetSearch()<CR>:,$s/<C-R>=@/<CR>//gc<left><left><left>
" vmap <C-r> "hy:,$s/<C-r>h//gc|1,''-&&
"vmap <C-r> :,$s/BEFORE/AFTER/gc|1,''-&&



" remove trailing whitespace
nmap <leader>tw :%s/\s\+$//g<CR>



" tidy html
nmap <leader>T :%!tidy --tidy-mark no -indent --indent-spaces 2 -quiet -xml
vmap <leader>T :'<,'>!tidy --tidy-mark no -indent --indent-spaces 2 -quiet -xml



" Underline and comment
" noremap <silent> <Leader>ul :t.\|s/\w\zs./=/g\|set nohl<cr>
nmap <Leader>ul VgUyypv$r=gck
" noremap <silent> <Leader>ul VU:t.<cr>v$r=
" imap \ul <Esc><Esc>VUyypv$r=gcckO<Esc>3jO



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

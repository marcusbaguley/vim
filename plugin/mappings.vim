" Quick breakpoint (binding.pry)
nmap <leader>b Obinding.pry<esc>
nmap <leader>B :g/^\s*binding\.pry/d<CR>



" Pretty json
nmap <leader>j :%!python -m json.tool
vmap <leader>j :!python -m json.tool



" re-highlight after indenting
vnoremap < <gv
vnoremap > >gv



" navigate tabs
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprevious<CR>



" hide highlighting
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>



" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>



" grep
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow 20|redraw!
nmap <leader>g :Ag<space>
vnoremap <leader>g "hy:Ag '<C-r>h'
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>



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
" vnoremap <C-r> "ry:,$S/<c-r>r//gc<left><left><left>
vnoremap <C-r> :<C-u>call <SID>VSetSearch()<CR>:,$s/<C-R>=@/<CR>//gc<left><left><left>



" remove trailing whitespace
nmap <leader>w :%s/\s\+$//g<CR>



" tidy html
nmap <leader>T :%!tidy --tidy-mark no -indent --indent-spaces 2 -quiet -xml
vmap <leader>T :'<,'>!tidy --tidy-mark no -indent --indent-spaces 2 -quiet -xml



" Center the display line after searches
" (This makes it *much* easier to see the matched line)
"
" More info: http://www.vim.org/tips/tip.php?tip_id=528
"
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

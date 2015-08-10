" Swap hash comment for the one after
nmap <leader># I# <esc>_dt#$pxF#i <esc>_xx

" Copy & paste to system clipboard with <Leader>p and <Leader>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader>y "+y
nmap <Leader>Y "+Y
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>d "+d
nmap <Leader>D "+D




" Quick make current file
nmap <leader>m :Make %:=line('.')<CR><CR>
nmap <leader>M :Make! %<CR>



" Insert current line
let @l="=line('.')"



" :Explore
nnoremap - :Explore<cr>



" Pretty json
nmap <leader>j :%!python -m json.tool
vmap <leader>j :!python -m json.tool



" re-highlight after indenting
vnoremap < <gv
vnoremap > >gv



" grep
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow 20|redraw!
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



" " Center the display line after searches
" " (This makes it *much* easier to see the matched line)
" "
" " More info: http://www.vim.org/tips/tip.php?tip_id=528
" "
" nnoremap n nzz
" nnoremap N Nzz
" nnoremap * *zz
" nnoremap # #zz
" nnoremap g* g*zz
" nnoremap g# g#zz

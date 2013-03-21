nmap <Leader>m :silent !/Applications/Marked.app/Contents/MacOS/Marked %&<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff for zeus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!zeus cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!zeus rspec --no-color")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!zeus rspec --no-color" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

map <leader>S :call RunCurrentTest() <CR>
map <leader>s :call RunCurrentLineInTest() <CR>








" map <leader>S :!zeus rspec --no-color %<CR>
" map <leader>s :execute("!zeus rspec --no-color %:" . line("."))<CR>




" function! RSpecFile()
"   execute("!zeus rspec --no-color %")
" endfunction
" map <leader>S :call RSpecFile() <CR>
" " command! RSpecFile call RSpecFile()

" function! RSpecCurrent()
"   execute("!zeus rspec --no-color %:" . line("."))
" endfunction
" map <leader>s :call RSpecCurrent() <CR>
" " command! RSpecCurrent call RSpecCurrent()

" nmap <leader>s :!rspec --no-color %<CR>




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



" Keyboard mappings
" hide hightlighting on return
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>



" NERDTree
map <leader>[ :NERDTreeToggle<CR>
map <leader>{ :NERDTreeFind<CR>



" Netrw
" map <leader>[ :E<CR>




" Use CTRL-S for saving, also in Insert mode
noremap <M-s> :update<CR>
vnoremap <M-s> <C-C>:update<CR>
inoremap <M-s> <C-O>:update<CR>



" NERD Commenter toggle
" map <D-/> <leader>c<space>



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
nmap <leader>T :%!tidy --tidy-mark no -indent --indent-spaces 2 -quiet 



" Underline and comment
" noremap <silent> <Leader>ul :t.\|s/\w\zs./=/g\|set nohl<cr>
noremap <silent> <Leader>ul VU:t.<cr>v$r=
imap \ul <Esc><Esc>VUyypv$r=<Leader><Leader>kO<Esc>3jO



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

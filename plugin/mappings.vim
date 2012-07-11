" vim-slime
let g:slime_target = "tmux"

" Keyboard mappings
" hide hightlighting on return
nnoremap <CR> :noh<CR><CR>

" NERDTree
map <leader>[ :NERDTreeToggle<CR>
map <leader>{ :NERDTreeFind<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <M-s> :update<CR>
vnoremap <M-s> <C-C>:update<CR>
inoremap <M-s> <C-O>:update<CR>

" NERD Commenter toggle
map <D-/> <leader>c<space>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" save and load sessions, respectively
nmap <F3> :call SaveSession()<CR>
nmap <F4> :so ~/.vim/sessions/

"map <Leader>r :call system("open http://railsapi.com/doc/rails-v3.0.8rc1_rspecrails-v1.3.4_ruby-v1.9.2/?q=<cword>")
map <Leader>r :silent !open "http://railsapi.com/doc/rails-v3.0.8rc1_rspecrails-v1.3.4_ruby-v1.9.2/?q=<cword>"<CR>
map <Leader>R :silent !open "http://apidock.com/rails/?q=<cword>"<CR>

" ctrl-p
map <leader>] :CtrlP<CR>

" ack
nmap <leader>a :Ack! -i "<cword>"<CR>
nmap <leader>A :Ack! -i ""<left>
vmap <leader>a "hy:Ack! -i "<C-r>h"<CR>
vmap <leader>A "hy:Ack! -i "<C-r>h"

" search and replace
vmap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"vmap <C-r> "hy:,$s/<C-r>h//gc|1,''-&&
"vmap <C-r> :,$s/BEFORE/AFTER/gc|1,''-&&

" remove trailing whitespace
nmap <leader>tw :%s/\s\+$//g<CR>

" tidy html
command Tidy %!tidy --tidy-mark no -indent --indent-spaces 2 -quiet

" Underline cur line with =
noremap <silent> <Leader>ul :t.\|s/./=/g\|set nohls<cr>

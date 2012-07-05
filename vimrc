" This setting prevents vim from emulating the original vi's bugs and limitations.
set nocompatible
" set macmeta


fun SetupVAM()
  set runtimepath+=~/.vim-addons/vim-addon-manager
  call vam#ActivateAddons(["The_NERD_tree", "The_NERD_Commenter", "molokai", "Command-T", "ack", "ZoomWin", "ragtag", "vim-coffee-script", "github:jpalardy/vim-slime.git", "abolish", "AutoTag", "github:tpope/vim-rails.git", "github:tpope/vim-rake.git", "github:tpope/vim-bundler.git", "github:tpope/vim-unimpaired.git", "github:tpope/vim-fugitive.git", "snipmate-snippets", "vividchalk", "github:godlygeek/tabular.git", "github:tpope/vim-surround.git"],{'auto_install' : 0})
endf
call SetupVAM()
" experimental: run after gui has been started [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()

" GUI options
"colorscheme molokai
colorscheme vividchalk
set guioptions=
set ruler
set number

" Custom cursor
if has("gui_running")
  set cursorline
  set cursorcolumn
  "set guicursor="n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175"
  "set guicursor+=a:blinkon0
  set guicursor=n-v:block-nCursor
  " Highlight trailing whitespace.
  autocmd BufWinEnter * match Todo /\s\+$/
endif

" NERD commenter requires filetypes turned on
filetype plugin on


set hidden " Buffers can be hidden and edited
set autoread " automatically load changes to open files


" Formatting and indentation
"set nowrap
" Use spaces instead of tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"set smartindent
"filetype indent on
filetype indent plugin on


" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

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

" command-T
let g:CommandTMaxHeight=20
map <leader>] :CommandT<CR>
map <leader>]M :CommandT<CR>app/models/
map <leader>]C :CommandT<CR>app/controllers/
map <leader>]V :CommandT<CR>app/views/
map <leader>]L :CommandT<CR>lib/
map <leader>]E :CommandT<CR>config/environments/
map <leader>]S :CommandT<CR>spec/
map <leader>]Sc :CommandT<CR>spec/controllers/
map <leader>]Sm :CommandT<CR>spec/models/

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

" Tabularize
if exists(":Tabularize")
  nmap <leader>t= :Tabularize /=<CR>
  vmap <leader>t= :Tabularize /=<CR>
  nmap <leader>t: :Tabularize /:\zs<CR>
  vmap <leader>t: :Tabularize /:\zs<CR>
endif

"Directories for swp files
set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files

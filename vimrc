" This setting prevents vim from emulating the original vi's bugs and limitations.
set nocompatible
" set macmeta


fun SetupVAM()
  set runtimepath+=~/.vim-addons/vim-addon-manager
  call vam#ActivateAddons(["The_NERD_tree", "The_NERD_Commenter", "molokai", "rails", "fugitive", "Command-T", "ack", "ZoomWin", "ragtag", "vim-coffee-script"],{'auto_install' : 0})
endf
call SetupVAM()
" experimental: run after gui has been started [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()

" GUI options
colorscheme molokai
set guioptions=
set ruler
set number

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


" Keyboard mappings
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
" map <Leader>r :call system("open http://railsapi.com/doc/rails-v3.0.8rc1_ruby-v1.8/?q=<cword>")
map <Leader>r :silent !open http://railsapi.com/doc/rails-v3.0.8rc1_ruby-v1.8/?q=<cword><CR>
" command-T
map <leader>] :CommandT<CR>


"Directories for swp files
set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files


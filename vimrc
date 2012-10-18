set nocompatible



"
" Vundle
" ======

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'



"
" Bundles for Vundle
" ==================

Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/AutoTag'
Bundle 'jpalardy/vim-slime'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Tim Pope's useful plugins
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'

" vim-snipmate and dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

" new syntax
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'duwanis/tomdoc.vim'

" ruby specific
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'AndrewRadev/switch.vim'

" textobjects
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-indent'
Bundle 'lucapette/vim-textobj-underscore'

runtime macros/matchit.vim
Bundle 'nelstrom/vim-textobj-rubyblock'

" colorschemes
Bundle 'tpope/vim-vividchalk'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'



"
" GUI options
" ===========

" colorscheme molokai
" colorscheme vividchalk
colorscheme solarized
set ruler
set number
syntax enable
set laststatus=2 " always show the statusline

" netrw options
let g:netrw_liststyle=3 " tree style listing
let g:netrw_banner=0 " hide the banner
let g:netrw_preview=1 " preview in a vertical split window



if has("gui_running")
  " set cursorline
  " set cursorcolumn

  " no menubar etc
  set guioptions=

  " Highlight trailing whitespace.
  autocmd BufWinEnter * match Todo /\s\+$/
endif



"
" Buffer Options
" ==============

set hidden   " Buffers can be hidden and edited
set autoread " Automatically load changes to open files



"
" Formatting and indentation
" ==========================

" Use spaces instead of tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
filetype indent plugin on



"
" Searching
" =========

set hlsearch
set incsearch
set ignorecase
set smartcase



"
" Autocomplete
" ============

set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview



"
" Environment Variables
" =====================

set shell=/bin/sh " ensures that ~/.zshrc is sourced, which loads rvm



"
" Directories for swp files
" =========================

set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files

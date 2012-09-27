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
Bundle 'kchmck/vim-coffee-script'
Bundle 'jpalardy/vim-slime'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-markdown'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'vim-ruby/vim-ruby'

" Tim Pope's useful plugins
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-commentary'

" vim-snipmate and dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

" rubyblock and dependencies
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
runtime macros/matchit.vim

" colorschemes
Bundle 'tpope/vim-vividchalk'
Bundle 'tomasr/molokai'
Bundle 'Lokaltog/vim-powerline'



"
" GUI options
" ===========

"colorscheme molokai
colorscheme vividchalk
set ruler
set number
syntax enable
set laststatus=2 " always show the statusline

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
" Directories for swp files
" =========================

set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files

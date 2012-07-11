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
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-markdown'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

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

" colorschemes
Bundle 'tpope/vim-vividchalk'
Bundle 'tomasr/molokai'
Bundle 'Lokaltog/vim-powerline'



"
" GUI options
" ===========

"colorscheme molokai
colorscheme vividchalk
set guioptions=
set ruler
set number
set laststatus=2 " always show the statusline

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
" Directories for swp files
" =========================

set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files

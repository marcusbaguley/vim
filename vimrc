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

" Currently playing around with:

Bundle 'ervandew/screen'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'sjl/gundo.vim'
Bundle 'xaviershay/tslime.vim'
Bundle 'ecomba/vim-ruby-refactoring'
" Bundle 'vim-scripts/YankRing.vim'
" Bundle 'jpalardy/vim-slime'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Essential bundles:

Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/AutoTag'
Bundle 'kien/ctrlp.vim'

" Nice bundles:

Bundle 'godlygeek/tabular'

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
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'

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

set ruler
set number
syntax enable

if has('gui_running')
  " set cursorline
  " set cursorcolumn

  " no menubar etc
  set guioptions=

  " Highlight trailing whitespace.
  autocmd BufWinEnter * match Todo /\s\+$/
else
  " for colorscheme solarized
  let g:solarized_termcolors=256
endif

" colorscheme molokai
" colorscheme vividchalk
colorscheme solarized
set background=dark
highlight SignColumn guibg=background

set laststatus=2 " always show the statusline
let g:Powerline_symbols = 'unicode'



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
" Swap files
" =========================

set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files
set shortmess+=A



"
" DIFF SIGNS ON MARGIN
" ====================

let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']
let g:quickfixsigns_balloon=0



"
" VIMINFO: REMEMBER CERTAIN THINGS WHEN WE EXIT
" =============================================

" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"   %    : saves and restores the buffer list
"   '100 : marks will be remembered for up to 30 previously edited files
"   /100 : save 100 lines from search history
"   h    : disable hlsearch on start
"   "500 : save up to 500 lines for each register
"   :100 : up to 100 lines of command-line history will be remembered
"   n... : where to save the viminfo files
set viminfo=%100,'100,/100,h,\"500,:100,n~/.vim/viminfo
" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif |



"
" UNDO
" ====

set undolevels=10000
if has("persistent_undo")
  set undodir=~/.vim/undo       " Allow undoes to persist even after a file is closed
  set undofile
endif



"
" PASTE MODE TOGGLE
" =================

set pastetoggle=<F12>

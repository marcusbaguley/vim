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

" Bundle 'mattn/zencoding-vim'
Bundle 'sjl/gundo.vim'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-characterize'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'nelstrom/vim-qargs'
" requires matchit
runtime macros/matchit.vim
Bundle 'ecomba/vim-ruby-refactoring'
" Bundle 'nelstrom/vim-textobj-rubyblock'

" Essential bundles:
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
Bundle 'vim-scripts/AutoTag'
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'public/spree/products'

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
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'

" new syntax
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'duwanis/tomdoc.vim'
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'

" syntax checking
Bundle 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list=1

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

" colorschemes
Bundle 'tpope/vim-vividchalk'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rking/vim-detailed'

" UI changes
Bundle 'Lokaltog/vim-powerline'
Bundle 'tomtom/quickfixsigns_vim'



"
" GUI options
" ===========

set ruler
set number
syntax enable

if has('gui_running')
  " no menubar etc
  set guioptions=
else
  " for colorscheme solarized
  " let g:solarized_termcolors=256
endif

" colorscheme molokai
" colorscheme vividchalk
colorscheme detailed
" colorscheme solarized
" set background=dark
" highlight SignColumn guibg=background
" highlight SignColumn ctermbg=8

set laststatus=2 " always show the statusline
set showcmd " show current command in statusline
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
set smarttab
filetype indent plugin on
set autoindent



"
" Editing and text display
" ========================
set backspace=indent,eol,start
set showmatch
" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$
" Always show at least one line above/below the cursor
set scrolloff=1
set sidescrolloff=5
set display+=lastline
" Make whitespace prettier
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif
" Timeout options for commands
set ttimeout
set ttimeoutlen=50



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

" ensures that ~/.zshrc is sourced
set shell=/bin/sh



"
" Swap files
" =========================

set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files
set shortmess+=A
set backupskip=/tmp/*,/private/tmp/*



"
" Diff signs on margin
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
" Undo
" ====

set undolevels=10000
if has("persistent_undo")
  set undodir=~/.vim/undo " Allow undoes to persist even after a file is closed
  set undofile
endif

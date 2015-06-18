set nocompatible              " be iMproved, required
filetype off                  " required



"
" Vundle
" ======

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'



"
" Plugins for Vundle
" ==================

" Trying out stage
Plugin 'mattn/emmet-vim'
Plugin 'reedes/vim-wordy'
Plugin 'diepm/vim-rest-console'

" Populate the args list from the quickfix list
" Plugin 'nelstrom/vim-qargs'

" Useful macros for refactoring ruby
" runtime macros/matchit.vim
" Plugin 'ecomba/vim-ruby-refactoring'

" Fuzzy project wide file finder
Plugin 'thoughtbot/pick.vim'

" Update Ctags on save
" Plugin 'craigemery/vim-autotag' " Broken
" Plugin 'ludovicchabant/vim-gutentags' " Slow and runs everywhere

" Tim Pope's useful plugins
" Plugin 'tpope/vim-jdaddy'
" Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-projectionist'

" Ruby specific
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" Vim-snipmate and dependencies - VimL but buggy
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Plugin 'SirVer/ultisnips'

" Navigate between tmux and vim panes easily
Plugin 'christoomey/vim-tmux-navigator'

" NO CORE CHANGES TO VIM USAGE
" ============================
"
" New syntax
Plugin 'heartsentwined/vim-emblem'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'ap/vim-css-color'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'chase/vim-ansible-yaml'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-scripts/applescript.vim'

" Colorschemes
Plugin 'altercation/vim-colors-solarized'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"
" GUI options
" ===========

" set ruler
" set number
syntax enable

colorscheme solarized
set background=dark
" set background=light
" set laststatus=2 " always show the statusline



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
" Make whitespace visable
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif
" Timeout options for commands
set ttimeout
set ttimeoutlen=0
" Highlight 80th column to indicate code should not be at/past that point
" set textwidth=79 " default max width
" set colorcolumn=+1



"
" Searching
" =========

" set hlsearch
" set incsearch
set ignorecase
set smartcase
" ag is much faster than grep, and reads .gitignore
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m"
endif



"
" Autocomplete
" ============

" set complete=.,b,u,]
" set wildmode=longest,list:longest
" set completeopt=menu,preview



"
" Environment Variables
" =====================

set shell=/bin/sh
" ruby path if you are using rbenv
let g:ruby_path = system('echo $HOME/.rbenv/shims')



"
" Swap files
" =========================

set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files
set shortmess+=A
set backupskip=/tmp/*,/private/tmp/*



"
" Undo
" ====

set undolevels=10000
" if has("persistent_undo")
set undodir=~/.vim/undo " Allow undoes to persist even after a file is closed
set undofile
" endif

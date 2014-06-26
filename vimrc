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

Bundle 'AndrewRadev/splitjoin.vim'
" Fuzzy project wide file finder
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-jdaddy'

" Project file side pane.
Bundle 'scrooloose/nerdtree'
" Bundle 'tpope/vim-vinegar'

" Update Ctags on save
Bundle 'vim-scripts/AutoTag'

" Tim Pope's useful plugins
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'

" Vim-snipmate and dependencies - VimL but buggy
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

" python - but complete
" Bundle 'sirver/ultisnips'
" Bundle 'honza/vim-snippets'

" New syntax
Bundle 'heartsentwined/vim-emblem'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'ap/vim-css-color'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'chase/vim-ansible-yaml'

" Syntax checking on save
" Bundle 'scrooloose/syntastic'

" Navigate between tmux and vim panes easily
Bundle 'christoomey/vim-tmux-navigator'

" Populate the args list from the quickfix list
Bundle 'nelstrom/vim-qargs'

" Useful macros for refactoring ruby
runtime macros/matchit.vim
Bundle 'ecomba/vim-ruby-refactoring'

" Align on characters eg :Tab /,
Bundle 'godlygeek/tabular'

" Ruby specific
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'AndrewRadev/switch.vim'
Bundle 'thoughtbot/vim-rspec'

" Textobjects
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-indent'
Bundle 'lucapette/vim-textobj-underscore'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'

" " Diff signs on margin
" Bundle 'tomtom/quickfixsigns_vim'



"
" GUI options
" ===========

set ruler
set number
syntax enable

colorscheme solarized
set background=dark

" set laststatus=2 " always show the statusline
set showcmd " show current command in statusline



"
" Buffer Options
" ==============

set hidden   " Buffers can be hidden and edited
set autoread " Automatically load changes to open files
autocmd BufNewFile,BufRead *.markdown,*.md setlocal spell



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
" set nowrap
" map j gj
" map k gk
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
" Spelling on for mail
autocmd FileType mail set spell



"
" Searching
" =========

set hlsearch
set incsearch
set ignorecase
set smartcase
" ag is much faster than grep, and reads .gitignore
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif



"
" Autocomplete
" ============

set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview



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
if has("persistent_undo")
  set undodir=~/.vim/undo " Allow undoes to persist even after a file is closed
  set undofile
endif

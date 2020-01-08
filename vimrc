" vim:fdm=marker
" note zR - open all folds
set nocompatible
filetype plugin indent on

" GUI options {{{
" set number
syntax enable

" colorscheme solarized
set background=dark
" set background=light
" set laststatus=2 " always show the statusline

" Set some sensible diff colours.
" Seriously, the defaults are not easy to comprehend.
" Additions are are green
highlight DiffAdd ctermbg=2
" Deletions are red
highlight DiffDelete ctermbg=1
" Modifications are black
highlight DiffChange ctermbg=0
" }}}

" Buffer Options {{{
set hidden   " Buffers can be hidden and edited
set autoread " Automatically load changes to open files
" }}}

" Formatting and indentation {{{
" Use spaces instead of tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set ts=2 sw=2 expandtab
set smarttab
filetype indent plugin on
set autoindent
" }}}

" Editing and text display {{{
set backspace=indent,eol,start
" set showmatch
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
" default max width to 80 chars, but dont autowrap when typing.
" set textwidth=79 wrapmargin=0
" set colorcolumn=+1
" highlight ColorColumn ctermbg=Black
set formatoptions+=j " see :h fo-table
set cursorline

" }}}

" Searching {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" ag is much faster than grep, and reads .gitignore
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column\ $*
  set grepformat=%f:%l:%c:%m"
" If this is a git directory, use git's grep
elseif !empty(system("git rev-parse --show-toplevel"))
  set grepprg=git\ grep\ --line-number\ $*
endif
" }}}

" Autocomplete {{{
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
" }}}

" Swap files {{{
set backupdir=~/.vim/swp-files
set directory=~/.vim/swp-files
set shortmess+=A
set backupskip=/tmp/*,/private/tmp/*
" }}}

" TOhtml settings {{{
let g:html_number_lines = 1
" let g:html_dynamic_folds = 0
" let g:html_no_foldcolumn = 1
let g:html_prevent_copy = "n"
" }}}

" Undo {{{
set undolevels=10000
" if has("persistent_undo")
set undodir=~/.vim/undo " Allow undoes to persist even after a file is closed
set undofile
" endif
" }}}


" Omni completion is not usually enabled by default. To use omni completion,
" type <C-X><C-O> while open in Insert mode
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" searches for the word under your cursor and hits return
noremap <Leader>f :Ag <cword><cr>

" fzf
nnoremap <silent> <expr> <c-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles\<cr>"
nnoremap <silent> <expr> <Leader>] (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles?\<cr>"
nnoremap <silent> <expr> <Leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"

" Map Typescript references to leader G mainly to remove it from C-^
map <Leader>g <Plug>(TsuquyomiReferences)

map <leader>[ :NERDTreeToggle<CR>


" for vim-gitgutter change default of 4s to 250ms to keep file changes live
set updatetime=250

" set clipboard+=unnamed
" Include - as part of a word definition. For example, viw will select the
" entire word of 'this-is-hyphened'
set iskeyword+=-

" Remove spaces on save
autocmd BufWritePre * :%s/\s\+$//e

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

"  " JS prettifier
"
"  " w0rp/ale
"  " ========
"  " Dont lint while I type, seriously, I'm not done yet.
"  let g:ale_lint_on_text_changed = 'never'
"
"  " After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
"
"  " Set this setting in vimrc if you want to fix files automatically on save.
"  " This is off by default.
let g:ale_fix_on_save = 1
"
"  " Install via yarn global add prettier
"  "autocmd FileType javascript set formatprg=prettier\ --stdin
"  " Format on js save
"  "autocmd BufWritePre *.js :normal gggqG
"  " If you want to restore cursor position on save (can be buggy):
"  "
"  "autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

" We really don't want any tabs
set tabstop=2 shiftwidth=2 expandtab

" From the talk https://www.youtube.com/watch?v=XA2WjJbmmoM

" Recursivly add all files and folders to the path
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Netrw config
let g:netrw_banner=0 " disable annoying banner

" Format XML
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

" SNIPPETS:

" Read an empty HTML template and move cursor to title
" nnoremap <leader>html :-1read $HOME/.vim/.skeleton.html<CR>?<title>\zs<CR>i
" Fold XML
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

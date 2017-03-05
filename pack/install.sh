#!/bin/bash

# Create folder and ch into it
function set_group () {
  plugin_group=$1
  path="$HOME/.vim/pack/$plugin_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}

# takes a repo e.g.
#
#   plugin https://github.com/fatih/vim-go.git
#
function plugin () {
  repo=$1
  expected_repo=$(basename "$repo" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull)
    echo "$expected_repo: $result"
  else
    git clone -q "$repo"
    echo "$expected_repo: Installed."
  fi
}

(
set_group staging
plugin https://github.com/fatih/vim-go.git &
plugin https://github.com/tpope/vim-rhubarb.git &
plugin https://github.com/dhruvasagar/vim-table-mode.git &
wait
) &

(
set_group tpope
# plugin https://github.com/tpope/vim-dispatch.git &
# plugin https://github.com/tpope/vim-jdaddy.git &
plugin https://github.com/tpope/vim-fugitive.git &
plugin https://github.com/tpope/vim-surround.git &
plugin https://github.com/tpope/vim-ragtag.git &
plugin https://github.com/tpope/vim-abolish.git &
plugin https://github.com/tpope/vim-repeat.git &
plugin https://github.com/tpope/vim-commentary.git &
plugin https://github.com/tpope/vim-projectionist.git &
# plugin https://github.com/tpope/vim-vinegar.git &
wait
) &

(
set_group ruby
plugin https://github.com/tpope/vim-rails.git &
plugin https://github.com/tpope/vim-rake.git &
plugin https://github.com/tpope/vim-bundler.git &
plugin https://github.com/tpope/vim-endwise.git &
wait
) &

(
set_group snippets
# Vim-snipmate and dependencies - VimL but buggy
plugin https://github.com/MarcWeber/vim-addon-mw-utils.git &
plugin https://github.com/tomtom/tlib_vim.git &
plugin https://github.com/garbas/vim-snipmate.git &
# Ultisnips is python but more functional
# plugin https://github.com/SirVer/ultisnips.git &
wait
) &

(
set_group tmux
plugin https://github.com/christoomey/vim-tmux-navigator.git &
wait
) &

(
set_group syntax
plugin https://github.com/kchmck/vim-coffee-script.git &
plugin https://github.com/tpope/vim-markdown.git &
plugin https://github.com/ap/vim-css-color.git &
plugin https://github.com/pearofducks/ansible-vim.git &
plugin https://github.com/vim-scripts/applescript.vim.git &
plugin https://github.com/tmux-plugins/vim-tmux.git &
plugin https://github.com/Matt-Deacalion/vim-systemd-syntax.git &
wait
) &


# (
# set_group colorschemes
# plugin https://github.com/altercation/vim-colors-solarized.git &
# wait
# ) &

wait

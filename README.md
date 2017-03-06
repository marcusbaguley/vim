# camfowler's Vim for (predominantly) [Rails](http://rubyonrails.org/)

4 simple commands will get you vimming in no time!

```sh
# Clone this repo
git clone https://github.com/camfowler/vim.git ~/.vim

# Symlink the vimrc
ln -s ~/.vim/vimrc ~/.vimrc
```

Enjoy!

## Adding Plugins

```
# Go to the pack directory
cd ~/.vim/pack/

# Create a subfolder of your choosing (I use them to group related plugins,
# e.g. syntax highlighting
mkdir syntax
cd syntax

# Check out the plugin
git submodule add https://github.com/tpope/vim-markdown.git

# Commit the changes
git commit -m 'Add markdown syntax"
```

## Updating Plugins

```
git submodule update --remote --merge
```

## Removing Plugins

```
git submodule deinit ~/.vim/pack/syntax/start/vim-markdown
git rm ~/.vim/pack/syntax/start/vim-markdown
rm -rf ~/.vim/.git/modules/pack/syntax/start/vim-markdown
```


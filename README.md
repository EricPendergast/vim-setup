My personal vim/neovim setup.

Setup
=====

```
# Pull repo, move to ~/.vim
git pull ...
mv ... ~/.vim

# For neovim, link init.lua
ln -s ~/.vim ~/.config/nvim

nvim
# inside nvim
:PlugInstall
# quit, reopen
# whichever LSP's are needed, install
:MasonInstall ...
```

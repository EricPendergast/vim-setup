My personal vim/neovim setup.

Setup
=====

```
# Pull repo, move to ~/.vim
git pull ...
mv ... ~/.vim

# For neovim, link init.lua
ln -s ~/.vim/nvim/init.lua ~/.config/nvim/init.lua

nvim
# inside nvim
:PlugInstall
# quit, reopen
# whichever LSP's are needed, install
:MasonInstall ...
```

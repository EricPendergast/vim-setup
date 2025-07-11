My personal vim/neovim setup.

Setup
=====

```
# Pull repo, move to ~/.vim
git pull ...
mv ... ~/.vim

# Useful if on a non-personal machine
cd ~/.vim
git config user.name "Eric Pendergast"
git config user.email "18491983+EricPendergast@users.noreply.github.com"


# For neovim, link init.lua
mv ~/.config/nvim ~/.config/nvim.orig
ln -s ~/.vim ~/.config/nvim

nvim
# quit, reopen
# whichever LSP's are needed, install
:MasonInstall ...
```

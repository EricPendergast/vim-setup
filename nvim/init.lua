vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

-- Set packpath to runtime path
vim.opt.packpath = vim.opt.runtimepath:get()

-- Enable true color in terminal
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

-- Source the .vimrc file
vim.cmd("source ~/.vim/vimrc")

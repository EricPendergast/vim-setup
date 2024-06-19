vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

-- Set packpath to runtime path
vim.opt.packpath = vim.opt.runtimepath:get()

-- Enable true color in terminal
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

-- Source the .vimrc file
vim.cmd("source ~/.vim/vimrc")


require("nvim-tree").setup({
    hijack_netrw = false,
    hijack_directories = {
        enable = false
    },
    renderer = {
        icons = {
            show = {
                git = true,
                file = false,
                folder = false,
                folder_arrow = true,
            },
            glyphs = {
                folder = {
                    arrow_closed = "▸",
                    arrow_open = "▾",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "⌥",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "⊖",
                    ignored = "◌",
                },
            },
        },
    },
})

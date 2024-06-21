vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

-- Set packpath to runtime path
vim.opt.packpath = vim.opt.runtimepath:get()

-- Enable true color in terminal
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

-- Source the .vimrc file
vim.cmd("source ~/.vim/vimrc")

-- NOTE: Mason should be set up before nvim-lspconfig
require("mason").setup()
require("mason-lspconfig").setup()

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


local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end


local cmp = require'cmp'
cmp.setup({
    --snippet = {
    --    -- REQUIRED - you must specify a snippet engine
    --    expand = function(args)
    --        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    --    end,
    --},
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        ['<Tab>'] = function(fallback)
            if not cmp.select_next_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if not cmp.select_prev_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        --{ name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true
                }
            },
            telemetry = {
                enable = false,
            },
        },
    },
    capabilities = capabilities
}
require('lspconfig').omnisharp.setup {
    capabilities = capabilities,
}
require('lspconfig').gdscript.setup {
    capabilities = capabilities
}

vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

-- Set packpath to runtime path
vim.opt.packpath = vim.opt.runtimepath:get()

-- Enable true color in terminal
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

require("config.lazy")

-- Source the .vimrc file
vim.cmd("source ~/.vim/common.vim")

vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>w', function()
  if vim.bo.modifiable then
    vim.cmd('NvimTreeFindFile')
    vim.cmd('wincmd p')
  end
end, { noremap = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<C-P>', builtin.find_files, { desc = 'Telescope find files' })

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
        }),
        ['<C-Space>'] = function(fallback)
            if not cmp.select_next_item() then
                if vim.bo.buftype ~= 'prompt' then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,
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
        ['<C-e>'] = cmp.mapping.scroll_docs(-4),
        ['<C-y>'] = cmp.mapping.scroll_docs(4),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        --{ name = 'buffer' },
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

local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- show documentation
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- go to definition
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- find references
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts) -- rename symbol
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- code action
    vim.keymap.set('n', '<leader>h', ':ClangdSwitchSourceHeader<CR>', bufopts) -- switch between header and source files
end
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)


-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- :MasonInstall omnisharp
-- On Mac, may require a .dylib:
--  brew install --cask dotnet-sdk
--  export DOTNET_ROOT="/usr/local/share/dotnet"
--require('lspconfig').omnisharp.setup {
--    capabilities = capabilities,
--    on_attach = on_attach_omnisharp,
--    cmd = {
--        -- For some reason, things break unless cmd is specified manually
--        "OmniSharp",
--        "--languageserver",
--        "--hostPID",
--        tostring(vim.fn.getpid()),
--        "--DotNet:enablePackageRestore=false",
--        "--FormattingOptions:EnableEditorConfigSupport=true",
--        "--Sdk:IncludePrereleases=true",
--        "--encoding",
--        "utf-8"
--    },
--    settings = {
--        FormattingOptions = {
--            EnableEditorConfigSupport = true,
--            OrganizeImports = false,
--            InsertSpaces = true,
--            TabSize = 4,
--        },
--    },
--    enable_roslyn_analyzers = true,
--    enable_import_completion = true,
--    organize_imports_on_format = true,
--}
-- Put at ~/.omnisharp/omnisharp.json
-- {
--  "RoslynExtensionsOptions": {
--    "enableDecompilationSupport": true
--  }
--}

-- :MasonInstall csharp-language-server 
require('lspconfig').csharp_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("csharpls_extended").buf_read_cmd_bind()

require('lspconfig').gdscript.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require('lspconfig').clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
-- :MasonInstall python-lsp-server
require('lspconfig').pylsp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                jedi = {
                    extra_paths = {
                    }
                },
                pycodestyle = {
                }
            }
        }
    }
}
-- :MasonInstall gopls
require('lspconfig').gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
-- :MasonInstall json-lsp
require'lspconfig'.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}


function gdshader()
   vim.lsp.start {
       name = "gdshader-lsp",
       cmd = {
           --"<path to gdshader-lsp binary>",
           "gdshader-lsp"
       },
       capabilities = vim.lsp.protocol.make_client_capabilities()
   }
 end

--vim.lsp.set_log_level("debug")


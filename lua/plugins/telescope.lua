local lga_actions = require("telescope-live-grep-args.actions")

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            file_ignore_patterns = {
                ".git/",
            },
            mappings = {
                i = {
                    ["<C-j>"] = require('telescope.actions').move_selection_next,
                    ["<C-k>"] = require('telescope.actions').move_selection_previous,
                },
                n = {
                    ["<C-j>"] = require('telescope.actions').move_selection_next,
                    ["<C-k>"] = require('telescope.actions').move_selection_previous,
                },
            },
        },
        pickers = {
            find_files = {
                hidden = true
            },
            live_grep = {
                file_ignore_patterns = { 'node_modules', '.git/', '.venv' },
                additional_args = function(_)
                    return { "--hidden" }
                end,
            },
        },
        extensions = {
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                -- define mappings, e.g.
                mappings = { -- extend mappings
                    i = {
                        ["<C-g>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        ["<C-f>"] = lga_actions.to_fuzzy_refine,
                    },
                },
            }
        }
    },
}

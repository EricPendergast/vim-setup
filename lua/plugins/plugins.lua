return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  "nvim-tree/nvim-tree.lua",
  "tpope/vim-vinegar",
  "mileszs/ack.vim",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "scrooloose/nerdcommenter",
  "tpope/vim-fugitive",
  "tpope/vim-unimpaired",
  "AndrewRadev/undoquit.vim",
  "NLKNguyen/papercolor-theme",
  "tommcdo/vim-exchange",
  -- Is this used?
  "Chiel92/vim-autoformat",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/nvim-cmp",
  "Decodetalkers/csharpls-extended-lsp.nvim",
  "ojroques/vim-oscyank",
  "tpope/vim-rhubarb",
  "shumphrey/fugitive-gitlab.vim",
}

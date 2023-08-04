-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim",
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
  },
  "folke/neodev.nvim",

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- LSP Linter DAP Formatter installer
  {
    "williamboman/mason.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = "williamboman/mason.nvim",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "mhartington/formatter.nvim",
  },
  -- Notification system
  "rcarriga/nvim-notify",

  -- Coloscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Completion

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Completion for lsp
      "hrsh7th/cmp-buffer",   -- Completion for elements inside the buffer
      "hrsh7th/cmp-path",     -- Completion for paths
      "hrsh7th/cmp-cmdline",  --Completion for command line
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
      },
      "saadparwaiz1/cmp_luasnip", -- Links the snippets to completion
    },
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        cmd = "TSUpdate",
      },
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
  },
  -- Floating commands
  {
    "MunifTanjim/nui.nvim",
    dependencies = "VonHeikemen/fine-cmdline.nvim",
  },

  -- bufferline and statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  --Copilot
  {
    "zbirenbaum/copilot.lua",
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "zbirenbaum/copilot.lua",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- Start menu
  {
    "goolord/alpha-nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  { "lewis6991/gitsigns.nvim" },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
  },
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }

})

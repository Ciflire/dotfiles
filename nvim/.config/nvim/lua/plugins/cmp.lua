return {
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
}

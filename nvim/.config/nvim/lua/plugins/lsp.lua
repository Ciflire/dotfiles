return {
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
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require("null-ls").setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
},
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSUpdate"
  },
}

return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  "HiPhish/rainbow-delimiters.nvim",
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
}


local fn = vim.fn



-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins    
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Colorscheme plugin : nice and clean colorscheme
    use "folke/tokyonight.nvim"
    use "LunarVim/Colorschemes"
    use "LunarVim/onedarker.nvim"
    use "LunarVim/darkplus.nvim"

    -- Install copilot
    use {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({})
      end,
    }
    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function ()
        require("copilot_cmp").setup()
      end
    }
    -- Autocomplete
    use "hrsh7th/nvim-cmp" -- Autocompletion plugin
    use "hrsh7th/cmp-buffer" -- Autocompletion for buffer words
    use "hrsh7th/cmp-path" -- Autocompletion for file paths
    use "hrsh7th/cmp-cmdline" -- Autocompletion for command line
    use "saadparwaiz1/cmp_luasnip" -- Autocompletion for snippets
    use "hrsh7th/cmp-nvim-lsp" -- Gives the LSP completion

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Snippets plugin
    use "rafamadriz/friendly-snippets" -- Snippets collection

    -- LSP servers : did you make a mistake in your code?
    use "neovim/nvim-lspconfig" -- Basic LSP config 
    use "williamboman/nvim-lsp-installer" -- LSP installer plugin
    use "jose-elias-alvarez/null-ls.nvim"

    -- Telescope and dependancies: basically a file finder 
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Treesitter: mkaes the syntax highlighting
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Autopairs
    use "windwp/nvim-autopairs"

    -- Commenting
    use "numToStr/Comment.nvim"

    -- gitplugin
    use "lewis6991/gitsigns.nvim"

    -- nvim tree
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    -- buffer
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"

    -- Terminal
    use "akinsho/toggleterm.nvim"

    -- Status bar
    use {
      'nvim-lualine/lualine.nvim',
      'nvim-tree/nvim-web-devicons',
    }

    -- mardown preview
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    -- Launching window
    use {
      'goolord/alpha-nvim',
      config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
    }
    -- Latex plugin
    use 'lervag/vimtex'
    -- Typst plugin
    use {'kaarmu/typst.vim', ft = {'typst'}}

    -- pdf viewer
    use {
      'marioortizmanero/adoc-pdf-live.nvim',
      config = "require('adoc_pdf_live').setup()"
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

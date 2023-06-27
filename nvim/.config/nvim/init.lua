-- General configuration
require("user.config.options")
require("user.config.keymaps")
require("user.config.plugins")
-- Plugins configuration
require("user.plugin.adoc_pdf_live")
require("user.plugin.autopairs")
require("user.plugin.bufferline")
require("user.plugin.cmp")
require("user.plugin.colorscheme")
require("user.plugin.copilot")
require("user.plugin.comment")
require("user.plugin.gitsigns")
require("user.plugin.lualine")
require("user.plugin.nvimtree")
require("user.plugin.telescope")
require("user.plugin.toggleterm")
require("user.plugin.treesitter")
require("user.plugin.webdevicons")
-- LSP configuration
require("user.lsp")

vim.wo.relativenumber = true

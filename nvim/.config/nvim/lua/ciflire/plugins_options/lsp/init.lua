local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "ciflire.plugins_options.lsp.mason"
require "ciflire.plugins_options.lsp.nvim-lspconfig"
require "ciflire.plugins_options.lsp.formatter"

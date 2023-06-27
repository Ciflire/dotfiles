local status_ok , configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup{
  ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "bash", "html", "java", "typescript", "git_config", "git_rebase", "go", "javascript", "latex", "markdown", "markdown_inline", "ocaml", "ocaml_interface", "ocamllex", "sql", "svelte"},
  sync_install = false,
  ignore_install = {""},


  -- highlighting
  highlight = {
    enable = true,
    disable = {""},
    additional_vim_regex_highlighting = true,
  },
  indent = {enable = true, disable = { "yaml"} },

  -- Rainbow parentheses
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  -- playground allows to test treesitter parsers
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  --Autopairs
  autopairs = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}


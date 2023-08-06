-- BUFFERLINE CONFIG vim.opt.termguicolors = true
require("bufferline").setup{
	options = {
		separator_style = "slant",
		offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer", -- | function ,
                    text_align = "left", -- | "center" | "right"
                    separator = true,
                }
            },
	}
}


-- LUALINE CONFIG
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ')', right = '('},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
      "NvimTree",
      "neo-tree",
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- NVIM-TREE CONFIG


-- setup with some options

-- NOTIFY CONFIG

vim.notify = require("notify")

-- TOGGLETERM CONFIG


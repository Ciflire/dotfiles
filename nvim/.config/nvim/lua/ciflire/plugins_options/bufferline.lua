vim.opt.termguicolors = true
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

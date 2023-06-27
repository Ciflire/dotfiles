local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Opens the explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Closes a buffer
keymap("n", "<leader>c", "<cmd> bdelete <cr>", opts)

-- Saves a buffer
keymap("n", "<leader>w", ":w<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --

-- Telescope
keymap("n", "<leader>ff", "<cmd> lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ previewer = true }))<cr>", opts)
-- keymap("n", "<leader>ff", "<cmd> Telescope find_files theme=ivy <cr>", opts)
keymap("n", "<leader>fg", "<cmd> Telescope live_grep thme=ivy <cr>",opts)
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-w>h", term_opts)
keymap("t", "<C-j>", "<C-w>j", term_opts)
keymap("t", "<C-k>", "<C-w>k", term_opts)
keymap("t", "<C-l>", "<C-w>l", term_opts)

-- Specific terminal
keymap("n", "<leader>tt", "<C-t>", opts)
keymap("n", "<leader>tg", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>th", ":lua _BTOP_TOGGLE()<CR>", opts)
keymap("n", "<leader>tp", ":lua _PYTHON_TOGGLE()<CR>", opts)

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

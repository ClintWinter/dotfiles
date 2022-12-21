local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local k = vim.keymap.set

k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

-- Keep cursor centered vertically
k('n', 'j', 'jzz', opts)
k('n', 'k', 'kzz', opts)
k('n', 'h', 'hzz', opts)
k('n', 'l', 'lzz', opts)
k('n', 'G', 'Gzz', opts)
k('n', '{', '{zz', opts)
k('n', '}', '}zz', opts)
k('n', '<C-d>', '<C-d>zz', opts)
k('n', '<C-u>', '<C-u>zz', opts)

k("n", "<leader>e", function() vim.cmd("30Lex") end, opts)

-- Yank to end of line
k("n", "Y", "y$", opts)

-- Resize with arrows
k("n", "<C-Up>", ":resize +2<CR>", opts)
k("n", "<C-Down>", ":resize -2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
k("n", "<S-l>", ":bnext<cr>", opts)
k("n", "<S-h>", ":bprevious<cr>", opts)

-- Visual --
-- Stay in indent mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- Move text up and down
k("v", "<C-j>", ":m '>+1<CR>gv=gv")
k("v", "<C-k>", ":m '>-2<CR>gv=gv")
-- dont replace clipboard when pasting over something
k("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
k("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
k("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
k("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
k("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

require('user.keymaps.telescope')

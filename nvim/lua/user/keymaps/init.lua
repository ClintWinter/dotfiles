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

k('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
k('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

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

-- Yank to end of line
k("n", "Y", "y$", opts)

-- no jank yank (maintain cursor position)
k('v', 'y', 'myy`y', opts)

-- disable command line typo
k('n', 'q:', ':q', opts)

-- replace visual selection without copying
k('v', 'p', '"_dP', opts)

-- Resize with arrows
k("n", "<C-Up>", ":resize +2<CR>", opts)
k("n", "<C-Down>", ":resize -2<CR>", opts)
k("n", "<C-Left>", ":vertical resize -2<CR>", opts)
k("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
k("n", "<S-l>", ":bnext<cr>", opts)
k("n", "<S-h>", ":bprevious<cr>", opts)

-- Control buffers
k("n", "<leader>bde", ":%bd|e#|bd#<cr>", opts) -- delete all buffers except current (including the empty auto-created after deleting all)
k("n", "<leader>bda", ":%bd<cr>", opts) -- delete all buffers

-- Visual --
-- Stay in indent mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- Terminal --
-- Better terminal navigation
k("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
k("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
k("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
k("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- text-case --
k("n", "gat", function() require('textcase').current_word('to_title_case') end, opts)
k("n", "gaT", function() require('textcase').lsp_rename('to_title_case') end, opts)
k("n", "gaot", function() require('textcase').operator('to_title_case') end, opts)

-- git --
-- new branch
k("n", '<leader>gn', function ()
  vim.ui.input({prompt = "New branch name: "}, function (input)
    vim.cmd(':Git switch -c ' .. input)
  end)
end, opts)

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   callback = function(args)
--     local buffers = vim.api.nvim_list_bufs()
--     for key, buf in ipairs(buffers) do
--       if vim.api.nvim_buf_is_loaded(buf) then
--         print(buf)
--       end
--     end
--   end,
-- })

require('user.keymaps.telescope')
require('user.keymaps.user-commands')

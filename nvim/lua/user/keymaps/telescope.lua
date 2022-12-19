local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
  print('Could not load telescope builtin for keymaps.')
  return
end

local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }
-- local k = vim.api.nvim_set_keymap
local k = vim.keymap.set

k('n', '<leader>ff', builtin.find_files, opts)
k('n', '<leader>fg', builtin.live_grep, opts)
k('n', '<leader>fb', builtin.buffers, opts)
k('n', '<leader>fh', builtin.help_tags, opts)

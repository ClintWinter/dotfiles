local ok, tree = pcall(require, 'nvim-tree')

if not ok then
  print 'Could not load nvim-tree'
  return
end

tree.setup({
  git = {
    ignore = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})

local k = vim.keymap.set

k('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { silent = true });

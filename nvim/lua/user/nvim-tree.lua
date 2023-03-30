local ok, tree = pcall(require, 'nvim-tree')

if not ok then
  print 'Could not load nvim-tree'
  return
end

tree.setup({
  git = {
    ignore = false,
  },
  view = {
    side = 'right',
    width = 50,
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    icons = {
      git_placement = 'after',
      modified_placement = 'before',
      show = {
        file = true,
        folder = false,
        folder_arrow = true,
      },
      glyphs = {
        git = {
          unstaged = '◑',
          staged = '✓',
          unmerged = "",
          renamed = '⬎',
          untracked = '☆',
          deleted = '⨂',
          ignored = '○',
        },
      }
    },
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
})

local k = vim.keymap.set

k('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { silent = true });

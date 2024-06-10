local preferredDark = 'nightfox' -- 'rose-pine-moon' -- 'nordfox'
local preferredLight = 'dawnfox' -- 'rose-pine-dawn' -- 'dawnfox'

local opts = { noremap = true, silent = true }

local colorscheme = 'rose-pine-dawn'

vim.keymap.set('n', '<leader>cd', function()
  pcall(vim.cmd, 'set background=dark')
  pcall(vim.cmd, 'colorscheme ' .. preferredDark)
end, opts)

vim.keymap.set('n', '<leader>cl', function()
  pcall(vim.cmd, 'set background=light')
  pcall(vim.cmd, 'colorscheme ' .. preferredLight)
end, opts)

require('nightfox').setup({
  options = {
    styles = {
      comments = 'italic',
      keywords = 'bold',
      types = 'bold',
    },
  },
})

require('rose-pine').setup({
  variant = 'auto',
  dark_variant = 'moon',

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
});

vim.cmd('colorscheme ' .. colorscheme)

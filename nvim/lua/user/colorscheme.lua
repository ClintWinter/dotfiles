-- options: nightfox, nordfox, duskfox, terafox, carbonfox, dawnfox, dayfox

-- local appearance = vim.fn.system { 'swift', '/Users/givebutter/Code/clintwinter/dotfiles/scripts/appearance.swift' }

-- local colorscheme = appearance == "Light\n" and "dawnfox" or "duskfox"
-- local colorscheme = 'nordfox'

local preferredDark = 'tokyonight-moon' -- 'rose-pine-moon' -- 'nordfox'
local preferredLight = 'tokyonight-day' -- 'rose-pine-dawn' -- 'dawnfox'

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>cd', function()
  pcall(vim.cmd, 'set background=dark')
  pcall(vim.cmd, 'colorscheme ' .. preferredDark)
end, opts)

vim.keymap.set('n', '<leader>cl', function()
  pcall(vim.cmd, 'set background=light')
  pcall(vim.cmd, 'colorscheme ' .. preferredLight)
end, opts)

-- local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

-- if not status_ok then
--   vim.notify('colorscheme ' .. colorscheme .. ' not found!')
--   return
-- end

require('nightfox').setup({
  options = {
    styles = {
      comments = 'italic',
      keywords = 'bold',
      types = 'bold',
    },
  },
})

-- require('rose-pine').setup({
--   variant = 'auto',
--   dark_variant = 'moon',

--     enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--     },

--     styles = {
--         bold = true,
--         italic = false,
--         transparency = false,
--     },
-- });

vim.cmd('colorscheme tokyonight-moon')

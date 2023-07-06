-- options: nightfox, nordfox, duskfox, terafox, carbonfox, dawnfox, dayfox

local appearance = vim.fn.system { 'swift', '/Users/clint/Code/clintwinter/dotfiles/scripts/appearance.swift' }

local colorscheme = appearance == "Light\n" and "dayfox" or "nightfox"
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

require('nightfox').setup({
  options = {
    styles = {
      comments = 'italic',
      keywords = 'bold,italic',
      types = 'bold',
    },
  },
})

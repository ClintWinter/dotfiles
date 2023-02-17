local colorscheme = 'nordfox'

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

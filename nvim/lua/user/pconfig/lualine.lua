local ok, lualine = pcall(require, 'lualine')

if not ok then
  print('Could not load lualine.')
  return
end

lualine.setup({
  options = {
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'encoding', 'fileformat', 'filetype' },
  },
})

local ok, lualine = pcall(require, 'lualine')

if not ok then
  print('Could not load lualine.')
  return
end

lualine.setup({
  options = {
    section_separators = '',
    component_separators = '',
    -- theme = 'dawnfox',
  },
  sections = {
    lualine_b = { 'branch' },
    lualine_c = {},
    lualine_x = { 'filename' },
    lualine_y = { 'progress' },
    lualine_z = { 'filetype' },
  },
})

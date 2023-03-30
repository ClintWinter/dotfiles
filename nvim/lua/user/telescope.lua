local ok, telescope = pcall(require, 'telescope')

if not ok then
  print('Could not require telescope plugin')
  return
end

telescope.load_extension('fzy_native')

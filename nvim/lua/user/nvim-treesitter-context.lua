local ok, context = pcall(require, 'treesitter-context')
if not ok then
  return
end

context.setup({
  enable = true,
  max_lines = 2,
  -- multiline_threshold = 2,
})

-- FROM ORIGINAL COPILOT PLUGIN (WHICH SUCKS)
-- vim.g.copilot_filetypes = { xml = false, md = false }
-- vim.api.nvim_buf_set_keymap('i', '<C-k>', 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""

print 'copilot setup'

local copilot_ok, copilot = pcall(require, 'copilot')
if not copilot_ok then
  return
end


copilot.setup({
  cmp = {
    enabled = true,
    method = 'getCompletionsCycling',
  },
  suggestion = { enabled = false },
  panel = { enabled = true },
  filetypes = {
    xml = false,
    md = false,
  },
  -- server_opts_overrides = {
  --   settings = {
  --     advanced = {
  --       inlineSuggestCount = 3, -- #completions for getCompletions
  --     },
  --   },
  -- },
})

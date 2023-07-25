local ok, telescope = pcall(require, 'telescope')
if not ok then
  print('Could not load telescope builtin for keymaps.')
  return
end

local telescopeConfig = require('telescope.config')
local telescopeBuiltin = require('telescope.builtin')
local previewers = require("telescope.previewers")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.load_extension('fzy_native')

telescope.setup({
  defaults = {
    -- `hidden = true` is not supported in text grep commands.
    vimgrep_arguments = vimgrep_arguments,
    buffer_previer_maker = function(filepath, bufnr, opts)
      opts.use_ft_detect = false
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end,
    layout_strategy = "center",
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>ff', telescopeBuiltin.find_files, opts)
vim.keymap.set('n', '<leader>wf', function() telescopeBuiltin.find_files({ no_ignore = true, prompt_title = "All Files" }) end, opts)
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', telescopeBuiltin.buffers, opts)
vim.keymap.set('n', '<leader>fh', telescopeBuiltin.help_tags, opts)
vim.keymap.set('n', '<leader>fs', telescopeBuiltin.lsp_document_symbols, opts)
vim.keymap.set('n', '<leader>ws', telescopeBuiltin.lsp_dynamic_workspace_symbols, opts)

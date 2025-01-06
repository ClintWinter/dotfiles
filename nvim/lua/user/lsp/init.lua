local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  print('unable to load lsp-zero')
  return
end

local config_status_ok, lspconfig = pcall(require, "lspconfig")
if not config_status_ok then
  return
end

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

local nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not nvim_lsp_status_ok then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.preset('lsp-only')

-- lsp.configure('phpactor', {
--   capabilities = capabilities,
--   cmd = { "phpactor", "language-server" },
-- })

-- lspconfig.phpactor.setup({
--   init_options = {
--     language_server_phpstan = {
--       enabled = true,
--     },
--     language_server_php_cs_fixer = {
--       enabled = true,
--     }
--   }
-- })

lsp.configure('ts_ls', {
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
  cmd = { "typescript-language-server", "--stdio" },
})

lsp.configure('eslint', {
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

lsp.set_preferences({
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
  }
})

local filter_out_useless_items = function (items)
  local newItems = {}

  for _, item in ipairs(items) do
    if string.find(item.filename, 'ide_helper') == nil
      and string.find(item.text, '__construct') == nil
    then
      table.insert(newItems, item)
    end
  end

  return newItems
end

local on_list = function (args)
  local items = args.items

  if #items > 1 then
    items = filter(items, filter_out_useless_items)
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command('cfirst')
end

vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_next)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)

lsp.on_attach(function(client, bufnr)
  -- These will be buffer-local keybindings because
  -- they only work if you have an active LSP.

  lsp.default_keymaps({
    buffer = bufnr,
    remap = false,
    exclude = {'<F3>'},
  })

--   vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts);
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition({
--     reuse_win = true,
--     on_list = on_list,
--   }), opts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--   vim.keymap.set('n', '<leader>vws', vim.lsp.buf.hover, opts)
--   vim.keymap.set('n', '<leader>vd', vim.lsp.buf.hover, opts)
--   vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--   vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
--   vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
--   vim.keymap.set('i', '<c-h>', vim.lsp.buf.signature_help, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed ={
    -- 'phpactor',
    'intelephense',
    'lua_ls',
    'ts_ls',
    'eslint',
    'astro',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    lua_ls = function()
      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
    end,

    intelephense = function()
      lspconfig.intelephense.setup({
        settings = {
          intelephense = {
            licenceKey = os.getenv('HOME') .. '/intelephense/licence.txt',
          },
        }
      })
    end,
  },
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

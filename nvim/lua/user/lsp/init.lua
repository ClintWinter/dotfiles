local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  print('unable to load lsp-zero')
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

lsp.ensure_installed({
  'intelephense',
  'lua_ls',
  'tsserver',
  'eslint',
})

lsp.configure('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.configure('tsserver', {
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
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

  -- return vim.iter(items):filter(function (item)
  --   return string.find(item.filename, 'laravel_ide') > 0
  --     or string.find(item.text, '__construct') > 0
  -- end):totable()
end

local on_list = function (args)
  -- print('on list')
  -- args.items = filter_out_useless_items(args.items)
  local items = args.items

  if #items > 1 then
    items = filter(items, filter_out_useless_items)
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command('cfirst')

  return

  -- print(vim.inspect(args.items));

  -- vim.fn.setqflist({}, ' ', args)
  -- vim.api.nvim_command('cfirst')
end

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- if client.name == 'eslint' then
  --     vim.cmd.LspStop('eslint')
  --     return
  -- end

  -- vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts);
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition({
    reuse_win = true,
    on_list = on_list,
  }), opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>vws', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>vd', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
  vim.keymap.set('i', '<c-h>', vim.lsp.buf.signature_help, opts)

  -- format on save
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = vim.api.nvim_create_augroup("Format", { clear = true }),
  --     buffer = bufnr,
  --     callback = function() vim.lsp.buf.formatting_seq_sync() end
  --   })
  -- end
end)

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

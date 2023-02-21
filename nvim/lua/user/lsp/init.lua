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

lsp.preset('recommended')

lsp.ensure_installed({
  'intelephense',
  'lua_ls',
  'volar',
})

lsp.nvim_workspace()

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

lsp.configure('volar', {
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

require('luasnip/loaders/from_vscode').lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = cmp.mapping.preset.insert({
  ['<C-j>'] = cmp.mapping.select_next_item(),
  ['<C-k>'] = cmp.mapping.select_prev_item(),
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = nil, -- don't want to collide with tmux
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = nil,
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.confirm()
    elseif luasnip.expandable() then
      luasnip.expand()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif check_backspace() then
      fallback()
    else
      fallback()
    end
  end, {
    'i',
    's',
  }),
  -- ['<S-Tab>'] = cmp.mapping(function(fallback)
  --   if cmp.visible() then
  --     cmp.confirm()
  --   elseif luasnip.jumpable(-1) then
  --     luasnip.jump(-1)
  --   else
  --     fallback()
  --   end
  -- end, {
  --   'i',
  --   's',
  -- })
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I',
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    if client.name == 'eslint' then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vd', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<c-h>', vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

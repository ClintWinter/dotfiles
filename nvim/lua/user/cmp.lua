local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

require('luasnip/loaders/from_vscode').lazy_load()

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
  Copilot = "🤖",
}

local formatting = {
  fields = { 'kind', 'abbr', 'menu' },
  format = function(entry, vim_item)
    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

    vim_item.menu = ({
      copilot = "[Copilot]",
      nvim_lsp = "[LSP]",
      cmp = "[LSP]",
      luasnip = "[Snippet]",
      buffer = "[Buffer]",
      path = "[Path]",
    })[entry.source.name]

    return vim_item
  end,
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-Space>'] = cmp.mapping.confirm { select = true },
    ['<C-e>'] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = nil,
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() and has_words_before() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          })
        end
      else
        fallback()
      end
      -- if cmp.visible() and has_words_before() then
      --   cmp.confirm()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      -- else
      --   fallback()
      -- end
    end, {
      'i',
      's',
      'c',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    })
  }),

  formatting = formatting,

  sources = {
    {
      name = 'copilot',
      max_item_count = 3,
      -- trigger_characters = {
      --   ' ',
      --   '.',
      --   ':',
      --   '>',
      --   '{',
      --   '(',
      --   '[',
      --   '/',
      --   "'",
      --   '"',
      --   '=',
      --   '-',
      --   '\\',
      --   '\n',
      --   '\t',
      -- },
    },
    { name = 'nvim_lsp' },
    { name = 'cmp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
})

cmp.setup.filetype('markdown', {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'cmp' },
    { name = 'path' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
    ['<C-j>'] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
      --   cmp.select_next_item()
      -- else
      --   fallback()
      -- end
    end, {'i', 's'}),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {'i', 's'}),
  }),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

local opts = { noremap = true, silent = true }
local k = vim.keymap.set

-- open Git fugitive panel
k('n', '<leader>gs', vim.cmd.Git);

-- new branch
k('n', '<leader>gn', function ()
  vim.ui.input({prompt = 'New branch name: '}, function (input)
    if input == nil then
      vim.print('Action canceled.')
      return
    end

    vim.cmd(':Git switch -c ' .. input)
  end)
end, opts)

-- switch branch
k('n', '<leader>gc', ':Git checkout ', opts)

-- checkout last branch
k('n', '<leader>g-', function () vim.cmd(':Git checkout -') end, opts)

k('n', '<leader>g.', function () vim.cmd(':Git checkout main') end, opts)
k('n', '<leader>g>', function () vim.cmd(':Git checkout master') end, opts)
k('n', '<leader>gp', function () vim.cmd(':Git pull') end, opts)
k('n', '<leader>gP', function () vim.cmd(':Git push') end, opts)
k('n', '<leader>gb', function () vim.cmd(':Git blame') end, opts)

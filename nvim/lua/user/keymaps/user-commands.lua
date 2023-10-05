vim.api.nvim_create_user_command(
  'JKNah',
  function()
    vim.cmd 'Git clean -df'
    vim.cmd 'Git checkout -- .'
  end,
  {
    desc = 'Git "nah" discards and resets to the last commit.',
  }
)

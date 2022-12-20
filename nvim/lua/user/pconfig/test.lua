vim.keymap.set('n', '<leader>tt', vim.cmd.TestNearest)
vim.keymap.set('n', '<leader>tf', vim.cmd.TestFile)
vim.keymap.set('n', '<leader>ta', vim.cmd.TestSuite)
vim.keymap.set('n', '<leader>tl', vim.cmd.TestLast)
vim.keymap.set('n', '<leader>tg', vim.cmd.TestVisit)



vim.cmd('let test#php#phpunit#executable = \'docker exec givebutter-php-fpm php artisan test\'')
vim.cmd('let test#php#phpunit#options = \'--verbose\'')

local strategy = 'basic'
vim.cmd(string.format('let test#strategy = \'%s\'', strategy))
vim.cmd(string.format('let g:test#%s#start_normal = 1', strategy))

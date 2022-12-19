-- :help options
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.softtabstop = 4                         -- insert 2 spaces for a tab

vim.opt.smartindent = true                      -- make indenting smarter again

vim.opt.wrap = false                            -- display lines as one long line

vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines

vim.opt.wildmode = 'longest:full,full'

vim.opt.title = true
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim

vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)

vim.opt.spell = true

vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- smart case

vim.opt.list = true
vim.opt.listchars = { tab = ' ', trail = '' }
vim.opt.fillchars:append({ eob = ' ' })         -- remove the ~ from the end of buffer

vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window

vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8

vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard

vim.opt.confirm = true                          -- changes error on save to confirm

vim.opt.undofile = true                         -- enable persistent undo

vim.opt.backup = false                          -- creates a backup file
vim.opt.backupdir:remove('.')                   -- don't use current dir for backups

vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.numberwidth = 3                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.shortmess:append "c"

vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

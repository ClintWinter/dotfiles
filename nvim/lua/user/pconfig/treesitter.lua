local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print('Could not load treesitter')
    return
end

configs.setup {
    ensure_installed = 'all',
    -- sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    context_commentstring = {
        enable = true,
    },
    indent = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['if'] = '@function.inner',
                ['af'] = '@function.outer',
                ['ia'] = '@parameter.inner',
                ['aa'] = '@parameter.outer',
            },
        },
    }
}

vim.filetype.add({
    extension = {
        astro = 'astro'
    }
})

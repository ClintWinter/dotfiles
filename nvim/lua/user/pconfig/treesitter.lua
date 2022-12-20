local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print('Could not load treesitter')
    return
end

configs.setup {
    ensure_installed = { "help", "javascript", "typescript", "lua", "php" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
}

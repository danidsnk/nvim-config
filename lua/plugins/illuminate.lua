return {
    'RRethy/vim-illuminate',
    event = 'InsertEnter',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
        providers = {
            'lsp',
            'treesitter',
            'regex',
        },
        -- delay: delay in milliseconds
        delay = 100,
        min_count_to_highlight = 2,
    },
    config = function(_, opts)
        vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#474747', underline = false })
        vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'IlluminatedWordText' })
        vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = '#083D5A', underline = false })
        require('illuminate').configure(opts)
    end,
}

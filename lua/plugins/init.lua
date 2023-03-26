return {
    {
        'Mofiqul/vscode.nvim',
        opts = { transparent = true },
        config = function(_, opts)
            require('vscode').setup(opts)
            require('vscode').load()
            --vim.api.nvim_set_hl(0, '@variable', { link = '@text' })
            --vim.api.nvim_set_hl(0, '@property', { link = '@text' })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = { theme = 'vscode' }
    },
    {
        'rcarriga/nvim-notify',
        opts = {
            background_colour = '#000000',
            fps = 60,
            timeout = 4000,
        },
        init = function()
            vim.notify = require 'notify'
        end,
    },
}

return {
    {
        'Mofiqul/vscode.nvim',
        opts = { transparent = true },
        config = function(_, opts)
            require('vscode').setup(opts)
            require('vscode').load()
            local c = require('vscode.colors').get_colors()

            vim.api.nvim_set_hl(0, '@variable', { fg = c.vscWhite })
            vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#808080', italic = true })
            --vim.api.nvim_set_hl(0, '@property', { link = '@text' })
            vim.api.nvim_set_hl(0, '@field', { fg = c.vscWhite })
            vim.api.nvim_set_hl(0, '@keyword', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@conditional', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@repeat', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@exception', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@include', { fg = c.vscBlue })
            --vim.api.nvim_set_hl(0, '@parameter', { fg = c.vscWhite })
            vim.api.nvim_set_hl(0, '@constant', { fg = '#32B4FF' })
            vim.api.nvim_set_hl(0, '@attribute', { fg = c.vscBlueGreen })

            local langs = require('languageconfig')
            langs.cpp.theme(c)
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
            vim.notify = require('notify')
        end,
    },
    {
        'skywind3000/asyncrun.vim'
    },
}

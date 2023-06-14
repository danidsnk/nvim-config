return {
    {
        'Mofiqul/vscode.nvim',
        lazy = false,
        opts = { transparent = true },
        config = function(_, opts)
            require('vscode').setup(opts)
            require('vscode').load()
            local c = require('vscode.colors').get_colors()

            vim.api.nvim_set_hl(0, '@variable', { fg = c.vscWhite })
            vim.api.nvim_set_hl(0, '@variable.builtin', { fg = '#808080', italic = true })
            vim.api.nvim_set_hl(0, '@field', { fg = c.vscWhite })
            vim.api.nvim_set_hl(0, '@keyword', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@conditional', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@repeat', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@exception', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@include', { fg = c.vscBlue })
            vim.api.nvim_set_hl(0, '@constant', { fg = '#32B4FF' })
            vim.api.nvim_set_hl(0, '@attribute', { fg = c.vscBlueGreen })
            vim.api.nvim_set_hl(0, '@string.escape', { fg = c.vscYellowOrange })

            vim.api.nvim_set_hl(0, '@lsp.type.function', { fg = c.vscYellow })
            vim.api.nvim_set_hl(0, '@lsp.type.variable', { fg = c.vscWhite })
            vim.api.nvim_set_hl(0, '@lsp.type.parameter', { fg = c.vscGray })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        opts = { theme = 'vscode' },
    },
    {
        'rcarriga/nvim-notify',
        lazy = false,
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
        'skywind3000/asyncrun.vim',
        lazy = false,
    },
}

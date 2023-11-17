return {
    'windwp/nvim-autopairs',
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    enabled = vim.g.started_by_firenvim,
    lazy = false,
    opts = {
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
        local ap = require('nvim-autopairs')
        ap.setup(opts)
        ap.add_rules(require('nvim-autopairs.rules.endwise-lua'))

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end,
}

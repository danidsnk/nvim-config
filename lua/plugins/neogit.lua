return {
    'TimUntersberger/neogit',
    dependencies = {
        'sindrets/diffview.nvim',
        opts = {
            use_icons = false,
        }
    },
    opts = {
        integrations = {
            diffview = true,
        },
        disable_builtin_notifications = true,
    },
    cmd = {
        "Neogit"
    },
    keys = {
        { '<leader>gg', '<cmd>Neogit<CR>', desc = 'Neogit' }
    },
}

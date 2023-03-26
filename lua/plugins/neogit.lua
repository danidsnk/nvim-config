return {
    'TimUntersberger/neogit',
    dependencies = {
        'sindrets/diffview.nvim'
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

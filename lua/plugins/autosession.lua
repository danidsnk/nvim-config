return {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
        require('auto-session').setup {
            log_level = 'error',
        }
    end
}

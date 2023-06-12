return {
    'm-demare/hlargs.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
        color = '#808080',
        excluded_filetypes = { 'cpp', 'h', 'hpp' },
        excluded_argnames = {
            declarations = {
                python = { 'self', 'cls' },
            },
            usages = {
                python = { 'self', 'cls' },
            }
        },
    },
    config = function(_, opts)
        require('hlargs').setup(opts)
    end
}

return {
    'glepnir/template.nvim',
    lazy = false,
    cmd = { 'Template', 'TemProject' },
    config = function()
        local temp_path = vim.fn.stdpath('config') .. '/templates'
        require('template').setup {
            temp_dir = temp_path,
        }
    end
}

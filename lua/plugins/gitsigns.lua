return {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
        signs = {
            add = { hl = 'GitSignsAdd', text = '▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            change = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        },
        current_line_blame = false,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 250,
            ignore_whitespace = true,
        },
    },
    init = function()
        local keymap = require('keymapwrapper')
        keymap.n_set('<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>')
    end,
}

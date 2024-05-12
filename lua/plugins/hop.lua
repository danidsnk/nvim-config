return {
    'phaazon/hop.nvim',
    branch = 'v2',
    lazy = false,
    config = function()
        require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

        local hop = require('hop')
        local keymap = require('keymapwrapper')

        -- local line = { current_line_only = true }
        -- keymap.n_set('f', function() hop.hint_char1(line) end)
        -- keymap.v_set('f', function() hop.hint_char1(line) end)

        -- local line_before = { direction = directions.BEFORE_CURSOR, current_line_only = true }
        -- keymap.n_set('F', function() hop.hint_char1(line_before) end)
        -- keymap.v_set('F', function() hop.hint_char1(line_before) end)

        local in_buffer = { current_line_only = false }
        keymap.n_set('<leader>/', function() hop.hint_char1(in_buffer) end)
        keymap.v_set('<leader>/', function() hop.hint_char1(in_buffer) end)
    end,
}

return {
    dap_config = {
        adapter = 'python',
        adapter_config = {
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
        },
        default_configs = { {
            type = 'python',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            args = {},
            pythonPath = 'python',
            justMyCode = false,
        } }
    },
    lsp_config = {

    },
    repl_config = function(meta)
        local iron = require('iron.core')
        local keymap = require('keybindings')

        keymap.set('n', '<leader>sq', function() iron.send(nil, 'exit()\n') end)

        local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
        local open_file = '__file__ = r"' .. filename .. '";exec(open(r"' .. filename .. '").read())\n'
        keymap.set('n', '<leader>sf', function() iron.send(nil, open_file) end)

        local python_exe = 'python3'
        if vim.fn.executable('python') == 1 then
            python_exe = 'python'
        end
        return { python_exe }
    end,
    key_mappings = {

    },
    theme = {

    },
}

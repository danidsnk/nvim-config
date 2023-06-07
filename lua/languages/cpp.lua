return {
    dap_config = {
        adapter = 'codelldb',
        adapter_config = {
            type = 'server',
            host = '127.0.0.1',
            port = 13000
        },
        default_configs = { {
            type = 'codelldb',
            request = 'launch',
            --C:\Users\kines\Downloads\codelldb-x86_64-windows\extension\adapter\codelldb.exe --port 13000
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            terminal = 'integrated'
        } }
    },
    lsp_config = {

    },
    repl_config = function(meta)
        local iron = require('iron.core')
        local keymap = require('keybindings')
        local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
        keymap.set('n', '<leader>sf', function() iron.send(nil, '.L ' .. filename .. '\n') end)
        return { 'cling', '-std=c++20' }
    end,
    key_mappings = {

    },
    theme = {

    },
}

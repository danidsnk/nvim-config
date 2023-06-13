return {
    init = function()
        require('lazy').load({
            plugins = {
                'nvim-dap',
                'lsp-inlayhints.nvim',
            }
        })
    end,
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
            program = function()
                vim.cmd('AsyncRun codelldb --port 13000')
                return vim.fn.input({
                    prompt = 'Path to executable: ',
                    default = vim.fn.getcwd() .. '/',
                    completion = 'file',
                })
            end,
            cwd = '${workspaceFolder}',
            terminal = 'integrated'
        } },
    },
    lsp_config = {
        lsp = 'clangd',
        config = {
            cmd = { 'clangd', '--clang-tidy' },
        },
    },
    repl_config = function(meta)
        local iron = require('iron.core')
        local keymap = require('keybindings')
        local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
        keymap.n_set('<leader>sf', function() iron.send(nil, '.L ' .. filename .. '\n') end)
        return { 'cling', '-std=c++20' }
    end,
    theme = function(c)
        vim.api.nvim_set_hl(0, '@lsp.mod.constructorOrDestructor.cpp', { fg = c.vscYellow })
        vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = c.vscPink })
    end,
}

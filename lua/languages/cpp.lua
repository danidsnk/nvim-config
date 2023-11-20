return {
    init = function()
        require('lazy').load { plugins = {
            'lsp-inlayhints.nvim',
            'asyncrun.vim',
        } }

        local c = require('vscode.colors').get_colors()
        vim.api.nvim_set_hl(0, '@lsp.mod.constructorOrDestructor.cpp', { fg = c.vscYellow })
        vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = c.vscPink })
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
                    default = vim.fn.getcwd() .. '/build/',
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
    repl_config = {
        cmd = function(_)
            return { 'cling', '-std=c++20' }
        end,
        hooks = {
            send_file = function(iron)
                local filename = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
                return iron.send(nil, '.L ' .. filename .. '\n')
            end
        },
    }
}

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
            --codelldb.exe --port 13000
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
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
        keymap.set('n', '<leader>sf', function() iron.send(nil, '.L ' .. filename .. '\n') end)
        return { 'cling', '-std=c++20' }
    end,
    key_mappings = {

    },
    theme = function(c)
        vim.api.nvim_set_hl(0, '@lsp.type.function', { fg = c.vscYellow })
        vim.api.nvim_set_hl(0, '@lsp.type.variable', { fg = c.vscWhite })
        vim.api.nvim_set_hl(0, '@lsp.type.parameter.cpp', { fg = c.vscGray })
        vim.api.nvim_set_hl(0, '@string.escape.cpp', { fg = c.vscYellowOrange })
        --vim.api.nvim_set_hl(0, '@method', { fg = c.vscYellow })
        vim.api.nvim_set_hl(0, '@lsp.mod.constructorOrDestructor.cpp', { fg = c.vscYellow })
        --vim.api.nvim_set_hl(0, '@operator', { fg = c.vscBlue })
    end,
}

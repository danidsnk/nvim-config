return {
    init = function()
        require('lazy').load { plugins = {
            'hlargs.nvim',
        } }
    end,
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
        lsp = 'pyright',
        config = {}
    },
    repl_config = {
        cmd = function(_)
            local python_exe = 'python3'
            if vim.fn.executable('python') == 1 then
                python_exe = 'python'
            end
            return { python_exe }
        end,
        hooks = {
            send_file = function(iron)
                local filename = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
                local open_file = '__file__ = r"' .. filename .. '";exec(open(__file__).read())\n'
                return iron.send(nil, open_file)
            end,
            close_repl = function(iron)
                return iron.send(nil, 'exit()\n')
            end
        },
    }
}

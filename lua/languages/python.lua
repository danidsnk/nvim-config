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
        return { '' }
    end,
    key_mappings = {

    },
    theme = {

    },
}

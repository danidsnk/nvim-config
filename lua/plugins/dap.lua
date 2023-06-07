return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require('dap')
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>dc', dap.continue, { silent = true, noremap = true })
        vim.keymap.set('n', '<F10>', dap.step_over, { silent = true, noremap = true })
        vim.keymap.set('n', 'S-<F10>', dap.step_out, { silent = true, noremap = true })
        vim.keymap.set('n', '<F11>', dap.step_into, { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { silent = true, noremap = true })
        vim.keymap.set('n', '<Leader>df', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end)
        vim.keymap.set('n', '<Leader>ds', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end)

        local languages = require('languageconfig')
        for lang, conf in pairs(languages) do
            local dapconf = conf.dap_config
            if dapconf ~= nil then
                dap.adapters[dapconf.adapter] = dapconf.adapter_config
                dap.configurations[lang] = dapconf.default_configs
            end
        end
    end
}

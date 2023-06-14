return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require('dap')
        local keymap = require('keybindings')
        keymap.n_set('<leader>db', dap.toggle_breakpoint)
        keymap.n_set('<leader>dc', dap.continue)
        keymap.n_set('<F10>', dap.step_over)
        keymap.n_set('<S-F11>', dap.step_out)
        keymap.n_set('<F11>', dap.step_into)
        keymap.n_set('<leader>dr', dap.repl.toggle)
        keymap.n_set('<Leader>df', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end)
        keymap.n_set('<Leader>ds', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end)

        local languages = require('languageconfig').languages
        for lang, conf in pairs(languages) do
            local dapconf = conf.dap_config
            if dapconf ~= nil then
                dap.adapters[dapconf.adapter] = dapconf.adapter_config
                dap.configurations[lang] = dapconf.default_configs
            end
        end
    end
}

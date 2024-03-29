local function get_hook(langs, key)
    local lang = langs[vim.bo.filetype]
    if lang and lang.repl_config then
        local lk = lang.repl_config.hooks
        if lk and lk[key] then
            return lk[key]
        end
    end
    return nil
end

return {
    'hkupty/iron.nvim',
    keys = {
        { '<leader>so', '<cmd>IronRepl<cr>', desc = 'IronRepl' }
    },
    config = function()
        local iron = require('iron.core')
        local langs = require('languageconfig').languages

        -- Keymaps
        local keymap = require('keymapwrapper')
        keymap.n_set('<leader>sq', function()
            local fn = get_hook(langs, 'close_repl')
            if fn then return fn(iron) end
            return iron.close_repl(nil)
        end)
        keymap.n_set('<leader>sf', function()
            local fn = get_hook(langs, 'send_file')
            if fn then return fn(iron) end
            return iron.send_file()
        end)
        keymap.n_set('<leader>se', function()
            vim.ui.input({ prompt = 'REPL> ' }, function (input)
                iron.send(nil, input .. '\n')
            end)
        end)
        keymap.v_set('<leader>sc', function()
            iron.visual_send()
            iron.send(nil, '\n')
        end)

        -- REPL config per lang
        local repl_definition = {}
        for lang, conf in pairs(langs) do
            local replconf = conf.repl_config
            if replconf ~= nil then
                repl_definition[lang] = { command = replconf.cmd }
            end
        end

        -- Config
        iron.setup {
            config = {
                scratch_repl = true,
                repl_definition = repl_definition,
                repl_open_cmd = "vertical botright 80 split"
            },
            keymaps = {
                send_line = "<leader>sl",
                cr = "<leader>s<cr>",
                interrupt = "<leader>si",
                clear = "<leader>scl",
            },
            highlight = {
                italic = true
            },
            ignore_blank_lines = true,
        }
    end
}

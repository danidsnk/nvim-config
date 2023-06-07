return {
    'hkupty/iron.nvim',
    config = function()
        local iron = require('iron.core')

        local keymap = require('keybindings')
        keymap.set('n', '<leader>so', function() vim.cmd('IronRepl') end)
        keymap.set('n', '<leader>sf', iron.send_file)
        keymap.set('v', '<leader>sc', function()
            iron.visual_send()
            iron.send(nil, '\n')
        end)
        keymap.set('n', '<leader>sr', function()
            iron.close_repl(nil);
            vim.cmd('IronRepl')
        end)

        local langs = require('languageconfig')

        iron.setup {
            config = {
                -- Whether a repl should be discarded or not
                scratch_repl = true,
                repl_definition = {
                    haskell = { command = langs.haskell.repl_config },
                    python = { command = langs.python.repl_config },
                    cpp = { command = langs.cpp.repl_config },
                },
                repl_open_cmd = "vertical botright 80 split"
            },
            keymaps = {
                --send_motion = "<space>sc",
                --visual_send = "<space>sc",
                --send_file = "<space>sf",
                send_line = "<leader>sl",
                --send_mark = "<space>sm",
                --mark_motion = "<space>mc",
                --mark_visual = "<space>mc",
                --remove_mark = "<space>md",
                --cr = "<space>sc",
                interrupt = "<leader>si",
                exit = "<leader>sq",
                clear = "<leader>scl",
            },
            highlight = {
                italic = true
            },
            ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
        }
    end
}

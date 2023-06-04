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

        iron.setup {
            config = {
                -- Whether a repl should be discarded or not
                scratch_repl = true,
                repl_definition = {
                    haskell = {
                        command = function()
                            return { 'cabal', 'repl' }
                        end
                    },
                    python = {
                        command = function(meta)
                            keymap.set('n', '<leader>sq', function() iron.send(nil, 'exit()\n') end)
                            local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
                            local open_file = '__file__ = r"' .. filename .. '";exec(open(r"' .. filename .. '").read())\n'
                            keymap.set('n', '<leader>sf', function() iron.send(nil, open_file) end)
                            local python_exe = 'python3'
                            if vim.fn.executable('python') == 1 then
                                python_exe = 'python'
                            end
                            return { python_exe }
                        end
                    },
                    cpp = {
                        command = function(meta)
                            local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
                            keymap.set('n', '<leader>sf', function() iron.send(nil, '.L ' .. filename .. '\n') end)
                            return { 'cling', '-std=c++20' }
                        end
                    },
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

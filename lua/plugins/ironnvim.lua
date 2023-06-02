return {
    'hkupty/iron.nvim',
    config = function()
        local iron = require("iron.core")

        vim.keymap.set('v', '<leader>sc', function() iron.visual_send(); iron.send(nil, '\n') end, { silent = true, noremap = true })
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
                            local filename = vim.api.nvim_buf_get_name(meta.current_bufnr)
                            local cmd = '__file__ = r"' .. filename .. '";exec(open(r"' .. filename .. '").read())'
                            local python_exe = 'python3'
                            if vim.fn.executable('python') == 1 then
                                python_exe = 'python'
                            end
                            return { python_exe, '-i', '-c', cmd }
                        end
                    },
                },
                repl_open_cmd = "vertical botright 80 split"
            },
            keymaps = {
                --send_motion = "<space>sc",
                --visual_send = "<space>sc",
                send_file = "<space>sf",
                send_line = "<space>sl",
                --send_mark = "<space>sm",
                --mark_motion = "<space>mc",
                --mark_visual = "<space>mc",
                --remove_mark = "<space>md",
                --cr = "<space>sc",
                --interrupt = "<space>s<space>",
                exit = "<space>sq",
                clear = "<space>cl",
            },
            highlight = {
                italic = true
            },
            ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
        }
    end
}

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    keys = {
        { '<leader>e', '<cmd>Telescope file_browser<cr>', desc = 'open Telescope' },
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'open ' },
        { '<C-b>', '<cmd>Telescope buffers<cr>', desc = 'open ' },
        { '<leader>fw', '<cmd>Telescope live_grep<cr>', desc = 'open ' },
    },
    config = function(_, opts)
        require 'telescope'.setup(opts)
        require 'telescope'.load_extension('file_browser')
    end,
    opts = {
        pickers = {
            find_files = {
                theme = 'dropdown',
                layout_config = {
                    anchor = 'N',
                },
                previewer = false,
            },
            diagnostics = {
                layout_strategy = 'vertical',
            },
            buffers = {
                theme = 'dropdown',
                layout_config = {
                    anchor = 'N',
                },
                ignore_current_buffer = true,
                sort_lastused = true,
                previewer = false,
            }
        },
        extensions = {
            file_browser = {
                theme = 'ivy',
                hijack_netrw = true,
                depth = 10,
                auto_depth = true,
                mappings = {
                    n = {
                        ['<C-d>'] = function(prompt_bufnr)
                            local current_picker = require 'telescope.actions.state'.get_current_picker(prompt_bufnr)
                            local finder = current_picker.finder

                            vim.ui.input({
                                prompt = 'Enter file browser depth: ',
                                default = tostring(finder.depth),
                            }, function(input)
                                    local num = tonumber(input)
                                    if not num then
                                        return
                                    end

                                    finder.depth = num
                                    current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
                                end)
                        end
                    },
                },
            },
        },
    }
}

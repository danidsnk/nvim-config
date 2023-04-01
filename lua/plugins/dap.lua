return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require'dap'
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>dc', dap.continue, { silent = true, noremap = true })
        vim.keymap.set('n', '<F10>', dap.step_over, { silent = true, noremap = true })
        vim.keymap.set('n', '<F11>', dap.step_into, { silent = true, noremap = true })
        vim.keymap.set('n', '<leader>dr', dap.repl.open, { silent = true, noremap = true })
    end
}

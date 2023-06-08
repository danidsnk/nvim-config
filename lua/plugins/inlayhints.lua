return {
    'lvimuser/lsp-inlayhints.nvim',
    lazy = true,
    init = function()
        local inlayhints = require("lsp-inlayhints")
        inlayhints.setup {
            enabled_at_startup = true,
        }
        vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
        vim.api.nvim_create_autocmd("LspAttach", {
            group = "LspAttach_inlayhints",
            callback = function(args)
                if not (args.data and args.data.client_id) then
                    return
                end

                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                inlayhints.on_attach(client, bufnr)
            end,
        })

        local keymap = require('keybindings')
        keymap.set('n', '<leader>ih', inlayhints.toggle)
    end
}

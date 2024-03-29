return {
    'lvimuser/lsp-inlayhints.nvim',
    config = function()
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

        local keymap = require('keymapwrapper')
        keymap.n_set('<leader>ih', inlayhints.toggle)
    end
}

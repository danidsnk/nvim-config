return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    },
    opts = {
        diagnostics = {
            --underline = true,
            update_in_insert = true,
            --virtual_text = { spacing = 4, prefix = "●" },
            --severity_sort = true,
        },
        on_attach = function(client, bufnr)
            local keymap = require('keymapwrapper')
            keymap.n_set('<leader>rn', vim.lsp.buf.rename)
            keymap.n_set('<leader>sd', vim.diagnostic.open_float)
            keymap.n_set('K', vim.lsp.buf.hover)
            keymap.n_set('<C-i>', require'telescope.builtin'.lsp_definitions)
            keymap.n_set('<leader>S', require'telescope.builtin'.lsp_document_symbols)
            keymap.n_set('<leader>fr', require'telescope.builtin'.lsp_references)
            keymap.n_set('<leader>F', function()
                if vim.bo.filetype == 'python' then
                    vim.notify('format python file FIXME')
                    vim.cmd('!autopep8 -i -v %')
                else
                    vim.lsp.buf.format { async = true }
                end
            end)
            -- vim.lsp.buf.code_action for quickfix
            vim.lsp.semantic_tokens.start(bufnr, client.id, {})
        end
    },
    config = function(_, opts)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        capabilities.offsetEncoding = 'utf-8'
        local languages = require('languageconfig').languages
        for _, conf in pairs(languages) do
            local lspconf = conf.lsp_config
            if lspconf ~= nil then
                lspconf.config.on_attach = opts.on_attach
                lspconf.config.capabilities = capabilities
                require('lspconfig')[lspconf.lsp].setup(lspconf.config)
            end
        end
        require('lspconfig')['deactivate'] = function()
            vim.cmd('LspStop')
        end
    end,
}

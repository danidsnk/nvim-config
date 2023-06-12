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
            local keymap = require('keybindings')
            keymap.n_set('<leader>rn', vim.lsp.buf.rename)
            keymap.n_set('K', vim.lsp.buf.hover)
            keymap.n_set('<leader>F', function()
                vim.lsp.buf.format { async = true }
            end)
            vim.lsp.semantic_tokens.start(bufnr, client.id, {})
        end
    },
    config = function(_, opts)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local languages = require('languageconfig')
        for _, conf in pairs(languages) do
            local lspconf = conf.lsp_config
            if lspconf ~= nil then
                lspconf.config.on_attach = opts.on_attach
                lspconf.config.capabilities = capabilities
                require('lspconfig')[lspconf.lsp].setup(lspconf.config)
            end
        end
    end,
}

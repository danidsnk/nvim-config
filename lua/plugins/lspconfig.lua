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
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, silent = true, noremap = true })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, silent = true, noremap = true })
            vim.keymap.set('n', '<leader>F', function()
                vim.lsp.buf.format { async = true }
            end, { buffer = bufnr, silent = true, noremap = true })
            vim.lsp.semantic_tokens.start(bufnr, client.id, {})
            --local semantic = client.config.capabilities.textDocument.semanticTokens
            --client.server_capabilities.semanticTokensProvider = {
            --    full = true,
            --    legend = {tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes},
            --    range = true,
            --}
        end
    },
    config = function(_, opts)
        local languages = require('languageconfig')
        for _, conf in pairs(languages) do
            local lspconf = conf.lsp_config
            if lspconf ~= nil then
                lspconf.config.on_attach = opts.on_attach
                require('lspconfig')[lspconf.lsp].setup(lspconf.config)
            end
        end
    end,
}

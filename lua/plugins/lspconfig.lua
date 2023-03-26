return {
    'neovim/nvim-lspconfig',

    opts = {
        on_attach = function(client, bufnr)
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
        require('lspconfig').pyright.setup{
            on_attach = opts.on_attach,
            cmd = { "pyright-langserver", "--stdio" },
            filetypes = { "python" },
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true
                    }
                }
            },
            single_file_support = true,
        }
    end,
}

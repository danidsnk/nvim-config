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
            vim.lsp.semantic_tokens.start(bufnr, client.id, {})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, silent = true, noremap = true })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, silent = true, noremap = true })
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
        require('lspconfig').lua_ls.setup{
            on_attach = opts.on_attach,
        }
    end,
}

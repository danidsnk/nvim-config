return {
    lsp_config = {
        lsp = 'hls',
        config = {
            filetypes = { 'haskell', 'lhaskell', 'cabal' },
            settings = {
                haskell = {
                    plugin = {
                        rename = { config = { crossModule = true } }
                    }
                }
            }
        }
    },
    repl_config = {
        cmd = function(_)
            return { 'cabal', 'repl' }
        end,
    },
}

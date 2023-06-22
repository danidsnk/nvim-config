return {
    init = function()
    end,
    dap_config = {
        adapter = '',
        adapter_config = {

        },
        default_configs = { {

        } },
    },
    lsp_config = {
        lsp = '',
        config = {},
    },
    repl_config = {
        cmd = function(_)
        end,
        hooks = {
            --send_file = function(iron)end,
            --close_repl = function(iron)end,
        },
    },
}

LangConf = {
    languages = {}
}

local function re_load(plugin, load_on_init)
    load_on_init = load_on_init or false
    local plugins = require('lazy.core.config').plugins
    if plugins[plugin]._.loaded ~= nil then
        vim.cmd('Lazy reload ' .. plugin)
    else
        if load_on_init then
            require('lazy').load { plugins = { plugin } }
        end
    end
end

local function lsp_load()
    re_load('nvim-lspconfig', true)
    vim.cmd('LspStart')
end

local function dap_load()
    re_load('nvim-dap', true)
end

local function repl_load()
    re_load('iron.nvim')
end

function LangConf.init(ft)
    if LangConf.languages[ft] then
        return
    end
    local has_ft_config, conf = pcall(require, 'languages.' .. ft)
    if has_ft_config then
        LangConf.languages[ft] = conf
        if conf.init then
            conf.init()
        end
        if conf.lsp_config then
            lsp_load()
        end
        if conf.dap_config then
            dap_load()
        end
        if conf.repl_config then
            repl_load()
        end
    end
end

return LangConf

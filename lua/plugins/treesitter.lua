return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'p00f/nvim-ts-rainbow',
        'nvim-treesitter/playground',
    },
    opts = {
        ensure_installed = { 'cpp', 'lua', 'vim', 'help', 'python', 'json', 'toml', 'markdown', },
        highlight = {
            enable = true,

            disable = function(lang, buf)
                local max_filesize = 300 * 1024 -- 300 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,

            additional_vim_regex_highlighting = false,
        },
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
        indent = { enable = true },
        playground = { enable = true },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
    build = ':TSUpdate',
}

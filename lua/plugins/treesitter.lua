return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'p00f/nvim-ts-rainbow',
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    lazy = false,
    opts = {
        ensure_installed = { 'cpp', 'lua', 'vim', 'python', 'json', 'toml', 'markdown', },
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
            max_file_lines = nil,  -- Do not enable for files with more than n lines, int
            colors = {
                '#F1D700',         -- yellow
                '#DA70D6',         -- purple
                '#179FFF',         -- blue
            },
            -- termcolors = {} -- table of colour name strings
        },
        indent = { enable = true },
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    ["a="] = { query = "@assignment.outer",
                        desc = "Select outer part of an assignment" },
                    ["i="] = { query = "@assignment.inner",
                        desc = "Select inner part of an assignment" },
                    -- ["l="] = { query = "@assignment.lhs",
                    --     desc = "Select left hand side of an assignment" },
                    ["r="] = { query = "@assignment.rhs",
                        desc = "Select right hand side of an assignment" },

                    ["aa"] = { query = "@parameter.outer",
                        desc = "Select outer part of a parameter/argument" },
                    ["ia"] = { query = "@parameter.inner",
                        desc = "Select inner part of a parameter/argument" },

                    ["ai"] = { query = "@conditional.outer",
                        desc = "Select outer part of a conditional" },
                    ["ii"] = { query = "@conditional.inner",
                        desc = "Select inner part of a conditional" },

                    ["al"] = { query = "@loop.outer",
                        desc = "Select outer part of a loop" },
                    ["il"] = { query = "@loop.inner",
                        desc = "Select inner part of a loop" },

                    ["af"] = { query = "@function.outer",
                        desc = "Select outer part of a method/function definition" },
                    ["if"] = { query = "@function.inner",
                        desc = "Select inner part of a method/function definition" },

                    ["ac"] = { query = "@class.outer",
                        desc = "Select outer part of a class" },
                    ["ic"] = { query = "@class.inner",
                        desc = "Select inner part of a class" },
                },
            },
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
        vim.api.nvim_create_user_command('RainbowReload', function()
            vim.cmd('TSDisable rainbow')
            vim.cmd('TSEnable rainbow')
        end, {})
    end,
    build = ':TSUpdate',
}

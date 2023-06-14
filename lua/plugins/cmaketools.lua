return {
    'Civitasv/cmake-tools.nvim',
    config = function()
        require("cmake-tools").setup {
            cmake_command = "cmake",                                -- this is used to specify cmake command path
            cmake_regenerate_on_save = true,                        -- auto generate when save CMakeLists.txt
            cmake_generate_options = { "-G Ninja", "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" }, -- this will be passed when invoke `CMakeGenerate`
            cmake_build_options = {},                               -- this will be passed when invoke `CMakeBuild`
            cmake_build_directory = "build",                             -- this is used to specify generate directory for cmake
            cmake_soft_link_compile_commands = true,                -- this will automatically make a soft link from compile commands file to project root dir
            cmake_kits_path = nil,                                  -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
            cmake_variants_message = {
                short = { show = true },                            -- whether to show short message
                long = { show = true, max_length = 40 }             -- whether to show long message
            },
            cmake_always_use_terminal = false, -- if true, use terminal for generate, build, clean, install, run, etc, except for debug, else only use terminal for run, use quickfix for others
            cmake_quickfix_opts = {
                show = "always",     -- "always", "only_on_error"
                position = "belowright", -- "bottom", "top"
                size = 10,
            },
            cmake_terminal_opts = {
                name = "Main Terminal",
                prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
                split_direction = "vertical", -- "horizontal", "vertical"
                split_size = 80,
                -- Window handling
                single_terminal_per_instance = true, -- Single viewport, multiple windows
                single_terminal_per_tab = true, -- Single viewport per tab
                keep_terminal_static_location = true, -- Static location of the viewport if avialable
                -- Running Tasks
                start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
                start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
                focus_on_main_terminal = false, -- Focus on cmake terminal when cmake task is launched. Only used if cmake_always_use_terminal is true.
                focus_on_launch_terminal = false, -- Focus on cmake launch terminal when executable target in launched.
            }
        }
    end
}

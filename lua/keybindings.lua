return {
    i_set = function(keybinding, func)
        vim.keymap.set('i', keybinding, func, { silent = true, noremap = true })
    end,
    n_set = function(keybinding, func)
        vim.keymap.set('n', keybinding, func, { silent = true, noremap = true })
    end,
    v_set = function(keybinding, func)
        vim.keymap.set('v', keybinding, func, { silent = true, noremap = true })
    end,
    x_set = function(keybinding, func)
        vim.keymap.set('x', keybinding, func, { silent = true, noremap = true })
    end,
    t_set = function(keybinding, func)
        vim.keymap.set('t', keybinding, func, { silent = true, noremap = true })
    end,
}

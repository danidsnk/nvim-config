return {
    set = function(mode, keybinding, func)
        vim.keymap.set(mode, keybinding, func, { silent = true, noremap = true })
    end
}

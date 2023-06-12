local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '

local keymap = require('keybindings')
-- nvigation in insert mode
keymap.i_set('jk', '<Esc>`^')
keymap.i_set('<C-h>', '<Left>')
keymap.i_set('<C-j>', '<Down>')
keymap.i_set('<C-k>', '<Up>')
keymap.i_set('<C-l>', '<Right>')
-- escape terminal mode
keymap.t_set('<Esc>', '<C-\\><C-n>')
-- paste without loosing pasted
keymap.x_set('<leader>p', '"_dP')

local o = vim.opt
o.clipboard = 'unnamedplus'
o.expandtab = true
o.fileencoding = 'utf-8'
o.list = true
o.listchars:append 'space:⋅'
o.listchars:append 'tab:» '
o.nu = true
o.relativenumber = true
o.scrolloff = 5
o.shiftwidth = 4
o.softtabstop = 4
o.splitbelow = true
o.splitright = true
o.tabstop = 4
o.termguicolors = true
o.updatetime = 100
o.confirm = true
--o.listchars:append 'eol:~'
o.mouse = 'a'
if vim.fn.has('win32') then
    o.shell = 'cmd'
    --o.shellcmdflag = '-nologo -noprofile -ExecutionPolicy RemoteSigned -command'
    --o.shellxquote = ''
end

require('lazy').setup {
    spec = { { import = "plugins" }, },
    defaults = { lazy = true, },
}
require('autocmds')

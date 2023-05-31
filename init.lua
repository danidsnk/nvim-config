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

vim.keymap.set('i', 'jk', '<Esc>`^', { silent = true, noremap = true })
vim.keymap.set('i', '<C-h>', '<Left>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-j>', '<Down>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-k>', '<Up>', { silent = true, noremap = true })
vim.keymap.set('i', '<C-l>', '<Right>', { silent = true, noremap = true })

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
--vim.cmd('language en_US.utf-8')

require('autocmds')
require('lazy').setup('plugins')
require('scroll')

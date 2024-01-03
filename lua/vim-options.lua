vim.opt.number = true
vim.opt.relativenumber  = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.expandtab = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

--vim.opt.scrolloff = 999

vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

Rm = vim.keymap.set

-- Navigate vim panes better
Rm('n', '<c-k>', ':wincmd k<CR>')
Rm('n', '<c-j>', ':wincmd j<CR>')
Rm('n', '<c-h>', ':wincmd h<CR>')
Rm('n', '<c-l>', ':wincmd l<CR>')

vim.wo.number = true
Rm('n', '<leader>h', ':nohlsearch<CR>')
Rm('n', '<C-S>', ':update<CR>')


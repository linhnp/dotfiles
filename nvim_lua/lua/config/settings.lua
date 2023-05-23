-- global vars
vim.g.mapleader = ','

-- basic settings
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.ff = 'unix'
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'r'
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true

-- tab and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.shiftwidth = 4 -- indentation
vim.opt.pastetoggle = '<F2>' -- text will not be automatically indented when pasting
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Sidebar
vim.opt.ruler = true -- show the cursor position all the time
vim.opt.showcmd = true -- display commands in bottom bar
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.guitablabel = '%t' -- vimtab only displays file's name

-- backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.g.markdown_recommended_style = 0

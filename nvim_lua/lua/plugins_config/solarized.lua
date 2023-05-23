-- solarized
vim.opt.background = light
vim.opt.termguicolors = true
vim.cmd([[
    autocmd vimenter * ++nested colorscheme solarized8
]])
vim.cmd([[
    au FileType yaml set cursorcolumn
]])

-- highhight trailing spaces
vim.cmd([[
    au BufEnter * match errorMsg /\s\+$/
    au InsertEnter * match errorMsg /\s\+\%#\@<!$/
    au InsertLeave * match errorMsg /\s\+$/
]])

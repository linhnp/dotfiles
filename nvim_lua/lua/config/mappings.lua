M = require 'common'

M.imap('jj', '<Esc>')
M.nmap('<C-n>', '<Cmd>nohl<CR>')

-- moving between split
M.nmap('<C-h>', '<C-w>h')
M.nmap('<C-j>', '<C-w>j')
M.nmap('<C-k>', '<C-w>k')
M.nmap('<C-l>', '<C-w>l')

-- save
M.nmap('<Leader>s', '<Cmd>update<CR>')
M.nmap('<Leader>q', '<Cmd>quit<CR>')

-- moving text block
M.vmap('>', '>gv')
M.vmap('<', '<gv')

-- replace
M.vmap('<C-r>', 'hy:%s/<C-r>h//gc<left><left><left>')

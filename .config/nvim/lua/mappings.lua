function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- map leader to Space
nmap('<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Find files using Telescope command-line sugar.
nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg','<cmd>Telescope live_grep<cr>')
nmap('<leader>fc','<cmd>Telescope git_commits<cr>')
nmap('<leader>fr','<cmd>Telescope spell_suggest<cr>')
nmap('<leader>fb','<cmd>Telescope file_browser<cr>')

-- More natural movement
nmap('j','h')
nmap('k','j')
nmap('l','k')
nmap(';','l')
vmap('j','h')
vmap('k','j')
vmap('l','k')
vmap(';','l')

-- More natural window movement
nmap('<leader>j','<C-W>h')
nmap('<leader>k','<C-W>j')
nmap('<leader>l','<C-W>k')
nmap('<leader>;','<C-W>l')

nmap('<CR>',':noh<CR><CR>')

-- Map arrow keys to move naturally
imap('<Down>','<C-o>gj')
imap('<Up>','<C-o>gk')
nmap('<Down>','gj')
nmap('<Up>','gk')

-- Equal panes
nmap('<Leader>=',  '<C-W>=')

-- Center screen on search result
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Insert bolded text with a timestamp and subject in markdown
imap('<F1>', '<C-R>=strftime("**[%H:%M]** ")<CR><C-o>:cal cursor(0,13)<CR>')
nmap('<F1>', 'i<C-R>=strftime("**[%H:%M]** ")<CR><C-o>:cal cursor(0,13)<CR>')

-- Insert a new todo template
imap('<F2>','<C-R>="- [ ] "<CR><C-o>:cal cursor(0,10)<CR>')
nmap('<F2>', 'i<C-R>="- [ ] "<CR><C-o>:cal cursor(0,12)<CR>')

-- Insert heading with todays date in markdown
imap('<F3>','<C-R>=strftime("### %d-%m-%Y")<CR>')
nmap('<F3>','i<C-R>=strftime("### %d-%m-%Y")<CR>')

vim.pack.add { 'https://github.com/christoomey/vim-tmux-navigator' }

vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'Window Left' })
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'Window Right' })
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'Window Down' })
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'Window Up' })

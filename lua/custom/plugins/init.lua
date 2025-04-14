return {
  'tpope/vim-sleuth',

  { 'numToStr/Comment.nvim', opts = {} },

  { 'rafamadriz/friendly-snippets', opts = {} },

  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    opts = {},
    config = function()
      vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'Window Left' })
      vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'Window Right' })
      vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'Window Down' })
      vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'Window Up' })
    end,
  },
}

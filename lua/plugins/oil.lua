vim.pack.add {
  'https://github.com/stevearc/oil.nvim',
}

require('oil').setup {
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
    show_natural_order = true,
  },
  columns = {
    'icon',
  },
  git = {
    add = function()
      return true
    end,
    mv = function()
      return true
    end,
    rm = function()
      return true
    end,
  },
}
print(require('oil.config').default_file_explorer)

vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

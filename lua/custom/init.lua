require 'custom.options'
require 'custom.remap'
require 'custom.lazy_init'

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('HighlightYank', {}),
  callback = function()
    vim.highlight.on_yank()
  end,
})

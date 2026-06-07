return {
  {
    'axkirillov/easypick.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local easypick = require 'easypick'

      local get_default_branch = "git remote show origin | grep 'HEAD branch' | cut -d' ' -f5"
      local base_branch = vim.fn.system(get_default_branch) or 'main'

      require('easypick').setup {
        pickers = {
          {
            name = 'changed_files',
            command = 'git diff --name-only $(git merge-base HEAD ' .. base_branch .. ' )',
            previewer = easypick.previewers.branch_diff { base_branch = base_branch },
          },
          {
            name = 'conflicts',
            command = 'git diff --name-only --diff-filter=U --relative',
            previewer = easypick.previewers.file_diff(),
          },
        },
      }

      vim.keymap.set('n', '<leader>si', '<cmd>Easypick changed_files<CR>', { desc = '[S]earch G[I]t Changed Files' })
      vim.keymap.set('n', '<leader>so', '<cmd>Easypick conflicts<CR>', { desc = '[S]earch Git C[o]nflicts' })
    end,
  },
}

vim.api.nvim_create_user_command('Easypick', function(opts)
  vim.pack.add { 'https://github.com/axkirillov/easypick.nvim' }
  local easypick = require 'easypick'

  local result = vim.system({ 'git', 'symbolic-ref', '--quiet', '--short', 'refs/remotes/origin/HEAD' }, { text = true }):wait()
  local base_branch = result.code == 0 and result.stdout and vim.trim(result.stdout) or 'main'

  easypick.setup {
    pickers = {
      {
        name = 'changed_files',
        command = 'git diff --name-only $(git merge-base HEAD ' .. vim.fn.shellescape(base_branch) .. ')',
        previewer = easypick.previewers.branch_diff { base_branch = base_branch },
      },
      {
        name = 'conflicts',
        command = 'git diff --name-only --diff-filter=U --relative',
        previewer = easypick.previewers.file_diff(),
      },
    },
  }

  vim.cmd.Easypick(opts.args)
end, { nargs = '*' })

vim.keymap.set('n', '<leader>si', '<cmd>Easypick changed_files<CR>', { desc = '[S]earch G[I]t Changed Files' })
vim.keymap.set('n', '<leader>so', '<cmd>Easypick conflicts<CR>', { desc = '[S]earch Git C[o]nflicts' })

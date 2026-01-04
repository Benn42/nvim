return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  main = 'nvim-treesitter.config',
  build = ':TSUpdate',
  lazy = false,
  opts = {
    ensure_installed = { 'bash', 'c', 'go', 'html', 'lua', 'luadoc', 'markdown', 'rust', 'terraform', 'typescript', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function()
    local ts = require 'nvim-treesitter'
    local parsers = {
      'bash',
      'comment',
      'css',
      'diff',
      'dockerfile',
      'elixir',
      'git_config',
      'gitcommit',
      'gitignore',
      'go',
      'heex',
      'hcl',
      'html',
      'http',
      'java',
      'javascript',
      'jsdoc',
      'json',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'python',
      'regex',
      'rst',
      'rust',
      'scss',
      'ssh_config',
      'sql',
      'terraform',
      'typst',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
    }

    for _, parser in ipairs(parsers) do
      ts.install(parser)
    end

    vim.treesitter.language.register('groovy', 'Jenkinsfile')
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.api.nvim_command 'set nofoldenable'

    vim.api.nvim_create_autocmd('FileType', {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}

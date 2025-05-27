-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'javascript', 'lua', 'luadoc', 'markdown', 'python', 'vim', 'vimdoc' },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true
    require('nvim-treesitter.configs').setup(opts)
  end,
}

-- Color Scheme
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup { flavour = 'macchiato', transparent_background = false }
    vim.cmd.colorscheme 'catppuccin'
  end,
}

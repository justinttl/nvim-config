return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk)
  end,
}

return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { desc = '[P]review hunk' })
    vim.keymap.set('n', '<leader>gb', require('gitsigns').toggle_current_line_blame, { desc = 'Toggle current line [B]lame' })
  end,
}

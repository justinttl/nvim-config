-- Show the code context (function/class/etc.) of what you're editing at the top of the window
return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    max_lines = 3,
    multiline_threshold = 1,
    trim_scope = 'outer',
  },
  keys = {
    {
      '[c',
      function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end,
      desc = 'Jump to [c]ontext (upwards)',
    },
    { '<leader>tc', '<cmd>TSContextToggle<cr>', desc = '[T]oggle treesitter [c]ontext' },
  },
}

return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  { 'lewis6991/gitsigns.nvim', opts = {} },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup { options = { theme = 'catppuccin' } }
    end,
  },
}

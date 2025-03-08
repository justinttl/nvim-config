-- Buffers as tab line
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    vim.opt.mousemoveevent = true

    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        style_preset = {
          bufferline.style_preset.no_italic,
        },
        diagnostics = 'nvim_lsp',
      },
    }
  end,
}

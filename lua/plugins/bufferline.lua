-- Buffers as tab line
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin' },
  config = function()
    vim.opt.termguicolors = true
    vim.opt.mousemoveevent = true

    local bufferline = require 'bufferline'
    bufferline.setup {
      -- Match the Catppuccin flavour set in catppuccin.lua
      -- (styles defaults to bold+italic, which overrides the no_italic preset below)
      highlights = function()
        local hl = require('catppuccin.special.bufferline').get_theme { styles = { 'bold' } }()
        -- Use mantle for the empty area (default is crust) to match lualine and the tmux status bar
        hl.fill = { bg = require('catppuccin.palettes').get_palette().mantle }
        return hl
      end,
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

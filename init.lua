-- [[ Top Level Settings ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require('lazy').setup {
  { import = 'plugins' },
}

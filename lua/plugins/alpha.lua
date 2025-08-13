return {
  'goolord/alpha-nvim',
  dependencies = {
    'echasnovski/mini.icons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local theta = require 'alpha.themes.theta'
    local dashboard = require 'alpha.themes.dashboard'

    theta.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    -- -- Override the buttons/actions while keeping everything else from theta
    theta.config.layout[6] = {
      type = 'group',
      val = {
        { type = 'text', val = 'Quick links', opts = { hl = 'SpecialComment', position = 'center' } },
        { type = 'padding', val = 1 },
        dashboard.button('e', '  New file', '<cmd>ene<CR>'),
        dashboard.button('f', '󰈞  Find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('c', '  Configuration', ':e $MYVIMRC<CR>'),
        dashboard.button('u', '  Update plugins', '<cmd>Lazy sync<CR>'),
        dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
      },
    }

    require('alpha').setup(theta.config)
  end,
}

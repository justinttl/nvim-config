return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    require('mini.files').setup { -- Configuration options
      mappings = {
        close = '',
        go_in = 'l',
        go_in_plus = '<CR>',
        go_out = 'h',
        go_out_plus = 'H',
        mark_goto = "'",
        mark_set = 'm',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
      windows = {
        preview = true, -- Show file preview
        width_focus = 50,
        width_nofocus = 15,
        width_preview = 50,
      },
      options = {
        use_as_default_explorer = true, -- This makes it handle directory opening
      },
    }

    vim.keymap.set('n', '-', function()
      local MiniFiles = require 'mini.files'
      if not MiniFiles.close() then
        MiniFiles.open(vim.api.nvim_buf_get_name(0)) -- Opens at current file's directory
      end
    end, { desc = 'Toggle mini.files at current file' })

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}

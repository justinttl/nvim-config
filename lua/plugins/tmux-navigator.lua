-- Seamless <C-h/j/k/l> navigation between Neovim splits and tmux panes.
-- The matching tmux bindings live in ~/.config/tmux/tmux.conf.
return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Move focus to the left window/pane' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Move focus to the lower window/pane' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Move focus to the upper window/pane' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Move focus to the right window/pane' },
  },
}

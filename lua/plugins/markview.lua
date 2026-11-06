return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  opts = {
    markdown = {
      tables = {
        parts = {
          top = { '╭', '─', '╮', '┬' },
          header = { '│', '│', '│' },
          separator = { '├', '─', '┤', '┼' },
          row = { '│', '│', '│' },
          bottom = { '╰', '─', '╯', '┴' },
          overlap = { '┝', '━', '┥', '┿' },
          align_left = '╼',
          align_right = '╾',
          align_center = { '╴', '╶' },
        },
      },
    },
  },
}

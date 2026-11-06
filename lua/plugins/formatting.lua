return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        async = false,
        timeout_ms = 500,
      }
    end,
    formatters = {
      oxfmt = {
        -- Run oxfmt only in repos that have adopted it, so everything else
        -- still falls through to prettierd. oxfmt locates .oxfmtrc.json itself
        -- for its settings; this is only about whether to run it at all.
        condition = function(_, ctx)
          return vim.fs.find('.oxfmtrc.json', {
            upward = true,
            path = ctx.dirname,
          })[1] ~= nil
        end,
      },
    },
    formatters_by_ft = {
      python = function(bufnr)
        -- if require('conform').get_formatter_info('ruff_format', bufnr).available then
        --   return { 'ruff_format' }
        -- else
        --   return { 'isort', 'black' }
        -- end
        return { 'isort', 'black' }
      end,
      -- oxfmt first, falling back to prettierd where its config is absent.
      -- Only the filetypes oxfmt actually handles are listed here; css, scss,
      -- html, vue and graphql stay on prettierd.
      javascript = { 'oxfmt', 'prettierd', stop_after_first = true },
      typescript = { 'oxfmt', 'prettierd', stop_after_first = true },
      javascriptreact = { 'oxfmt', 'prettierd', stop_after_first = true },
      typescriptreact = { 'oxfmt', 'prettierd', stop_after_first = true },
      json = { 'oxfmt', 'prettierd', stop_after_first = true },
      vue = { 'prettierd' },
      css = { 'prettierd' },
      scss = { 'prettierd' },
      html = { 'prettierd' },
      -- yaml = { 'prettierd' },
      -- markdown = { 'prettierd' },
      graphql = { 'prettierd' },
      lua = { 'stylua' },
    },
  },
}

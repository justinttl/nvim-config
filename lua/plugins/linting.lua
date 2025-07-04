return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    -- Configure linters
    lint.linters_by_ft = {
      javascript = { 'fender_eslint' },
      typescript = { 'fender_eslint' },
      javascriptreact = { 'fender_eslint' },
      typescriptreact = { 'fender_eslint' },
      vue = { 'fender_eslint' },
      svelte = { 'fender_eslint' },
      -- python = { 'ruff' },
    }

    -- Override the eslint_d linter to set a custom cwd
    local util = require 'lint.util'
    lint.linters.fender_eslint = {
      name = 'fender_eslint',
      cmd = 'yarn',
      args = {
        'lint:precommit',
        vim.api.nvim_buf_get_name(0),
        '--format',
        'json',
      },
      stdin = true,
      stream = 'stdout',
      ignore_exitcode = true,
      cwd = '/Users/justin.lee/Klaviyo/Repos/fender',
      parser = function(output, bufnr)
        local result = require('lint.linters.eslint').parser(output, bufnr)
        for _, d in ipairs(result) do
          d.source = 'eslint_d'
        end
        return result
      end,
    }

    -- Create autocommand for linting
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Optional: Add keymap to manually trigger linting
    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      vue = { 'eslint' },
      svelte = { 'eslint' },
      -- python = { 'ruff' },
    }

    -- JS/TS are linted with fender's own `yarn lint:precommit`, and only
    -- inside a fender checkout.
    local fender_fts = { javascript = true, typescript = true, javascriptreact = true, typescriptreact = true }

    local function fender_root(bufnr)
      for dir in vim.fs.parents(vim.api.nvim_buf_get_name(bufnr)) do
        if vim.fs.basename(dir) == 'fender' then
          return dir
        end
      end
    end

    -- A function linter is resolved at lint time, so the file and cwd
    -- always match the buffer being linted.
    lint.linters.fender_eslint = function()
      return {
        name = 'fender_eslint',
        cmd = 'yarn',
        args = { 'lint:precommit', vim.api.nvim_buf_get_name(0), '--format', 'json' },
        stdin = true,
        stream = 'stdout',
        ignore_exitcode = true,
        cwd = fender_root(0),
        parser = function(output, bufnr)
          local result = require('lint.linters.eslint').parser(output, bufnr)
          for _, d in ipairs(result) do
            d.source = 'eslint_d'
          end
          return result
        end,
      }
    end

    local function run_lint()
      if fender_fts[vim.bo.filetype] then
        if fender_root(0) then
          lint.try_lint 'fender_eslint'
        end
        return
      end
      lint.try_lint()
    end

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
      group = vim.api.nvim_create_augroup('lint', { clear = true }),
      callback = run_lint,
    })

    vim.keymap.set('n', '<leader>l', run_lint, { desc = 'Trigger linting for current file' })
  end,
}

-- [[ Neovide configuration ]]
if not vim.g.neovide then
  return
end

vim.g.neovide_cursor_trail_size = 0.3 -- default, 0.0 to 1.0

-- Copy Paste Management
local function save()
  vim.cmd.write()
end
local function copy()
  vim.cmd [[normal! "+y]]
end
local function paste()
  vim.api.nvim_paste(vim.fn.getreg '+', true, -1)
end

vim.keymap.set({ 'n', 'i', 'v' }, '<D-s>', save, { desc = 'Save' })
vim.keymap.set('v', '<D-c>', copy, { silent = true, desc = 'Copy' })
vim.keymap.set({ 'n', 'i', 'v', 'c', 't' }, '<D-v>', paste, { silent = true, desc = 'Paste' })

-- Scaling
vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set('n', '<D-=>', function()
  change_scale_factor(1.25)
end)
vim.keymap.set('n', '<D-->', function()
  change_scale_factor(1 / 1.25)
end)

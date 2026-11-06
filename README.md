# nvim

My personal Neovim config. Started as a fork of
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and has since
been split into modules and reworked around Neovim 0.11's native LSP API.

## Requirements

- Neovim 0.11+
- `git`, `make`, a C compiler, [ripgrep](https://github.com/BurntSushi/ripgrep)
- A [Nerd Font](https://www.nerdfonts.com/)
- Language toolchains as needed (`node`/`npm`, `go`, `python`, …)
- Formatters on your `PATH` (or via `:Mason`): `stylua`, `prettierd`, `black`,
  `isort`, and optionally `oxfmt`

## Install

```sh
git clone https://github.com/justinttl/kickstart.nvim.git ~/.config/nvim
nvim
```

[lazy.nvim](https://github.com/folke/lazy.nvim) bootstraps itself and installs
everything on first launch. Mason installs the language servers.

## Layout

```
init.lua              leader keys, loads the modules below
lua/options.lua       editor options
lua/keymaps.lua       general keymaps and autocommands
lua/neovide.lua       Neovide-only settings (⌘S/⌘C/⌘V, zoom)
lua/lazy-bootstrap.lua
lua/plugins/          one file per plugin spec
lsp/<server>.lua      per-server overrides, merged over nvim-lspconfig defaults
```

## What's in it

| Area        | Plugins                                                         |
| :---------- | :-------------------------------------------------------------- |
| UI          | catppuccin (macchiato), lualine, bufferline, noice, alpha, which-key |
| Navigation  | telescope (+ fzf, ui-select), mini.files (`-` to toggle)        |
| Editing     | nvim-cmp + LuaSnip, mini.ai, mini.surround, Comment, vim-sleuth |
| Code        | treesitter (+ context), todo-comments, markview                 |
| LSP         | nvim-lspconfig, mason, fidget, lazydev                          |
| Format/Lint | conform (format on save), nvim-lint                             |
| Git         | gitsigns, neogit + diffview                                     |

**Language servers:** pyright, ts_ls, lua_ls, terraformls, gopls. To add one,
add it to `ensure_installed` and `vim.lsp.enable` in
`lua/plugins/lsp-config.lua`, and optionally drop overrides in `lsp/<name>.lua`.

**Formatting:** JS/TS/JSON use `oxfmt` when the repo has a `.oxfmtrc.json`,
otherwise `prettierd`. Python uses `isort` + `black`; Lua uses `stylua`.

## Key bindings

Leader is `<Space>`. Press it and wait for which-key to list everything, or
use `<leader>sk` to search keymaps.

| Key                | Action                         |
| :----------------- | :----------------------------- |
| `<leader>sf` / `sg` | Find files / live grep        |
| `<leader><leader>` | Open buffers                   |
| `<leader>sn`       | Search this config             |
| `-`                | File explorer (mini.files)     |
| `gd` / `gr` / `K`  | Definition / references / hover |
| `<leader>ca` / `rn` | Code action / rename          |
| `<leader>f`        | Format buffer                  |
| `<leader>gp` / `gb` | Preview hunk / toggle blame   |
| `[d` / `]d`        | Previous / next diagnostic     |
| `<C-h/j/k/l>`      | Move between splits            |
| `<C-q>`            | Close buffer                   |

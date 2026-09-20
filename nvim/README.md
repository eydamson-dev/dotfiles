# Neovim Configuration

Personal Neovim config managed by lazy.nvim.

## Overview

- **Plugin manager**: lazy.nvim (auto-bootstraps on first launch)
- **Leader key**: `,` (comma)
- **Colorscheme**: catppuccin-macchiato (transparent background)
- **Completion**: blink.cmp
- **Formatting**: conform.nvim
- **Fuzzy finder**: Telescope
- **File explorer**: nvim-tree

## Structure

```
nvim/
├── init.lua                 # entry point (options → keymaps → lazy)
├── lazy-lock.json           # pinned plugin versions
├── .stylua.toml             # Lua formatter config
└── lua/
    ├── config/lazy.lua      # lazy.nvim bootstrap + `plugins` import
    ├── plugins/             # one file per plugin
    └── user/
        ├── options.lua      # editor options
        └── keymaps.lua      # keybindings
```

## Editor options

- 2-space indent (`expandtab`, `shiftwidth`/`tabstop` 2)
- Line numbers (no relative numbers), `cursorline`, sign column always on
- Mouse enabled, true color, persistent undo (`undofile`)
- Clipboard `unnamedplus` (win32yank integration on Windows)
- `scrolloff`/`sidescrolloff` 8

## Keymaps

- `,` — leader
- `;;` — enter command mode (`:`)
- `<leader>ei/em/ep/el/eo` — edit init.lua / keymaps / plugins / LSP handlers / options
- `<Space><Space>` — clear search highlight
- `Ctrl+h/j/k/l` — window navigation
- `ss` — save
- `Ctrl+Arrow` — resize splits
- `jj` — Esc; `jk` — Esc + append to end of line
- Visual: `<`/`>` keep indent; `Alt+j/k` move lines; `p` paste without yanking

## LSP

- Mason-managed servers: bashls, cssmodules_ls, tailwindcss, eslint, html, jsonls,
  lua_ls, vtsls, yamlls, basedpyright, ruff
- `vtsls` configured with organize-imports + format override
- LSP keymaps under `<leader>l` (which-key group): rename, code actions, hover,
  diagnostics, symbols, references, etc.

## Key plugins

- **AI / agent**: avante, copilot, opencode, mcphub (MCP)
- **Completion**: blink.cmp, luasnip
- **LSP**: nvim-lspconfig, mason, lspsaga, lsp-progress
- **UI**: lualine, bufferline/barbar, nvim-tree, telescope, which-key, zen-mode, neoscroll
- **Editing**: nvim-autopairs, nvim-surround, comment, mini.ai, multicursor,
  nvim-ufo (folding), conform (formatting), gitsigns
- **Terminal / projects**: floaterm, project-nvim

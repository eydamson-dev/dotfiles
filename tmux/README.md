# tmux Configuration

Personal tmux config for a terminal workflow that pairs with Neovim.

## Overview

- **Location**: `~/.config/tmux/tmux.conf`
- **Prefix**: `M-q` (Alt+q)
- **Theme**: catppuccin (mocha)
- **Plugin manager**: tpm (Tmux Plugin Manager)

## Features

- Vim key bindings (`mode-keys vi`)
- True color support (`tmux-256color`, `xterm-256color:Tc`)
- 1-based window/pane indexing with renumbering
- History limit 10000, mouse support
- catppuccin mocha status bar

## Keybindings

| Action | Keybinding |
| :--- | :--- |
| Prefix | `Alt+q` |
| New window | `Ctrl+n` |
| Previous / next window | `Alt+j` / `Alt+k` |
| Move window left / right | `Ctrl+Alt+j` / `Ctrl+Alt+k` |
| Select window 1–9 | `Alt+1` … `Alt+9` |
| Copy-mode: begin selection | `v` |
| Copy-mode: rectangle toggle | `Ctrl+v` |
| Copy-mode: copy selection | `y` |

## Plugins (tpm)

- tpm
- tmux-sensible
- tmux-yank
- catppuccin (theme)

Install plugins with `Prefix + I`.

## Requirements

- tmux 3.2+
- Nerd Fonts (for status bar icons)

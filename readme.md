# Dotfiles

Personal configuration shared across machines, installed via a simple copy
script (no symlinks, no GNU Stow).

## Packages

Each top-level folder is a package that maps to an install location:

| Package    | Installs to              |
| ---------- | ------------------------ |
| `opencode` | `~/.config/opencode/`    |
| `nvim`     | `~/.config/nvim/`        |
| `agents`   | `~/.agents/`             |
| `tmux`     | `~/.tmux.conf`           |
| `zsh`      | `~/.zshrc`               |

## Install

```sh
git clone git@github.com:eydamson-dev/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
chmod +x setup.sh
./setup.sh            # interactive menu, or:
./setup.sh opencode   # a specific package
./setup.sh tmux zsh   # multiple packages
./setup.sh all        # everything
```

The script copies the selected package folders into place. It overwrites the
target files, so back up anything local you want to keep.

## Secrets

The Obsidian MCP API key is **not** committed. `opencode/opencode.json`
references it as `{env:OBSIDIAN_MCP_TOKEN}`. When you install the `opencode`
package, `setup.sh` prompts for the key and saves it as an exported variable
in `~/.zshrc` (or `~/.bashrc`).

## Adding a package

1. Create a folder mirroring its install target (e.g. `nvim/` for
   `~/.config/nvim/`).
2. Add one line to the `TARGETS` map at the top of `setup.sh`.

## Windows / WSL notes

Development happens in WSL, so the paths are the same as Linux. One service
lives on the Windows host and must be reachable from WSL:

- **Obsidian MCP** — Obsidian runs as a native Windows app; its MCP plugin
  listens on `127.0.0.1:27124`. Enable **mirrored networking** so `127.0.0.1`
  is shared. Put this in `C:\Users\<you>\.wslconfig`:

  ```ini
  [wsl2]
  networkingMode=mirrored
  ```

  Then `wsl --shutdown` and reopen. A copy is provided at `windows/.wslconfig`
  (copy it to Windows manually; it is not installed by `setup.sh`).

## Sync workflow

Change config here → `git commit` → `git push` → on another machine
`git pull` → `./setup.sh <package>`.

The Engineering Obsidian vault itself syncs separately via the Fast Note Sync
plugin.

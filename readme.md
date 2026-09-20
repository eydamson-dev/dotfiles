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
| `tmux`     | `~/.config/tmux/`        |
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

Development happens in WSL, so the paths are the same as Linux.

### Running opencode on Windows

- **TUI inside WSL (recommended)** — `cd ~/projects/<name> && opencode`.
  Git, node, pnpm, and all tooling run inside WSL. Most reliable for projects
  stored in the WSL filesystem.

- **Desktop app + WSL server** — run a server in WSL and point the Desktop app
  at it:

  ```sh
  # in WSL
  opencode serve --hostname 0.0.0.0 --port 4096
  ```

  Then in the Desktop app, connect to `http://localhost:4096`.

  Note: this is currently unstable — the Desktop app's project picker passes
  Windows UNC paths (`\\wsl.localhost\...`) into the WSL server, which breaks
  bash tool calls. Native WSL-backend support is still in progress.

- **Desktop app (native Windows backend)** — not recommended for WSL projects:
  tools run on Windows instead of WSL, and file access through
  `\\wsl.localhost` is slow.

### Obsidian MCP from WSL

Obsidian runs as a native Windows app; its MCP plugin listens on
`127.0.0.1:27124`. If the opencode backend runs **inside WSL** (TUI, or
Desktop → WSL server), it must reach that Windows service, so enable
**mirrored networking**:

Put this in `C:\Users\<you>\.wslconfig`:

```ini
[wsl2]
networkingMode=mirrored
```

Then `wsl --shutdown` and reopen. A copy is provided at `windows/.wslconfig`
(copy it to Windows manually; it is not installed by `setup.sh`).

If the opencode backend runs natively on Windows instead, `localhost:27124`
works directly and mirrored networking is not required.

## Sync workflow

Change config here → `git commit` → `git push` → on another machine
`git pull` → `./setup.sh <package>`.

The Engineering Obsidian vault itself syncs separately via the Fast Note Sync
plugin.

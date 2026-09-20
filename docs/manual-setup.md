# Manual Setup Guides

`install-prereqs.sh` only installs system packages. The items below need manual
(or scripted) setup. Each guide includes the command and a verification step.

## 1. fnm — Node.js version manager

Node is installed via fnm, not the system package manager.

```sh
curl -fsSL https://fnm.vercel.app/install | bash
```

Then install and set a default Node version:

```sh
fnm install --lts
fnm default lts-latest
```

Verify:

```sh
fnm --version
node --version
```

The zsh config expects fnm at `$HOME/.local/share/fnm` and loads it via the
`fnm` oh-my-zsh plugin.

## 2. opencode

```sh
curl -fsSL https://opencode.ai/install | bash
```

Verify:

```sh
opencode --version
```

## 3. Obsidian + Obsidian MCP plugin

1. Install the Obsidian desktop app from <https://obsidian.md>.
2. Open your "Engineering" vault.
3. Install the Obsidian MCP community plugin (Settings → Community plugins).
4. Enable it and note its API key.
5. Set the key as an environment variable (this is what `setup.sh` prompts for):

   ```sh
   export OBSIDIAN_MCP_TOKEN="<your-api-key>"
   ```

Verify: Obsidian must be running for the MCP to work. In opencode, the Obsidian
MCP tools should be available.

## 4. Nerd Font (optional)

Required for icons in the tmux status bar and the Neovim UI.

1. Download a patched font from <https://www.nerdfonts.com> (e.g. JetBrainsMono
   Nerd Font).
2. Install it and set it as your terminal font.

## 5. stylua (optional)

Lua formatter for the Neovim config.

```sh
# via Homebrew
brew install stylua

# or via cargo
cargo install stylua

# or download a prebuilt binary from the stylua GitHub releases
```

Verify:

```sh
stylua --version
```

## 6. oh-my-zsh

Install **before** running `./setup.sh zsh`, because oh-my-zsh writes its own
`~/.zshrc` and the dotfiles `~/.zshrc` sources `$HOME/.oh-my-zsh/oh-my-zsh.sh`.

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then restore your dotfiles config:

```sh
./setup.sh zsh
```

## 7. zsh-autosuggestions

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

Verify: `~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh` exists (referenced
by `~/.zshrc`).

## 8. tmux — tpm, catppuccin, and plugins

The tmux config uses tpm (Tmux Plugin Manager) and the catppuccin theme. Both
must be cloned manually before plugins can load. Note the config uses prefix
`Alt+q` (not `Ctrl+b`).

1. Clone tpm:

   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

2. Clone the catppuccin theme:

   ```sh
   git clone https://github.com/catppuccin/tmux ~/.config/tmux/plugins/catppuccin
   ```

3. Start tmux, then install the plugins listed in `@plugin` (tmux-sensible,
   tmux-yank) by pressing `Alt+q` then `I`.

4. Reload the config:

   ```sh
   tmux source-file ~/.config/tmux/tmux.conf
   ```

Verify: `tmux -V` shows 3.2+, and the catppuccin status bar renders.

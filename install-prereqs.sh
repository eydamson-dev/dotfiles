#!/usr/bin/env bash
set -euo pipefail

# Detect OS / package manager
if command -v dnf >/dev/null 2>&1; then
  PM=dnf
  INSTALL="sudo dnf install -y"
elif command -v apt-get >/dev/null 2>&1; then
  PM=apt
  INSTALL="sudo apt-get install -y"
elif command -v brew >/dev/null 2>&1; then
  PM=brew
  INSTALL="brew install"
else
  echo "No supported package manager found (dnf / apt / brew)."
  exit 1
fi
echo "Package manager: $PM"

PACKAGES=(opencode nvim tmux zsh agents)

usage() {
  echo "Usage: $0 [package ... | all]"
  echo "Packages: ${PACKAGES[*]}"
}

if [[ $# -eq 0 ]]; then
  echo "Select packages to install prerequisites for (numbers/names, or 'all'):"
  for i in "${!PACKAGES[@]}"; do
    printf '  %d) %s\n' "$((i + 1))" "${PACKAGES[$i]}"
  done
  printf '> '
  read -r input
  # shellcheck disable=SC2206
  SEL=($input)
else
  SEL=("$@")
fi

[[ ${#SEL[@]} -eq 0 ]] && { echo "Nothing selected."; exit 0; }

RESOLVED=()
for s in "${SEL[@]}"; do
  if [[ "$s" == "all" ]]; then
    RESOLVED=("${PACKAGES[@]}")
    break
  elif [[ "$s" =~ ^[0-9]+$ ]] && (( s >= 1 && s <= ${#PACKAGES[@]} )); then
    RESOLVED+=("${PACKAGES[$((s - 1))]}")
  else
    RESOLVED+=("$s")
  fi
done

# fd has a different package name on Debian/Ubuntu
fd_pkg() { [[ "$PM" == "apt" ]] && echo "fd-find" || echo "fd"; }

SYS=()
declare -A MANUAL

add_sys() { SYS+=("$@"); }

for pkg in "${RESOLVED[@]}"; do
  case "$pkg" in
    opencode)
      add_sys git curl
      MANUAL[fnm]="fnm (Node.js): curl -fsSL https://fnm.vercel.app/install | bash && fnm install --lts"
      MANUAL[opencode]="opencode: curl -fsSL https://opencode.ai/install | bash"
      MANUAL[obsidian]="Obsidian app + Obsidian MCP plugin (GUI; enable plugin, set API key)"
      ;;
    nvim)
      add_sys neovim ripgrep git "$(fd_pkg)" python3 python3-pip
      MANUAL[fnm]="fnm (Node.js): curl -fsSL https://fnm.vercel.app/install | bash && fnm install --lts"
      MANUAL[nerdfont]="Nerd Font (optional, for icons)"
      MANUAL[stylua]="stylua (optional, Lua formatter)"
      ;;
    tmux)
      add_sys tmux git
      MANUAL[nerdfont]="Nerd Font (optional, for status bar icons)"
      ;;
    zsh)
      add_sys zsh fzf
      MANUAL[fnm]="fnm (Node.js): curl -fsSL https://fnm.vercel.app/install | bash && fnm install --lts"
      MANUAL[ohmyzsh]="oh-my-zsh: sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
      MANUAL[zsh-autosuggestions]="zsh-autosuggestions: git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions"
      ;;
    agents)
      ;;
    *)
      echo "Unknown package: $pkg"
      usage
      exit 1
      ;;
  esac
done

if [[ ${#SYS[@]} -gt 0 ]]; then
  UNIQ=($(printf '%s\n' "${SYS[@]}" | sort -u))
  echo "Installing system packages: ${UNIQ[*]}"
  $INSTALL "${UNIQ[@]}"
else
  echo "No system packages required."
fi

if [[ ${#MANUAL[@]} -gt 0 ]]; then
  echo
  echo "Remaining setup (run manually):"
  printf '%s\n' "${MANUAL[@]}" | sort -u | while read -r line; do echo "  - $line"; done
  echo
  echo "Step-by-step guides: docs/manual-setup.md"
fi

echo "Done."

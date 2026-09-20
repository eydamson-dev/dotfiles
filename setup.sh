#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Each package maps a repo folder to its install target directory.
# To add a new config, drop its folder here and add one line below.
declare -A TARGETS=(
  [opencode]="$HOME/.config/opencode"
  [nvim]="$HOME/.config/nvim"
  [agents]="$HOME/.agents"
  [tmux]="$HOME/.config/tmux"
  [zsh]="$HOME"
)

PACKAGES=($(printf '%s\n' "${!TARGETS[@]}" | sort))

usage() {
  echo "Usage: $0 [package ... | all]"
  echo "Packages: ${PACKAGES[*]}"
}

if [[ $# -eq 0 ]]; then
  echo "Select packages to install (numbers/names, space-separated, or 'all'):"
  for i in "${!PACKAGES[@]}"; do
    printf '  %d) %s -> %s\n' "$((i + 1))" "${PACKAGES[$i]}" "${TARGETS[${PACKAGES[$i]}]}"
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

for pkg in "${RESOLVED[@]}"; do
  if [[ -z "${TARGETS[$pkg]:-}" ]]; then
    echo "Unknown package: $pkg"
    usage
    exit 1
  fi
done

for pkg in "${RESOLVED[@]}"; do
  target="${TARGETS[$pkg]}"
  mkdir -p "$target"
  echo "-> $pkg => $target"
  cp -R "$ROOT/$pkg/." "$target/"
done

if [[ " ${RESOLVED[*]} " == *" opencode "* ]]; then
  printf '\nPaste your Obsidian MCP API key (blank to keep current): '
  read -r token
  if [[ -n "$token" ]]; then
    token_file="$HOME/.config/secrets/obsidian-token"
    mkdir -p "$(dirname "$token_file")"
    printf '%s' "$token" > "$token_file"
    chmod 600 "$token_file"
    echo "Wrote Obsidian MCP token to $token_file"
  fi
fi

echo "Done."

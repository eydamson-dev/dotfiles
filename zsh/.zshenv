# Load machine-local secrets (gitignored, not committed to dotfiles).
SECRETS_FILE="$HOME/.config/secrets/env"
if [ -f "$SECRETS_FILE" ]; then
  source "$SECRETS_FILE"
fi

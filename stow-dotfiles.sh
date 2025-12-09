#!/bin/bash

# Define the directory where dotfiles are stored
dotfiles_dir="$HOME/dotfiles"

# Ensure we are in the dotfiles directory
cd "$dotfiles_dir" || { echo "Error: Cannot find $dotfiles_dir"; exit 1; }

# List all subdirectories (which correspond to dotfile categories)
dotfiles=$(ls -d */ 2>/dev/null | sed 's#/##')

# Stow each dotfile category
echo "Stowing dotfiles from $dotfiles_dir..."
for folder in $dotfiles; do
    echo "- Stowing $folder"
    stow "$folder"
done

echo "Done! Dotfiles have been symlinked successfully."

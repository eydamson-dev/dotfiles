# Dotfiles Setup

This repository contains my dotfiles for Zsh and Tmux, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## 📌 Installation

1. **Clone this repository** into your home directory:
   ```sh
   git clone https://github.com/eydamson-dev/dotfiles.git ~/dotfiles


### 🔹 How to Use
1. Save the Bash script as `stow-dotfiles.sh` in your `dotfiles` folder.
2. Run `chmod +x stow-dotfiles.sh` to make it executable.
3. Execute `./stow-dotfiles.sh` to apply the symlinks.

This will automatically stow all your dotfiles without manually running `stow` for each one. 🚀

#!/bin/bash
set -euo pipefail

echo "Symlinking dotfiles"

dot_files=(
  ".zshrc"
  ".vimrc"
  ".gitconfig"
)

for dot_file in "${dot_files[@]}"; do
  ln -s "$(pwd)/files/$dot_file" "$HOME/$dot_file"
done

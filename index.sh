#!/bin/bash
set -euo pipefail

# Use colors, but only if connected to a terminal, 
# and that terminal supports colors.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

echo "${BOLD}Installing Oh-My-Zsh${NORMAL}"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo "${BOLD}Symlinking dotfiles${NORMAL}"

dot_files=(
  ".zshrc"
  ".vimrc"
  ".gitconfig"
)

for dot_file in "${dot_files[@]}"; do
  printf "${BLUE}Looking for an existing $dot_file config...${NORMAL}\n"
  if [ -f ~/$dot_file ] || [ -h ~/$dot_file ]; then
    printf "${YELLOW}Found ~/$dot_file. ${GREEN}Backing up to ~/$dot_file.old${NORMAL}\n";
    mv ~/$dot_file ~/$dot_file.old;
  fi
  ln -s "$(pwd)/files/$dot_file" ~/$dot_file
done
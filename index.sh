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

# Check if `zsh` is present.
if command -v zsh >/dev/null 2>&1; then
  echo "${BOLD}Installing Oh-My-Zsh${NORMAL}"

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  echo "${BOLD}Installing Spaceship theme for Oh-My-Zsh${NORMAL}"
  # Check if the theme is installed already
  if [ -f "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme" ] || [ -h "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme" ]; then
    printf "${YELLOW}Spaceship theme is already installed. ${GREEN}Skipping...${NORMAL}\n"
  else
    # Cloning theme files
    env git clone --depth=1 https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" || {
      printf "${RED}Error: git clone of Spaceship-Prompt repo failed${NORMAL}\n"
      exit 1
    }
    ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
  fi
fi

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

reset
printf "${GREEN}"
echo ''
echo 'WELCOME'
echo ''
echo '  _   _       _   _    ____     ____    '
echo ' | \ |"|   U |"|u| |U |  _"\ u / __"| u '
echo '<|  \| |>   \| |\| | \| |_) |/<\___ \/  '
echo 'U| |\  |u    | |_| |  |  _ <   u___) |  '
echo ' |_| \_|    <<\___/   |_| \_\  |____/>> '
echo ' ||   \\,-.(__) )(    //   \\_  )(  (__)'
echo ' (_")  (_/     (__)  (__)  (__)(__)     '
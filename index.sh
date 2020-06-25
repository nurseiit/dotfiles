#!/bin/bash
set -euo pipefail

# Use colors, but only if connected to a terminal, 
# and that terminal supports colors.
# Fallback colors.
RED=""
GREEN=""
YELLOW=""
BLUE=""
BOLD=""
NORMAL=""

# check if interactive
if [[ $- == *i* ]]; then
    if which tput >/dev/null 2>&1; then
        ncolors=$(tput colors)
        if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
          RED="$(tput setaf 1)"
          GREEN="$(tput setaf 2)"
          YELLOW="$(tput setaf 3)"
          BLUE="$(tput setaf 4)"
          BOLD="$(tput bold)"
          NORMAL="$(tput sgr0)"
        fi
    fi
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
else
  printf "${RED}Error: zsh not found...${NORMAL}\n"
  printf "${RED}Please install it to continue${NORMAL}\n"
  exit 1
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

dot_folders=(
  ".vim"
)

for dot_folder in "${dot_folders[@]}"; do
  printf "${BLUE}Looking for an existing $dot_folder folder...${NORMAL}\n"
  if [ -f ~/$dot_folder ] || [ -h ~/$dot_folder ]; then
    printf "${YELLOW}Found ~/$dot_folder. ${GREEN}Backing up to ~/$dot_folder.old${NORMAL}\n";
    mv ~/$dot_folder ~/$dot_folder.old;
  fi
  ln -s "$(pwd)/$dot_folder" ~/$dot_folder
done

# reset
echo -e '\0033\0143'

printf "${GREEN}"
echo ''
echo 'WELCOME!'
echo ''
printf "${YELLOW}"
echo 'ℹ️ First, install brew!'
printf "${BOLD}"
echo '    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
printf "${NORMAL}"
echo ''
printf "${YELLOW}"
echo 'ℹ️ You might wanna run these to install your fonts:'
printf "${BOLD}"
echo '    $ brew tap homebrew/cask-fonts'
echo '    $ brew cask install font-sourcecodepro-nerd-font'
printf "${NORMAL}"
echo ''
printf "${YELLOW}"
echo 'To install dart-lang server:'
printf "${BOLD}"
echo '    $ pub global activate dart_language_server'
printf "${NORMAL}"
echo ''
printf "${YELLOW}"
echo 'More useful stuff:'
printf "${BOLD}"
echo '    $ brew cask install vimr'
echo '    $ brew install node yarn'
printf "${NORMAL}"
echo ''


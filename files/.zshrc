# ===============================================
# PATH
# ===============================================
  export PATH=$HOME/bin:/usr/local/bin:$PATH

# Flutter PATH
  export PATH=$HOME/Dev/flutter/bin:$PATH

# NodeJS PATH
  export PATH="/usr/local/opt/node@10/bin:$PATH"

# Pub PATH
  export PATH="$PATH":"$HOME/.pub-cache/bin"

# NVM Paths
# (TODO) Add Paths

# NVM auto 'nvm use' when entered a dir with .nvmrc
# Turn off to speed up terminal launch
# ===============================================
#  autoload -U add-zsh-hook
#  load-nvmrc() {
#    local node_version="$(nvm version)"
#    local nvmrc_path="$(nvm_find_nvmrc)"
#
#    if [ -n "$nvmrc_path" ]; then
#      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#      if [ "$nvmrc_node_version" = "N/A" ]; then
#        nvm install
#      elif [ "$nvmrc_node_version" != "$node_version" ]; then
#        nvm use
#      fi
#    elif [ "$node_version" != "$(nvm version default)" ]; then
#      echo "Reverting to nvm default version"
#      nvm use default
#    fi
#  }
#  add-zsh-hook chpwd load-nvmrc
#  load-nvmrc
  
# Path to 'oh-my-zsh' installation
  export ZSH="$HOME/.oh-my-zsh"

# Name of the theme to load
  ZSH_THEME="spaceship"

# How often to auto-update (in days)
  export UPDATE_ZSH_DAYS=30

# Plugins to load
  plugins=(
    git
  )

source $ZSH/oh-my-zsh.sh

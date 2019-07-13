# ===============================================
# PATH
# ===============================================
  export PATH=$HOME/bin:/usr/local/bin:$PATH

# Flutter
  export PATH=$HOME/Dev/flutter/bin:$PATH

# NodeJS
  export PATH="/usr/local/opt/node@10/bin:$PATH"

# Pub
  export PATH="$PATH":"$HOME/.pub-cache/bin"

# Fastlane
  export PATH="$HOME/.fastlane/bin:$PATH"

# gem exec-s
  export PATH="$PATH":"$HOME/.gem/ruby/2.3.0/bin"

# Conda
  export PATH="$HOME/miniconda3/bin:$PATH"
  
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

# Bash Wrapper for jumpto
jumpto () {
  JUMPOUT=`command jumpto "$@"`

  if [ $? -eq 1 ]
  then
    echo "Jumping to '${JUMPOUT}.'";
    cd ${JUMPOUT}
  else
    echo "${JUMPOUT}"
  fi
}

source $ZSH/oh-my-zsh.sh

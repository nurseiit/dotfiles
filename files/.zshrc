# ===============================================
# PATH
# ===============================================
  export PATH=$HOME/bin:/usr/local/bin:$PATH

# Go Path
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Install Ruby Gems to ~/gems
  export GEM_HOME=$HOME/gems
  export PATH=$HOME/gems/bin:$PATH

# Anaconda Path
  source /home/me/.anaconda3/etc/profile.d/conda.sh
  export PATH=$HOME/.anaconda3/bin:$PATH

# Yarn binaries
  export PATH=$HOME/.yarn/bin:$PATH

# NVM Paths
  export NVM_DIR="$HOME/.nvm"
  . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"

# NVM auto 'nvm use' when entered a dir with .nvmrc
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
  export ZSH="/home/me/.oh-my-zsh"

# Name of the theme to load
  ZSH_THEME="spaceship"

# How often to auto-update (in days)
  export UPDATE_ZSH_DAYS=30

# Plugins to load
  plugins=(
    git
  )

source $ZSH/oh-my-zsh.sh

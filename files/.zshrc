# ===============================================
# PATHs
# ===============================================

  export PATH=$HOME/bin:/usr/local/bin:$PATH

# Flutter
  export PATH=$HOME/Dev/flutter/bin:$PATH

# Pub
  export PATH=$HOME/Dev/flutter/.pub-cache/bin:$PATH

# NodeJS
  export PATH="/usr/local/opt/node@10/bin:$PATH"

# Fastlane
  export PATH="$HOME/.fastlane/bin:$PATH"

# rbenv
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"

# Yarn
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Metasploit
  export PATH=$PATH:/opt/metasploit-framework/bin

# ===============================================
# Oh-My-Zsh
# ===============================================

# 'oh-my-zsh' installation
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

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ===============================================
# Aliases
# ===============================================

alias anna='mosh --ssh="ssh -p 4329 -i /Users/nurs/.ssh/anna" student@anna.unicss.org'

alias yt-audio-list="youtube-dl -o '~/Downloads/YT/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' -f bestaudio"

# ===============================================
# Misc.
# ===============================================

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

# Fix Locale Errors
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/nurs/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/nurs/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/nurs/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/nurs/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Hack for tmux messing with conda env vars
[[ -z $TMUX ]] || conda deactivate; conda activate base

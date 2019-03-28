fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
which powerline > /dev/null
if [ $? -eq 0 ] ; then
  ZSH_THEME="agnoster"
else
  ZSH_THEME="jonathan"
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras python ssh-agent osx pip vi-mode mvn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#Aliases
##ls, the common ones I use a lot shortened for rapid fire usage

case $(uname -s) in
  Linux)
    alias ls='ls --color' #I like color
  ;;
  Darwin)
    alias ls='ls -G'
  ;;
esac

alias ll='ls -lAFh'   #Too much used to this one
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
 
# Valgrim memory
alias valgrind='valgrind --tool=memcheck --leak-check=full --show-reachable=yes'

# SSH aliases - short cuts to ssh to a host
alias -g shost='ssh -p 9999 user@host.com'
 
# Screen aliases - add a new screen , or entire session, name it, then ssh to the host
alias sshost='screen -t HOST shost'

# Configure for emacs
alias emacs='emacs -nw' #remove the windows by default

# Shortcut for chmod +x because I use it so damn often
alias chmx='chmod +x'

# Use jogsoul directly with my config
alias jogsoul='killall perl; perl ~/.jogsoul/jogsoul.pl ~/.jogsoul/jogsoul.conf'

#alias grep color
alias grep="grep --colour"

# alias mkdir create parent
alias mkdir='mkdir -p'

# Aliases
alias rat='tmux attach-session'
alias se='sudoedit'

# Alias for nvim
if [ $(which nvim > /dev/null; echo $?) -eq 0 ]; then
    alias vim='nvim'
fi

# Exports
export RPROMPT='${vcs_info_msg_0_}'
export PAGER='less'
export NNTPSERVER='news.epita.fr'
export PATH="/sbin:$PATH"
export EDITOR='vim'
export TERM='xterm-256color'
if [ -f /usr/bin/konsole ]; then
    export TERMINAL='konsole'
else
    export TERMINAL='xterm'
fi

if [ -f ~/.proxyrc ]; then
    source ~/.proxyrc
fi
# Rust support
if [ -d $HOME/.cargo ]; then
    PATH=$PATH:$HOME/.cargo/bin
fi

# Ruby Support
if [ -d $HOME/.rvm ]; then
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi
# Maven support
if [ -d $HOME/.m2 ]; then
    export M2_HOME=$HOME/.m2
fi

PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
if [ -d $HOME/.virtualenvs ]; then
  export WORKON_HOME=$HOME/.virtualenvs
fi
if `which virtualenvwrapper.sh>/dev/null`; then
  source virtualenvwrapper.sh
fi
case $(uname -s) in
  #3inux)
  #  alias ls='ls --color' #I like color
  #;;
  Darwin)
      if [ -d $HOME/Library/Android/sdk ]; then
          export ANDROID_HOME=$HOME/Library/Android/sdk
          PATH=$PATH:$ANDROID_HOME/tools
          PATH=$PATH:$ANDROID_HOME/platform-tools
          PATH=$PATH:$ANDROID_HOME/build-tools
      fi
      if [ -d /usr/local/opt/llvm ]; then
          export PATH="/usr/local/opt/llvm/bin:$PATH"
      fi
  ;;
esac
export PATH

# Add file for specific variable outside the .dotfiles config
if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi

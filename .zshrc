# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster-grayscale"
source /opt/homebrew/opt/geometry/share/geometry/geometry.zsh
DEFAULT_USER=`whoami`
prompt_context(){}

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Where are your dotfiles located?
export DOTFILES=$HOME/dotfiles

# Would you like to use another custom folder than $ZSH/custom?
export ZSH_CUSTOM=$DOTFILES/zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aliases
  alias-finder
  git
  yarn
)

export ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# vimrc
export MYVIMRC="$HOME/.vimrc"

# other settings
export LESS="-R"
export HISTCONTROL=ignoreboth
setopt histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
fi

export PATH=\
$HOME/.nodenv/shims:\
$HOME/.yarn/bin:\
$HOME/.rbenv/shims:\
$HOME/go:\
/opt/homebrew/bin:\
$HOME/.config/yarn/global/node_modules/.bin:\
/usr/local/opt/postgresql@9.6/bin:\
/usr/bin:\
/usr/local/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/usr/local/MacGPG2/bin:\
/opt/X11/bin:\
$HOME/dotfiles/scripts

eval $(/opt/homebrew/bin/brew shellenv)
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

# Begin nodenv config
eval "$(nodenv init -)"
export NODENV_SHELL=zsh
source '/opt/homebrew/Cellar/nodenv/1.5.0/libexec/../completions/nodenv.zsh'
command nodenv rehash 2>/dev/null
nodenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(nodenv "sh-$command" "$@")";;
  *)
    command nodenv "$command" "$@";;
  esac
}
# End nodenv config

# Begin pyenv init
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
# End pyenv init

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Created by `pipx` on 2024-07-18 21:22:29
export PATH="$PATH:$HOME/.local/bin"

# begin alias-finder config
zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default
# end alias-finder config

# Source post-zshrc files (this must be performed as the last step in this file)
if [ -d $ZSH_POST_SOURCE_DIR ] && compgen -G "$ZSH_POST_SOURCE_DIR/*.zsh" > /dev/null; then
  for script in $ZSH_POST_SOURCE_DIR/*.zsh; do
    [ -f "$script" ] && source "$script"
  done
fi

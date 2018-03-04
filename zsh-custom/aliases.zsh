alias ls='ls -aGFh'
alias ping='ping -c 4'
alias ddd='fastlane run clear_derived_data'
alias rm=trash
alias vim=nvim

function git-prune-local {
    git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}

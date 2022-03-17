alias ls='ls -laGFh'
alias ping='ping -c 4'
alias ddd='fastlane run clear_derived_data'
alias rm=trash
alias vim=nvim
alias b='bundle exec'

function git-prune-local {
    git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

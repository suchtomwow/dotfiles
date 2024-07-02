gpruni() {
    git fetch -p
    for branch in $(git branch -vv | grep ": gone]" | awk '{print $1}'); do
        printf "Delete branch %s? [y/N] " "$branch"
        read answer
        if [[ $answer == y* || $answer == Y* ]]; then
            git branch -D "$branch"
        fi
    done
}

zshsource() {
  source $HOME/.zshrc && echo "Reloaded zsh config!"
}

command_if_modified() {
    file="$1"
    command_to_run="$2"

    # Record the initial checksum
    initial_checksum=$(cksum "$file" | awk '{ print $1 }')

    # Open the file in Vim
    vim "$file"

    # Record the new checksum
    new_checksum=$(cksum "$file" | awk '{ print $1 }')

    # Compare checksums and run the command if the file was modified
    if [ "$initial_checksum" != "$new_checksum" ]; then
        eval "$command_to_run"
    fi
}

scp_to_downloads_dir() {
    scp root@applevisionpro:$1 $HOME/Downloads
}
    
alias ping='ping -c 4'
alias rm=trash
alias vim=nvim
alias python="$(pyenv which python)"
alias pip="$(pyenv which pip)"
alias cat="bat"
alias cmdifmodified='command_if_modified'
alias zshconfig='cmdifmodified $HOME/.zshrc zshsource'
alias zshalias='cmdifmodified $ZSH_CUSTOM/aliases.zsh zshsource'
alias scpdownloads='scp_to_downloads_dir'

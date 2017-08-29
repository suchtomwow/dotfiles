if [ -f "$HOME/.bash_ps1" ]; then
. "$HOME/.bash_ps1"
fi

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# Aliases
alias ls='ls -GFh'
alias ping='ping -c 4'
alias bkdocs='bdocs && bdoco'
alias git-prune-local='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -D'
alias ddd='fastlane run clear_derived_data'
alias octave='octave-cli'

function bdocs {
  cd ~/Projects/Blinker/blueprints
  snowboard -i blinker_api.apib -s
}

function bdoco {
    open http://127.0.0.1:8088/
}

function git-prune-local {
    git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}

function bak_ddd() {
    #Save the starting dir
    startingDir=$PWD

    #Go to the derivedData
    cd ~/Library/Developer/Xcode/DerivedData

    #Sometimes, 1 file remains, so loop until no files remain
    numRemainingFiles=1
    while [ $numRemainingFiles -gt 0 ]; do
        #Delete the files, recursively
        rm -rf *

        #Update file count
        numRemainingFiles=`ls | wc -l`
    done

    echo Done

    #Go back to starting dir
    cd $startingDir
}

source ~/.rvm/scripts/rvm
source ~/.profile

#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# added by Anaconda2 4.4.0 installer
export PATH="/Users/thomas/anaconda/bin:$PATH"

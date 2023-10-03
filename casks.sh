FORMULAS=(
  git
  mas
  nodenv
  rbenv
  trash # https://gist.github.com/ashfurrow/3865eed417a5fbe8402708e2c706eea6
  wget
  zsh
)

CASK_FORMULAS=(
  1password
  alfred
  atext
  backblaze
  bartender
  bettertouchtool
  betterzip
  brisk
  dash
  dropbox
  fastlane
  google-chrome
  iterm2
  notion
  nvim
  provisionql
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlstephen
  quicklook-json
  slack
  spotify
#  https://raw.githubusercontent.com/caskroom/homebrew-cask/cbd472b8dce75d5aadab817fd6dc22dfcffe44a1/Casks/tower.rb # tower 2
  visual-studio-code
  zeplin
)

brew install ${FORMULAS[@]}
brew install ${CASK_FORMULAS[@]} --cask
brew cleanup

go install github.com/nikitavoloboev/gitupdate@latest

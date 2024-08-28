FORMULAS=(
  1password-cli
  geometry
  gh
  git
  mas
  nodenv
  pyenv
  rbenv
  trash # https://gist.github.com/ashfurrow/3865eed417a5fbe8402708e2c706eea6
  vagrant
  wget
  zsh
  adr-tools
)

CASK_FORMULAS=(
  1password
  alfred
  amethyst # window manager that does different things than magnet
  backblaze
  bartender
  bettertouchtool
  betterzip
  brisk # radar bug reporter
  copilot
  coteditor # small, fast text editor
  dash # api docs
  discord
  docker
  fantastical
  gpg-suite
  google-chrome
  iina
  iterm2
  latest # update manager for 3rd party apps
  linearmouse
  middleclick # 3-finger trackpad click mimicks scroll wheel click
  mullvadvpn
  netnewswire
  notion
  nvim
  obsidian
  oversight
  selfcontrol
  signal
  slack
  spark
  spotify
  sublime-merge # fast git gui client
  https://raw.githubusercontent.com/caskroom/homebrew-cask/cbd472b8dce75d5aadab817fd6dc22dfcffe44a1/Casks/tower.rb # tower 2
  tripmode
  visual-studio-code
  xcodes
  zoom
)

brew install ${FORMULAS[@]}
brew install ${CASK_FORMULAS[@]} --cask
brew cleanup

go install github.com/nikitavoloboev/gitupdate@latest

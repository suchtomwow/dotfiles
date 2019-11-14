echo "Symlinking dotfiles..."
ln -s dotfiles/.gitconfig ~/.gitconfig ln -s dotfiles/.zshrc ~/.zshrc ln -s dotfiles/.lldbinit ~/.lldbinit ln -s dotfiles/.vimrc ~/.config/nvim/init.vim ln -s dotfiles/.vimrc ~/.vimrc

echo "Installing Homebrew..."
export TRAVIS=1 # this tricks homebrew into installing non-interactively
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
unset TRAVIS

echo "Installing a bunch of nice stuff..."

FORMULAS=(
  mas
  rbenv
  wget
  git
  zsh
  trash # https://gist.github.com/ashfurrow/3865eed417a5fbe8402708e2c706eea6
)

CASK_FORMULAS=(
  1password
  alfred
  atext
  backblaze
  bettertouchtool
  betterzip
  brisk
  dash
  dropbox
  fastlane
  google-chrome
  iterm2
  notion
  provisionql
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlstephen
  quicklook-json
  slack
  spotify
  https://raw.githubusercontent.com/caskroom/homebrew-cask/cbd472b8dce75d5aadab817fd6dc22dfcffe44a1/Casks/tower.rb # tower 2
  zeplin
)

brew install ${FORMULAS[@]}
brew tap caskroom/cask
brew cask install ${CASK_FORMULAS[@]}
brew cleanup

mas signin --dialog jthomascarey@gmail.com # this launches the MAS dialog
echo "Installing Bear..."
mas install 1091189122
echo "Installing Magnet..."
mas install 441258766
echo "Installing Spark..."
mas install 1176895641
echo "Installing Fantastical..."
mas install 975937182
echo "Installing Xcode (this will take a while)..."
mas install 497799835
echo "Installing JSON Helper and Location Helper for BetterTouchTool weather widget..."
mas install 453114608
mas install 488536386

echo "Installing Ruby 2.5.1..."
rbenv install 2.5.1
rbenv global 2.5.1

echo "Installing Powerline-patched fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
zsh fonts/install.sh
rm -rf fonts

echo "Telling iTerm2 to use custom settings..."
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "Misc settings..."
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
defaults write com.apple.finder AppleShowAllFiles YES 
killall Finder /System/Library/CoreServices/Finder.app
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Finder > Preferences > Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder > Preferences > Show wraning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferences > Show wraning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Finder > View > As List
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Lastly, install Oh-My-Zsh (last because it will kill the currently running script)
# There are ways around that, but this is easier.
echo "Installing oh my zsh"
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s $(which zsh)
env zsh

echo "Finished running script. Log out and back in for various changes to take effect."

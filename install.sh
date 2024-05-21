echo "Symlinking dotfiles..."
ln -s dotfiles/.gitconfig.global ~/.gitconfig
ln -s dotfiles/.zshrc ~/.zshrc
ln -s dotfiles/.lldbinit ~/.lldbinit
ln -s dotfiles/.vimrc ~/.config/nvim/init.vim
ln -s dotfiles/.vimrc ~/.vimrc

echo "Installing Homebrew..."
export TRAVIS=1 # this tricks homebrew into installing non-interactively
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
unset TRAVIS

echo "Installing a bunch of nice stuff..."
sh dotfiles/homebrew.sh

mas signin --dialog jthomascarey@gmail.com # this launches the MAS dialog
echo "Installing Bear..."
mas install 1091189122
echo "Installing Magnet..."
mas install 441258766
echo "Installing Darkroom..."
mas install 953286746
echo "Installing Flighty..."
mas install 1358823008
echo "Installing Hand Mirror..."
mas install 1502839586
echo "Installing Onigiri Menu Bar Timer..."
mas install 1639917298
echo "Installing Shush..."
mas install 496437906

echo "Installing Ruby latest..."
LATEST_RUBY=$(rbenv install -l | grep -v - | tail -1)
rbenv install $LATEST_RUBY # downloads/installs latest ruby version
rbenv global $LATEST_RUBY # sets as global ruby instance

echo "Installing Powerline-patched fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
git clone https://github.com/Twixes/SF-Mono-Powerline.git fonts/SFMono
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

env zsh

echo "Tasks to perform manually:..."
echo "* Install Machato (https://untimelyunicorn.gumroad.com/l/machato)"
echo "* Install latest Xcode via Xcodes.app"
echo "* Open BetterZip to initialize it"
echo "* Configure GPG/SSH"
echo "* Install TinkerTool (https://www.bresink.com/osx/TinkerTool.html)"
echo "Finished running script. Log out and back in for various changes to take effect."

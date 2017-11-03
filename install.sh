echo "Symlinking dotfiles..."
ln -s .gitconfig ../.gitconfig
ln -s .zshrc ../.zshrc

echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing a bunch of nice stuff..."
CASK_FORMULAS=(
	1password
	alfred
	brisk
	dash
	dropbox
	fantastical
	fastlane
	google-chrome
	iterm2
	macdown
	mas
	slack
	spotify
	sublime-text
)

FORMULAS=(
    rbenv
    wget
    git
    zsh
)

brew install ${FORMULAS[@]}
brew tap caskroom/cask
brew cask install ${CASK_FORMULAS[@]}

mas install Bear
mas install Magnet
mas install Spark

echo "Changing shell..."
brew update
sudo chsh -s /usr/local/bin/zsh

echo "Installing Ruby 2.4.2..."
rbenv install 2.4.2
rbenv global 2.4.2

echo "Installing Powerline-patched fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
zsh fonts/install.sh
rm -rf fonts

echo "Telling iTerm2 to use custom settings..."
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "Turning hidden files on in Finder..."
defaults write com.apple.finder AppleShowAllFiles YES 
killall Finder /System/Library/CoreServices/Finder.app
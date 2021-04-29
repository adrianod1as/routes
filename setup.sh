#!/bin/sh

# Jump to repository root
cd "$(git rev-parse --show-toplevel)"


# Install Homebrew dependencies
installHomebrew='/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
command -v brew >/dev/null 2>&1 || eval $installHomebrew

brew update
brew install xcodegen || (brew upgrade xcodegen && brew cleanup xcodegen)
brew install swiftgen || (brew upgrade swiftgen && brew cleanup swiftgen)
brew install swiftlint || (brew upgrade swiftlint && brew cleanup swiftlint)
brew install sourcery || (brew upgrade sourcery && brew cleanup sourcery)
brew install rbenv || (brew upgrade rbenv && brew cleanup rbenv)
brew install openssl || (brew upgrade openssl && brew cleanup openssl)

# Install Ruby
rbenv init
export LDFLAGS="-L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I$(brew --prefix openssl)/include"
CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)" RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)" rbenv install `cat .ruby-version`

# Install bundler dependencies
gem install bundler
bundle install


# Install xgen command
xgenAlias="alias xgen=\"make generate; echo; echo xgen command is deprecated, use \'make generate\'\""

touch ~/.zshrc
sed -i '' '/^alias\ xgen=/d' ~/.zshrc
echo $xgenAlias >> ~/.zshrc

touch ~/.bashrc
sed -i '' '/^alias\ xgen=/d' ~/.bashrc
echo $xgenAlias >> ~/.bashrc


# Install post-checkout and post-merge hooks
echo "\n"
read -p "Do you want add hooks to automatically generate the project after each checkout and merge? " -n 1 -r
if [[ $REPLY =~ ^[YySs]$ ]]
then
	make addhooks
fi
echo "\nYou can add or remove the hooks later using 'make addhooks' or 'make removehooks'"


# Generate project
echo "\nGenerating project..."
make clean
make generate


# Post setup info
echo "\nTo manually generate the project run the command 'make generate'\n"
echo "Restart the terminal or open a new tab to apply the changes.\n"

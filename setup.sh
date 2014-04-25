#!/usr/bin/env bash

if ! which xcodebuild >/dev/null; then
  echo "Installing Command Line Tools for Xcode"
  xcode-select --install
else
  echo "Skipping Command Line Tools for Xcode installation"
fi

if ! which brew >/dev/null; then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
else
  echo "Skipping Homebrew installation"
fi

if ! which rvm >/dev/null; then
  echo "Installing RVM and Ruby"
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
else
  echo "Skipping RVM and Ruby installation"
fi

if ! which tmux >/dev/null; then
  echo "Installing Tmux"
  brew install tmux
else
  echo "Skipping Tmux installation"
fi

if ! which vim >/dev/null; then
  echo "Installing MacVIM"
  brew install macvim
else
  echo "Skipping MacVIM installation"
fi

if ! which git >/dev/null; then
  echo "Installing Git"
  brew install git
else
  echo "Skipping Git installation"
fi

symlinks=( bash gemrc rdebugrc rvmrc )

echo "Creating symlinks..."
for link in ${symlinks[@]}; do
  target="`pwd`/${link}"
  link_name="${HOME}/.${link}"
  if ! [[ -L $link_name ]]; then
    echo "  LINK - ${link_name}"
    ln -s $target $link_name
  else
    echo "  SKIP - ${link_name}"
  fi
done

if ! $(grep -q "source `pwd`/bashrc" $HOME/.bashrc); then
  echo "Adding source to bashrc"
  echo "source `pwd`/bashrc" >> $HOME/.bashrc
else
  echo "Skipping source for bashrc"
fi

if ! [ -e $HOME/.bash_profile ]; then
  touch $HOME/.bash_profile
fi
if ! $(grep -q "source `pwd`/bash_profile" $HOME/.bash_profile); then
  echo "Adding source to bash_profile"
  echo "source `pwd`/bash_profile" >> $HOME/.bash_profile
else
  echo "Skipping source for bash_profile"
fi

if ! [ -e $HOME/.tmux.conf ]; then
  touch $HOME/.tmux.conf
fi
if ! $(grep -q "source-file `pwd`/tmux.conf" $HOME/.tmux.conf); then
  echo "Adding source-file to tmux.conf"
  echo "source-file `pwd`/tmux.conf " >> $HOME/.tmux.conf
else
  echo "Skipping source for tmux.conf"
fi

if ! [[ -L $HOME/.gitconfig ]]; then
  echo "Creating .gitconfig"
  folder=$(echo `pwd` | sed -e 's/[\/&]/\\&/g')
  sed -e "s/ROOT/$folder/g" gitconfig-template > gitconfig
  ln -s `pwd`/gitconfig $HOME/.gitconfig
else
  echo "Skipping .gitconfig"
fi

if ! [[ -L $HOME/.global_gitignore ]]; then
  echo "Creating .global_gitignore"
  folder=$(echo `pwd` | sed -e 's/[\/&]/\\&/g')
  ln -s `pwd`/global_gitignore $HOME/.global_gitignore
else
  echo "Skipping .global_gitignore"
fi

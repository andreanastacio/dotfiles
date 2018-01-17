#!/usr/bin/env bash

if ! which rbenv >/dev/null; then
  echo "Installing Rbenv"
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
else
  echo "Skipping Rbenv"
fi

symlinks=( zshrc zshenv gemrc rdebugrc tmux.conf )

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

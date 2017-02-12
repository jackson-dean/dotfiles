#!/bin/bash

# Create symlinks in home folder
cd $HOME/dotfiles
echo "Creating symlinks..."
for f in `git ls-files | grep -E '^\.'`; do
  ln -sfv "$PWD/$f" "$HOME/$f"
done

# Create a cron that runs every hour to auto commit and push any changes
read -p "Create hourly cron job to autocommit changes to dotfiles? [y/n] " input
if [[ $input == 'y' ]] || [[ $input == 'Y' ]]; then
  tmpfile="$HOME/crontab.tmp"
  echo 'MAILTO="jckson.dean@gmail.com"' >> $tmpfile
  crontab -l >> $tmpfile
  echo '0 * * * * ~/dotfiles/auto_commit.sh > /dev/null' >> $tmpfile
  crontab $tmpfile
  rm -f $tmpfile
fi

# Setup vim
read -p "Install vim Vundle packages? [y/n] " input
if [[ $input == 'y' ]] || [[ $input == 'Y' ]]; then
  bundleDir="$HOME/.vim/bundle"
  if [[ ! -d "$bundleDir" ]]; then
    mkdir -p "$bundleDir"
  fi
  cd $bundleDir
  git clone https://github.com/VundleVim/Vundle.vim.git $bundleDir/Vundle.vim
  vim +PluginInstall +qall && \
  cd ~/.vim/bundle/tern_for_vim && npm install && sudo npm install -g jsctags
fi

# Install patched fonts
read -p "Install patched fonts for terminal icons? [y/n] " input
if [[ $input == 'y' ]] || [[ $input == 'Y' ]]; then
  cd ~ && git clone https://github.com/ryanoasis/nerd-fonts && \
  cd nerd-fonts && ./install.sh
fi

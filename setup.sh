#!/bin/bash

# Create symlinks in home folder
cd $HOME/dotfiles
echo "Creating symlinks..."
for f in `git ls-files | grep -E '^\.'`; do
  ln -sfv "$PWD/$f" "$HOME/$f"
done

# Setup vim
read -p "Install vim Vundle packages? [y/n] " input
if [[ $input == 'y' ]] || [[ $input == 'Y' ]]; then
  mkdir $HOME/.backup
  mkdir $HOME/.swap
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
  cd nerd-fonts && ./install.sh && cd $HOME/dotfiles
fi

# symlink Ultisnips and colors
ln -sfv "$HOME/dotfiles/UltiSnips" "$HOME/.vim/UltiSnips"
ln -sfv "$HOME/dotfiles/vim-colors" "$HOME/.vim/colors"

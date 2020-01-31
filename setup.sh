#!/bin/bash

# Create symlinks in home folder
cd $HOME/dotfiles
echo "Creating symlinks..."
for f in `git ls-files | grep -E '^\.'`; do
  ln -sfv "$PWD/$f" "$HOME/$f"
done

ln -sfv "$PWD/git-completion.bash" "$HOME/git-completion.bash"
ln -sfv "$PWD/git-prompt.sh" "$HOME/git-prompt.sh"

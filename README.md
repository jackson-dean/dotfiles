# dotfiles

### Installation
Create symlinks by running the setup script

```sh
./setup.sh
```

### Additional setup
To use "color cat" (cat with syntaxt highlighting), run the following and then
start a new terminal:
```sh
sudo easy_install -U Pygments
```
Install `fzf` https://github.com/junegunn/fzf<br>
Install `autojump` https://github.com/wting/autojump<br>
Install `ag` https://github.com/ggreer/the_silver_searcher<br>

```sh
# on mac with homebrew
brew install the_silver_searcher fzf autojump
```

Find the autojump data file by running:
```sh
autojump -s
```
You may need to update the fzf aliases in `.bash_aliases` with
this path depending on the OS.

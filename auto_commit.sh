#!/bin/bash

cd $HOME/dotfiles && \
  git add --all && \
  git commit -m "Auto commit" && \
  git push origin master

#!/bin/bash

cd $HOME/dotfiles && \
  git add --all && \
  git commit -m "Cron auto commit" && \
  git branch tmp-master && \
  git fetch --all && \
  git reset --hard origin/master
  git merge -X theirs tmp-master && \
  git push origin master

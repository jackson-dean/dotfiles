#!/bin/bash

cd $HOME/dotfiles && \
  git add --all && \
  git commit -m "Hmm, something's different...cron auto commit" && \
  git push origin master

#!/bin/bash

cd $HOME/dotfiles && \

  # Add and commit any local changes
  git add --all && \
  git commit -m "Cron auto commit" && \

  # Create a temp copy of our local master
  git branch tmp-master && \

  # Fetch remote changes
  git fetch --all && \

  # Force local master to mirror remote master
  git reset --hard origin/master

  # Merge in our local master copy, favoring our local changes for merge conflict resolution strategy
  git merge -m "Merging tmp-master" -X theirs tmp-master && \

  # Remove our temporary master copy
  git branch -D tmp-master && \

  # Force remote to accept any new changes
  git push -f origin master

#!/bin/bash

TMP_BRANCH='tmp'

cd $HOME/dotfiles && \
  # delete the tmp branch if it exists
  [[ `git branch --list $TMP_BRANCH` ]] && git branch -D $TMP_BRANCH

  # Add and commit any local changes
  git add --all && \
  git commit -m "Cron auto commit" && \

  # Create a temp copy of our local master
  git branch $TMP_BRANCH

  # branch creation failing intermittently for some reason. We'll just
  # keep retrying until it succeeds
  while [[ ! `git branch --list $TMP_BRANCH` ]]; do
    echo "Failed creating branch $TMP_BRANCH. Retrying..."
    git branch $TMP_BRANCH
  done

  # Fetch remote changes
  git fetch --all && \

  # Force local master to mirror remote master
  git reset --hard origin/master && \

  # Merge in our local master copy, favoring our local changes for merge conflict resolution strategy
  git merge -m "Merging tmp-master" -X theirs $TMP_BRANCH && \

  # Force remote to accept any new changes
  git push -f origin master

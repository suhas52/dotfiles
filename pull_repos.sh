#!/usr/bin/env bash
set -e

# GitHub org/user
OWNER="suhas52"

# Repositories to clone
REPOS=(
  chirp-server
  suhas-theodinproject
  chirp-client
  suhas-python
  chatloop
  simple-blog-nextjs
  game-backlog
  members-only
  suhas-cpp
  chatloop-nextjs
  dotfiles
  blog-api
  mini-message-board
  hellotalk-jp-channels
  css-playground
  file-uploader
)

for repo in "${REPOS[@]}"; do
  if [ -d "$repo/.git" ]; then
    echo "Updating $repo"
    git -C "$repo" pull
  else
    echo "Cloning $repo"
    git clone "git@github.com:${OWNER}/${repo}.git"
  fi
done

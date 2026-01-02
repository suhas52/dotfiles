#!/usr/bin/env bash
set -e

for gitdir in */.git; do
  repo_dir="${gitdir%/.git}"
  repo_name="$(basename "$repo_dir")"

  (
    cd "$repo_dir"
    git log \
      --pretty=format:"%ci|${repo_name} - %cd : %s" \
      --date=format:"%d:%m:%Y %H:%M"
  )
done \
| sort \
| sed 's/^[^|]*|//'

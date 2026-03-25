#!/usr/bin/env bash

set -e

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not a git repository."
  exit 1
fi

read -r -p "Commit message: " msg

if [ -z "$msg" ]; then
  echo "Empty commit message."
  exit 1
fi

git add .
git commit -m "$msg"
git push origin main


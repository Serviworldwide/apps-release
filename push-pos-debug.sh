#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./push-debug.sh \"commit message\""
  exit 1
fi

git add pos-app-debug.apk
if git diff --cached --quiet pos-app-debug.apk; then
  echo "ERROR: pos-app-debug.apk matches remote. Rebuild before pushing."
  exit 1
fi
git commit -m "$1"
git pull --rebase
git push

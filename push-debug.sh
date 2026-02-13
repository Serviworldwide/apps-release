#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./push-debug.sh \"commit message\""
  exit 1
fi

git add pos-app-debug.apk
git commit -m "$1"
git pull --rebase
git push

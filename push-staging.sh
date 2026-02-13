#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./push-staging.sh \"commit message\""
  exit 1
fi

git add pos-app-staging-release.apk
git commit -m "$1"
git pull --rebase
git push

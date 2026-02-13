#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./push-prod.sh \"commit message\""
  exit 1
fi

git add pos-app-prod-release.apk
git commit -m "$1"
git pull --rebase
git push

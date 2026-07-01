#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./push-staffapp-debug.sh \"commit message\""
  exit 1
fi

git add staff-app-debug.apk
if git diff --cached --quiet staff-app-debug.apk; then
  echo "ERROR: staff-app-debug.apk matches remote. Rebuild before pushing."
  exit 1
fi
git commit -m "$1"
git pull --rebase
git push

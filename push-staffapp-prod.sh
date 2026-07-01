#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./push-staffapp-prod.sh \"commit message\""
  exit 1
fi

git add staff-app-release.apk
if git diff --cached --quiet staff-app-release.apk; then
  echo "ERROR: staff-app-release.apk matches remote. Rebuild before pushing."
  exit 1
fi
git commit -m "$1"
git pull --rebase
git push

#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./push-prod.sh \"commit message\""
  exit 1
fi

git add pos-app-prod-release.apk
if git diff --cached --quiet pos-app-prod-release.apk; then
  echo "ERROR: pos-app-prod-release.apk matches remote. Rebuild before pushing."
  exit 1
fi
git commit -m "$1"
git pull --rebase
git push

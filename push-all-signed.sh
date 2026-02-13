#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./push-all-signed.sh \"commit message\""
  exit 1
fi

git add pos-app-staging-release.apk pos-app-prod-release.apk
if git diff --cached --quiet pos-app-staging-release.apk pos-app-prod-release.apk; then
  echo "ERROR: APKs match remote. Rebuild before pushing."
  exit 1
fi
git commit -m "$1"
git pull --rebase
git push

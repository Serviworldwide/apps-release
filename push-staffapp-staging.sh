#!/bin/bash

# Pushes: staff-app-staging-release.apk
# Usage: ./push-staffapp-staging.sh <commit message>   (message may be unquoted / multi-word)

MSG="$*"
if [ -z "$MSG" ]; then
  echo "Usage: ./push-staffapp-staging.sh <commit message>"
  exit 1
fi

FILES=(staff-app-staging-release.apk)

# Ensure each APK has been built
missing=0
for f in "${FILES[@]}"; do
  if [ ! -f "$f" ]; then
    echo "ERROR: $f not found — build it first (see staffapp build scripts)."
    missing=1
  fi
done
[ "$missing" -eq 1 ] && exit 1

git add -- "${FILES[@]}"
if git diff --cached --quiet -- "${FILES[@]}"; then
  echo "ERROR: APK(s) unchanged since last push. Rebuild before pushing."
  exit 1
fi

git commit -m "$MSG" || exit 1
git pull --rebase --autostash || { echo "ERROR: pull --rebase failed. Resolve and retry 'git push'."; exit 1; }
git push

#!/usr/bin/env bash
set -eu

TARGET=$1 # ${{ env.REPO_NAME }}
echo "target repo = $TARGET"

pushd $TARGET
# git pull
git add -A  >/dev/null 2>&1
if [ -n "$(git diff --cached)" ]; then
    echo "Changes detected"
    git commit -m "Update from GitHub Actions"  >/dev/null 2>&1
    git pull >/dev/null 2>&1
    git push origin main -f >/dev/null 2>&1
else
    echo "No changes to commit"
fi
popd

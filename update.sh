#!/usr/bin/env bash
set -euo pipefail

git remote add upstream https://github.com/microsoft/DirectX-Headers || true
git fetch upstream
git merge upstream/master || true
git status --porcelain | awk '{if ($1=="DU") print $2}' | xargs git rm

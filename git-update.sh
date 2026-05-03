#!/usr/bin/env bash
set -euo pipefail

# Get the directory where the script is located
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

# Ensure we are in a git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: Directory is not a git repository."
  exit 1
fi

# Ensure update_repo.sh exists and is executable
if [ ! -f "./update_repo.sh" ]; then
  echo "Error: update_repo.sh not found in $SCRIPT_DIR"
  exit 1
fi
chmod +x ./update_repo.sh

# Detect current branch (defaults to main if detection fails)
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || git symbolic-ref --quiet --short HEAD || echo "main")

echo "Starting update for branch: $CURRENT_BRANCH"

# Commit local changes before pulling (WIP)
git add -A
if ! git diff --staged --quiet; then
  git commit -m "WIP: guardar cambios antes de pull" || true
else
  echo "No local changes to commit (pre-check)."
fi

# Call update_repo.sh and pass any additional arguments
./update_repo.sh --remote origin --branch "$CURRENT_BRANCH" --push "$@"

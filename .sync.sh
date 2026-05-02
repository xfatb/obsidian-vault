#!/bin/bash
# Obsidian Vault auto-sync script
VAULT_DIR="/home/ubuntu/Documents/Obsidian Vault"
cd "$VAULT_DIR" || exit 1

# Check if there are any changes
if [ -z "$(git status --porcelain)" ]; then
    exit 0  # Nothing to commit
fi

# Auto-commit and push
git add -A
git commit -m "auto-sync: $(date '+%Y-%m-%d %H:%M')"
git push origin main 2>&1

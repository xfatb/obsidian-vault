#!/bin/bash
# Obsidian Vault auto-sync script
# Runs via crontab every 10 minutes
VAULT_DIR="/home/ubuntu/Documents/Obsidian Vault"
cd "$VAULT_DIR" || exit 1

# Check if there are any changes
if [ -z "$(git status --porcelain)" ]; then
    exit 0  # Nothing to commit, skip
fi

# Auto-commit and push via SSH
git add -A
git commit -m "auto-sync: $(date '+%Y-%m-%d %H:%M')"
git push origin main 2>&1

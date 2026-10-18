#!/bin/bash
# Sauvegarde quotidienne du homelab
set -e
DEST="$HOME/backups/$(date +%F)"
mkdir -p "$DEST"
tar czf "$DEST/deploy.tgz" -C "$(dirname "$0")/.." deploy
echo "ok -> $DEST"

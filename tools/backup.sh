#!/bin/bash
# Sauvegarde quotidienne du homelab
set -e
DEST="$HOME/backups/$(date +%F)"
find "$HOME/backups" -maxdepth 1 -mtime +7 -exec rm -rf {} + 2>/dev/null || true
mkdir -p "$DEST"
tar czf "$DEST/services.tgz" -C "$(dirname "$0")/.." services
echo "ok -> $DEST"

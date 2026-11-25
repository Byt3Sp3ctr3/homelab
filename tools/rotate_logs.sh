#!/bin/bash
# Garde 14 jours de logs docker compressés
set -e
LOGS="$HOME/logs"
mkdir -p "$LOGS"
for s in forum monitoring proxy; do
  docker compose -f "$(dirname "$0")/../services/$s/docker-compose.yml" logs --no-color > "$LOGS/$s-$(date +%F).log" 2>&1 || true
done
gzip -f "$LOGS"/*.log
find "$LOGS" -name '*.gz' -mtime +14 -delete

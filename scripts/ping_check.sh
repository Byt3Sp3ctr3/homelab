#!/bin/bash
# Vérifie que mes machines répondent (réseau local uniquement)
for h in nas.local pi.local; do
  if ping -c1 -W1 "$h" >/dev/null 2>&1; then echo "$h ok"; else echo "$h DOWN"; fi
done

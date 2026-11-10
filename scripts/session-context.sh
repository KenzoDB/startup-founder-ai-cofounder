#!/usr/bin/env bash
# Inyecta la doctrina YC en el contexto al iniciar/reanudar/compactar sesión.
ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
echo "CURRICULUM_DIR=$ROOT/curriculum"
echo
cat "$ROOT/DOCTRINE.md"

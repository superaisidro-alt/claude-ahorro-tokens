#!/usr/bin/env sh
# Instala las skills en ~/.claude/skills (Mac / Linux)
set -e
aqui="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.claude/skills" "$HOME/.claude/reserva"

for s in "$aqui"/skills/*/; do
  cp -R "$s" "$HOME/.claude/skills/"
  echo "Instalada: $(basename "$s")"
done

echo
echo "Listo. Falta (a mano, una vez):"
echo "  1. Pegar plantillas/CLAUDE.md al final de ~/.claude/CLAUDE.md"
echo "  2. Sumar el bloque 'env' de plantillas/settings.json a ~/.claude/settings.json"
echo "  3. Abrir Claude Code y pedir: /context-budget"

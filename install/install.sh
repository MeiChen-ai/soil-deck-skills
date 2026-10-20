#!/usr/bin/env bash
set -e
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS=("soil-teaching-deck" "soil-html-deck" "soil-image-deck")

TARGETS=(
  "$HOME/.gemini/config/skills"
  "$HOME/.config/opencode/skills"
  "$HOME/.agents/skills"
  "$HOME/.claude/skills"
  "$HOME/.codex/skills"
)

for TARGET in "${TARGETS[@]}"; do
  mkdir -p "$TARGET"
  for SKILL in "${SKILLS[@]}"; do
    rm -rf "$TARGET/$SKILL"
    cp -r "$REPO_ROOT/skills/$SKILL" "$TARGET/$SKILL"
  done
  echo "[OK] Installed (${SKILLS[*]}) to: $TARGET"
done

echo ""
echo "🎉 All 3 SOIL Deck Skills (soil-teaching-deck, soil-html-deck, soil-image-deck) are installed!"
echo "👉 Open a new chat in Antigravity, OpenCode, Claude Code, or Codex to start building teaching decks."

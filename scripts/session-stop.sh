#!/bin/bash --noprofile --norc

# acidgreen Stop hook
# Enforces STATE.md snapshot and git hygiene check at session end.
# HOOK-07, HOOK-08
#
# No jq dependency — uses printf for JSON construction.

PROJECT_DIR="${CLAUDE_PROJECT_DIR}"

if [ -z "$PROJECT_DIR" ]; then
  exit 0
fi

STATE_FILE="${PROJECT_DIR}/.acidgreen/STATE.md"
CONTEXT=""

if [ -f "$STATE_FILE" ]; then
  CONTEXT="acidgreen session boundary: Update .acidgreen/STATE.md with final topology phase, blast radius, and modified files before ending."
fi

# Git hygiene check
if [ -d "${PROJECT_DIR}/.git" ]; then
  DIRTY=$(cd "$PROJECT_DIR" && git status --porcelain 2>/dev/null | head -5)
  if [ -n "$DIRTY" ]; then
    CONTEXT="${CONTEXT} Git worktree has uncommitted changes — surface to user before session ends."
  fi
fi

if [ -n "$CONTEXT" ]; then
  printf '{"hookSpecificOutput":{"hookEventName":"Stop","additionalContext":"%s"}}\n' "$CONTEXT"
fi

exit 0

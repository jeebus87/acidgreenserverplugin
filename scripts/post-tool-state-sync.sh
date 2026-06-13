#!/bin/bash --noprofile --norc

# acidgreen PostToolUse hook
# Reminds Claude to update STATE.md after file modifications.
# HOOK-06, HOOK-08
# Runs async — does not block Claude.
#
# No jq dependency — uses printf for JSON construction.

PROJECT_DIR="${CLAUDE_PROJECT_DIR}"

if [ -z "$PROJECT_DIR" ]; then
  exit 0
fi

STATE_FILE="${PROJECT_DIR}/.acidgreen/STATE.md"

if [ -f "$STATE_FILE" ]; then
  printf '{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"acidgreen: File modified. Update .acidgreen/STATE.md — blast radius, modified files list, and topology phase if changed."}}\n'
fi

exit 0

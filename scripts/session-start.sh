#!/bin/bash --noprofile --norc

# acidgreen SessionStart hook
# Seeds managed state files on first session in a project.
# HOOK-01, HOOK-02, HOOK-06, HOOK-07, HOOK-08
#
# No jq dependency — uses printf for JSON construction.

PROJECT_DIR="${CLAUDE_PROJECT_DIR}"
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT}"
TEMPLATES="${PLUGIN_ROOT}/templates"

if [ -z "$PROJECT_DIR" ]; then
  exit 0
fi

SEEDED_FILES=""
NEEDS_GITIGNORE=false

# Seed managed files from templates if they don't exist
for file in STATE.md BRAIN.md MEMORY.md AGENT.md USER.md; do
  template="${TEMPLATES}/${file}.template"
  target="${PROJECT_DIR}/.acidgreen/${file}"

  if [ ! -f "$target" ] && [ -f "$template" ]; then
    mkdir -p "${PROJECT_DIR}/.acidgreen"
    cp "$template" "$target"
    SEEDED_FILES="${SEEDED_FILES} ${file}"
    NEEDS_GITIGNORE=true
  fi
done

# Add .acidgreen/ to .gitignore if needed
if [ "$NEEDS_GITIGNORE" = true ]; then
  GITIGNORE="${PROJECT_DIR}/.gitignore"
  if [ -f "$GITIGNORE" ]; then
    if ! grep -q '\.acidgreen/' "$GITIGNORE" 2>/dev/null; then
      printf '\n# acidgreen managed state files\n.acidgreen/\n' >> "$GITIGNORE"
    fi
  else
    printf '# acidgreen managed state files\n.acidgreen/\n' > "$GITIGNORE"
  fi
fi

# Build additionalContext
CONTEXT=""

if [ -n "$SEEDED_FILES" ]; then
  CONTEXT="acidgreen: Seeded managed files in .acidgreen/:${SEEDED_FILES}. "
fi

# Check if USER.md needs bootstrapping
USER_FILE="${PROJECT_DIR}/.acidgreen/USER.md"
if [ -f "$USER_FILE" ]; then
  if grep -q "(please fill in)" "$USER_FILE" 2>/dev/null; then
    CONTEXT="${CONTEXT}USER.md is not yet filled in. Ask the user for their name, role, motivation, and project vision to complete their profile."
  fi
fi

if [ -n "$CONTEXT" ]; then
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$CONTEXT"
fi

exit 0

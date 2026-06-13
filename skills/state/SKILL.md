---
name: state
description: "Show the current acidgreen topology snapshot: phase, verified intent, blast radius, modified files, and git hygiene. Use when asked about current state or to orient at session start."
user-invocable: true
disable-model-invocation: false
allowed-tools: Read Bash
---

# Topology State

## Current STATE.md

!`cat "${CLAUDE_PROJECT_DIR}/.acidgreen/STATE.md" 2>/dev/null || echo "STATE.md not yet initialized. Run a session with the acidgreen plugin to create it."`

## Git Status

!`cd "${CLAUDE_PROJECT_DIR}" 2>/dev/null && git status --short 2>/dev/null | head -20 || echo "Not a git repository or git not available."`

## Instructions

Present the topology state to the user in a clear summary:
1. Current topology phase (floor/bridge/ceiling)
2. Verified intent
3. Blast radius of recent changes
4. Modified files
5. Git hygiene (clean/dirty, uncommitted count)

If STATE.md doesn't exist yet, inform the user that acidgreen managed files are created on the first session with the plugin active.

---
name: brain
description: "Query and display compressed wisdom seeds from BRAIN.md. Shows cross-project patterns with their deploy-when context. Use when a pattern might apply to the current task."
user-invocable: true
disable-model-invocation: false
allowed-tools: Read
---

# Wisdom Seeds

## Current BRAIN.md

!`cat "${CLAUDE_PROJECT_DIR}/.acidgreen/BRAIN.md" 2>/dev/null || echo "BRAIN.md not yet initialized. Run a session with the acidgreen plugin to create it."`

## Instructions

Present the wisdom seeds to the user:
1. List each seed with its pattern name and deploy-when context
2. If the user provided an argument ($ARGUMENTS), filter seeds relevant to that topic
3. If no seeds exist yet, explain how seeds are created: high-quality task output, compressed failure patterns, or high-signal pattern convergence
4. Each seed must pass 4 invariants: compression (under 12 words), generative (works across domains), falsifiable (ignoring it causes visible failure), decompressible (expands into full reasoning)

If the user wants to add a seed, help them compress it to meet the 4 invariants before writing to BRAIN.md.

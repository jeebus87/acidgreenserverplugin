#!/bin/bash --noprofile --norc

# acidgreen PreToolUse hook
# Injects security invariants as additionalContext before Write/Edit/Bash.
# HOOK-03, HOOK-04, HOOK-05, HOOK-08
#
# NOTE on HOOK-05 (freeze bug prevention):
# Error messages use factual context with alternative paths,
# NOT imperative blocks. This avoids GitHub #24327 freeze behavior.
#
# No jq dependency — uses printf for JSON construction.

INPUT=$(cat)

SECURITY_CONTEXT="acidgreen security invariants active: Parameterize all queries — never interpolate user input into SQL/shell/OS. Validate inputs at trust boundaries. Every outbound call needs a timeout. Resources need paired cleanup. Secrets from env/vault only — never hardcode. Check auth at data-access layer."

printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","additionalContext":"%s"}}\n' "$SECURITY_CONTEXT"

exit 0

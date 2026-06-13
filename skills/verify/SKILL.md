---
name: verify
description: "Run the acidgreen Verification Gate checklist before writing code. Checks state ownership, observability, blast radius, timing, patterns, security, and defensive coding."
user-invocable: true
disable-model-invocation: true
context: fork
allowed-tools: Read Grep Glob Bash
---

# Verification Gate

Work through each item. For each, state whether it's clear, unclear, or not applicable. Flag unclear items as Red Lines before proceeding.

## Core Invariables

- [ ] **State ownership and consistency clear?** — Where does state live? Who owns it? Is there a single source of truth?
- [ ] **Observability in place?** — Where does feedback live? Can you debug this? Are errors surfaced?
- [ ] **Blast radius understood?** — What breaks if this changes? What components are coupled?
- [ ] **Timing and ordering safe?** — Are there race conditions? Is async ordering guaranteed?
- [ ] **Follows existing patterns?** — Does this match the codebase conventions, or intentionally break them with stated rationale?

## Security

- [ ] **Security risks addressed?** — Injection, auth bypass, data exposure, insecure defaults?
- [ ] **Inputs validated at trust boundaries?** — Parameterized queries, allowlist escaping, context-aware encoding?
- [ ] **Secrets management correct?** — No hardcoded credentials, .env in .gitignore, secrets from env/vault?

## Defensive Coding

- [ ] **Every outbound call has an explicit timeout?**
- [ ] **Resources have paired cleanup?** — try/finally, using, RAII for handles, connections, locks
- [ ] **Error boundaries defined at service edges?**
- [ ] **Mutating endpoints are idempotent?**

## Verdict

After working through the checklist:
- **All clear** → Proceed with implementation
- **Items unclear** → Flag as Red Lines, resolve before writing code
- **Items not applicable** → Note why and proceed

Present results as a completed checklist with brief notes per item.

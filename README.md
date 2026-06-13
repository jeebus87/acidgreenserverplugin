# acidgreen

**Codebase Reasoning Topology for Claude Code**

A Claude Code plugin that turns Claude from a code generator into a thinking partner. Install it, and every session starts with topology-first reasoning, security-first design, and structured dialogue discipline — no prompt engineering required.

Based on the [Codebase Reasoning Topology](https://gist.github.com/acidgreenservers/001185d63e5cd65f9fbe6f7a1c70a200) framework by [acidgreenservers](https://github.com/acidgreenservers).

## What It Does

When acidgreen is installed, Claude will:

- **Map before modifying** — Trace the codebase topology before writing code
- **Apply the 4 Invariables** — Check state ownership, observability, coupling, and timing on every change
- **Run a Verification Gate** — 9-point checklist (including defensive coding) before emitting code
- **Detect ambiguity** — Classify requests by ambiguity level and ask calibrated questions instead of guessing
- **Design around security** — Parameterized queries, secrets management, auth patterns, rate limiting, pinned deps
- **Know when to stop** — Red Lines for unclear state, unknown blast radius, race conditions, and security issues
- **Maintain project memory** — Two-layer system: BRAIN.md (cross-project wisdom) and MEMORY.md (project topology)

## Install

```bash
git clone https://github.com/jeebus87/acidgreenserverplugin.git ~/.claude/plugins/acidgreen
```

Then enable it:

```bash
claude plugin enable acidgreen
```

No npm install. No build step. No configuration.

## What You Get

### Always-On Framework (~565 tokens)

The core reasoning topology loads into every session automatically:

```
+--------------------------------------------------+
|  4 INVARIABLES                                    |
|  Where does state live?        → Consistency      |
|  Where does feedback live?     → Observability    |
|  What breaks if I delete this? → Safe refactoring |
|  When does timing matter?      → Correctness      |
+--------------------------------------------------+
         |
         v
+--------------------------------------------------+
|  VERIFICATION GATE (9 items)                      |
|  State · Observability · Blast radius · Timing    |
|  Patterns · Security · Input validation           |
|  Timeouts · Resource cleanup                      |
+--------------------------------------------------+
         |
         v
+--------------------------------------------------+
|  FRICTION LOOP                                    |
|  High → full questions                            |
|  Medium → targeted questions                      |
|  Low → verify, proceed                            |
|  Trivial → act                                    |
+--------------------------------------------------+
         |
         v
+--------------------------------------------------+
|  EXECUTION                                        |
|  State topology → Write code → Flag deferred      |
|  Reason first. Code second.                       |
+--------------------------------------------------+
```

### 4 Lifecycle Hooks

| Hook | When | What |
|------|------|------|
| **SessionStart** | First session in a project | Seeds 5 managed state files, creates `.gitignore` entry, prompts for USER.md profile |
| **PreToolUse** | Before every Write/Edit/Bash | Injects security invariants as context — survives context compaction |
| **PostToolUse** | After every Write/Edit | Reminds Claude to update STATE.md with blast radius and modified files |
| **Stop** | Session ends | Enforces STATE.md snapshot and surfaces dirty git worktree |

### 4 Slash Commands

| Command | What |
|---------|------|
| `/acidgreen:verify` | Run the full 12-item Verification Gate checklist step by step |
| `/acidgreen:state` | Show current topology phase, blast radius, modified files, git hygiene |
| `/acidgreen:brain` | Query compressed wisdom seeds with pattern and deploy-when context |
| `/acidgreen:friction` | Enter the Friction Loop explicitly for ambiguity resolution |

### 5 Managed State Files

On first session, acidgreen creates `.acidgreen/` in your project with:

| File | Purpose |
|------|---------|
| `STATE.md` | Topology phase (floor/bridge/ceiling), blast radius, modified files, git hygiene |
| `BRAIN.md` | Cross-project wisdom seeds — compressed patterns that apply everywhere |
| `MEMORY.md` | Project-specific topology knowledge — 50-char entries, pruned at 300 lines |
| `AGENT.md` | Per-project cognitive model — codebase map, data flows, abstractions |
| `USER.md` | Team member profile — name, role, motivation, vision |

These files are automatically added to `.gitignore`.

## The 4 Invariables

Before writing any code, Claude checks:

| Question | Maps To | Why It Matters |
|----------|---------|----------------|
| Where does state live? | Ownership & truth | Consistency, blast radius |
| Where does feedback live? | Observability | Debugging, monitoring |
| What breaks if I delete this? | Coupling & fragility | Safe refactoring |
| When does timing matter? | Async & ordering | Race conditions, correctness |

## Security-First Design

acidgreen enforces: *design features around security, not security around features.*

- Parameterize all queries — never interpolate user input
- argon2id for passwords, RS256 JWTs with short expiry
- Secrets from env/vault only — never hardcoded
- HSTS, nosniff, DENY framing, CORS allowlist
- Reject oversized request bodies, rate-limit auth endpoints
- Pin dependency versions, reject packages published less than 7 days ago

## Autonomy Threshold

Claude knows when to act and when to ask:

- **Trivial** (typo, tooltip, rename) — act proactively
- **Non-trivial** (new logic, state changes, APIs) — stop, flag, confirm
- **Scope-crossing** (outside stated scope) — always flag and stop

## How It Works

```
acidgreen/
├── .claude-plugin/
│   └── plugin.json                 # Plugin manifest
├── hooks/
│   └── hooks.json                  # Hook registrations
├── scripts/
│   ├── session-start.sh            # Seeds managed files
│   ├── pre-tool-security.sh        # Security context injection
│   ├── post-tool-state-sync.sh     # STATE.md sync reminder
│   └── session-stop.sh             # Session boundary check
├── skills/
│   ├── topology-context/SKILL.md   # Always-on framework (~565 tokens)
│   ├── verify/SKILL.md             # /acidgreen:verify
│   ├── state/SKILL.md              # /acidgreen:state
│   ├── brain/SKILL.md              # /acidgreen:brain
│   └── friction/SKILL.md           # /acidgreen:friction
└── templates/
    ├── STATE.md.template
    ├── BRAIN.md.template
    ├── MEMORY.md.template
    ├── AGENT.md.template
    └── USER.md.template
```

- **Zero dependencies** — plain Markdown, JSON, and bash. No npm, no build.
- **All-or-nothing** — the framework is a coherent unit. No feature toggles.
- **Team-first** — install once, every developer gets consistent AI behavior.

## Origin

This plugin packages the [Noosphere Steward Framework](https://gist.github.com/acidgreenservers/001185d63e5cd65f9fbe6f7a1c70a200) — a metacognitive prompt architecture with 100+ stars that shapes how LLMs engage with codebases. The original framework includes AGENTS.md, AGENT.md, BRAIN.md, HEART.md, STATE.md, MEMORY.md, RULES.md, TOOLS.md, and USER.md.

The plugin compresses the framework's highest-impact directives (~565 tokens from ~33K original) into an always-on skill, enforces security invariants via lifecycle hooks, and provides interactive reasoning tools via slash commands.

## License

MIT

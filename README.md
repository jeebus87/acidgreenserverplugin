<div align="center">

```
                 ╔═══════════════════════════════════════════════════╗
                 ║                                                   ║
                 ║              a c i d g r e e n                    ║
                 ║                                                   ║
                 ║         CODEBASE REASONING TOPOLOGY               ║
                 ║                                                   ║
                 ╚═══════════════════════════════════════════════════╝

         ┌─────────────────────────────────────────────────────────┐
         │  Structure is persistence.                              │
         │  Map the topology before modifying it.                  │
         │  You cannot control state — only your relationship      │
         │  with it.                                               │
         └─────────────────────────────────────────────────────────┘
```

**Claude Code Plugin** · **Zero Dependencies** · **~565 Tokens Always-On**

[Install](#install) · [How It Works](#how-it-works) · [Commands](#commands) · [Origin](#origin)

---

</div>

<br>

## The Problem

AI coding agents generate code. They don't *think* about code.

They don't ask where state lives before modifying it. They don't check blast radius before deleting something. They don't stop when timing is unsafe. They don't design around security — they bolt it on after.

**acidgreen fixes this.** Install the plugin, and Claude becomes a thinking partner that maps your codebase topology before touching a single line.

No prompt engineering. No system prompt pasting. No configuration.

<br>

## Install

**npm:**

```bash
npm install -g acidgreen
```

**or clone:**

```bash
git clone https://github.com/jeebus87/acidgreenserverplugin.git ~/.claude/plugins/acidgreen
```

That's it. No build step. No config files.

<br>

---

<br>

## How It Works

<br>

```
     ╭──────────────────────────────────────────────────────────╮
     │                                                          │
     │   Every session, before Claude writes a single line:     │
     │                                                          │
     ╰──────────────────────────────────────────────────────────╯

                              │
                              ▼

              ╔══════════════════════════════╗
              ║     THE 4 INVARIABLES        ║
              ║                              ║
              ║  Where does state live?      ║───▶ Consistency
              ║  Where does feedback live?   ║───▶ Observability
              ║  What breaks if I delete?    ║───▶ Safe refactoring
              ║  When does timing matter?    ║───▶ Correctness
              ║                              ║
              ╚══════════════╦═══════════════╝
                             │
                             ▼

              ╔══════════════════════════════╗
              ║     VERIFICATION GATE        ║
              ║                              ║
              ║  ☐ State ownership clear?    ║
              ║  ☐ Observability in place?   ║
              ║  ☐ Blast radius understood?  ║
              ║  ☐ Timing safe?              ║
              ║  ☐ Follows patterns?         ║
              ║  ☐ Security addressed?       ║
              ║  ☐ Inputs validated?         ║
              ║  ☐ Timeouts on all calls?    ║
              ║  ☐ Resource cleanup paired?  ║
              ║                              ║
              ╚══════════════╦═══════════════╝
                             │
                    ┌────────┴────────┐
                    │                 │
                    ▼                 ▼

          ╔════════════════╗  ╔════════════════╗
          ║  ALL CLEAR     ║  ║   UNCLEAR?     ║
          ║                ║  ║                ║
          ║  State topo    ║  ║  ◆ FRICTION    ║
          ║  briefly, then ║  ║    LOOP        ║
          ║  write clean   ║  ║                ║
          ║  code.         ║  ║  Detect level  ║
          ║                ║  ║  Ask calibrated║
          ║  Reason first. ║  ║  questions.    ║
          ║  Code second.  ║  ║  Resolve or    ║
          ║                ║  ║  defer.        ║
          ╚════════════════╝  ╚════════════════╝
```

<br>

---

<br>

## What Gets Injected

The always-on skill loads **~565 tokens** into every session. That's it. No bloat. Every token changes behavior.

<details>
<summary><strong>The 4 Invariables</strong> — applied before every code change</summary>

<br>

| Question | Why It Matters |
|:---------|:---------------|
| **Where does state live?** | Consistency, blast radius |
| **Where does feedback live?** | Debugging, monitoring |
| **What breaks if I delete this?** | Safe refactoring |
| **When does timing matter?** | Race conditions, correctness |

> *Track logic both ways. Verify code by reading, not trusting prior intent.*

</details>

<details>
<summary><strong>Verification Gate</strong> — 9-point checklist before code emission</summary>

<br>

- [ ] State ownership clear?
- [ ] Observability in place?
- [ ] Blast radius understood?
- [ ] Timing safe?
- [ ] Follows existing patterns?
- [ ] Security addressed?
- [ ] Inputs validated at trust boundaries?
- [ ] Outbound calls have timeouts?
- [ ] Resources have paired cleanup?

> *If any item is unclear on non-trivial work — stop and ask.*

</details>

<details>
<summary><strong>Friction Loop</strong> — ambiguity detection and resolution</summary>

<br>

```
Ambiguity Level    →    Response
─────────────────────────────────
HIGH   (vague)     →    Full question sequence
MEDIUM (gaps)      →    Targeted questions
LOW    (clear)     →    Verify, proceed
TRIVIAL            →    Act immediately
```

> *If you must assume a structural pattern not explicitly stated, it is automatically Medium Ambiguity.*

</details>

<details>
<summary><strong>Security-First Design</strong> — concrete directives, not vibes</summary>

<br>

```
Design features around security, not security around features.
```

- Parameterize all queries — never interpolate user input into SQL/shell/OS
- `argon2id` for passwords · `RS256` JWTs · `exp ≤ 15min`
- Secrets from env/vault only — never hardcoded
- `HSTS` · `nosniff` · `DENY` framing · CORS allowlist
- Reject bodies `> 1MB` pre-parse · Rate-limit auth endpoints
- Pin versions · No deps published `< 7 days`

</details>

<details>
<summary><strong>Autonomy Threshold</strong> — when to act vs. when to ask</summary>

<br>

```
  TRIVIAL             NON-TRIVIAL           SCOPE-CROSSING
  typo, tooltip       new logic, APIs       outside stated scope
  ─────────────       ──────────────        ──────────────────
  act proactively     stop, flag, confirm   always flag and stop
```

> *Implied requirements: only settings/config/wiring that logically follow. Never add unsurfaced features.*

</details>

<details>
<summary><strong>Red Lines</strong> — hard stops, non-negotiable</summary>

<br>

```
  ■ Unclear state ownership
  ■ Unknown blast radius
  ■ Race condition hazards
  ■ Security issues
  ■ Significant complexity debt
  ■ Ambiguous non-trivial requests
```

> *Hit a red line → stop and flag. No exceptions.*

</details>

<details>
<summary><strong>Dialogue Discipline</strong> — how Claude communicates</summary>

<br>

- Be measured, rigorous, concise
- State assumptions clearly
- Disagree honestly
- Propose to clarify — map both sides before asking where to cross
- Never write code you cannot trace invariants for

</details>

<br>

---

<br>

## Lifecycle Hooks

Four hooks enforce the framework at the system level — not as suggestions Claude might ignore, but as structural guarantees.

```
  SESSION START                    PRE-TOOL USE
  ─────────────                    ──────────────
  ▸ Seeds 5 state files            ▸ Injects security invariants
  ▸ Creates .gitignore entry         before Write / Edit / Bash
  ▸ Bootstraps USER.md profile     ▸ Survives context compaction
                                   ▸ Every. Single. Call.


  POST-TOOL USE                    SESSION STOP
  ──────────────                   ─────────────
  ▸ STATE.md sync reminder         ▸ STATE.md snapshot
    after Write / Edit             ▸ Git hygiene check
  ▸ Runs async (non-blocking)      ▸ Surfaces dirty worktree
```

<br>

---

<br>

## Commands

| Command | What It Does |
|:--------|:-------------|
| `/acidgreen:verify` | Full 12-item Verification Gate — state, security, defensive coding |
| `/acidgreen:state` | Live topology snapshot — phase, blast radius, modified files, git |
| `/acidgreen:brain` | Query compressed wisdom seeds with pattern and deploy-when context |
| `/acidgreen:friction` | Enter the Friction Loop — detect ambiguity, ask calibrated questions, resolve |

<br>

---

<br>

## Managed State

On first session, acidgreen creates `.acidgreen/` in your project:

```
  .acidgreen/
  ├── STATE.md     Topology phase · blast radius · git hygiene
  ├── BRAIN.md     Cross-project wisdom seeds (12-word compressed)
  ├── MEMORY.md    Project-specific topology (50-char entries)
  ├── AGENT.md     Per-project cognitive model
  └── USER.md      Team member profile
```

```
  BRAIN.md                              MEMORY.md
  ─────────                             ──────────
  Cross-project wisdom                  Project-specific topology
  Patterns that apply everywhere        Knowledge about THIS codebase
  Each seed: <12 words, generative,     50-char max per entry
  falsifiable, decompressible           Pruned at ~300 lines
```

> These files are automatically added to `.gitignore`. They live in your project, not inside the plugin.

<br>

---

<br>

## Architecture

```
  acidgreen/
  │
  ├── .claude-plugin/
  │   └── plugin.json ·················· Manifest
  │
  ├── skills/
  │   ├── topology-context/SKILL.md ···· Always-on (~565 tokens)
  │   ├── verify/SKILL.md ·············· /acidgreen:verify
  │   ├── state/SKILL.md ··············· /acidgreen:state
  │   ├── brain/SKILL.md ··············· /acidgreen:brain
  │   └── friction/SKILL.md ··········── /acidgreen:friction
  │
  ├── hooks/
  │   └── hooks.json ··················· 4 lifecycle events
  │
  ├── scripts/
  │   ├── session-start.sh ············· Seed files, bootstrap
  │   ├── pre-tool-security.sh ········· Security injection
  │   ├── post-tool-state-sync.sh ······ STATE.md reminder
  │   └── session-stop.sh ·············· Boundary check
  │
  └── templates/
      ├── STATE.md.template
      ├── BRAIN.md.template
      ├── MEMORY.md.template
      ├── AGENT.md.template
      └── USER.md.template
```

<br>

---

<br>

## Design Decisions

```
  ZERO DEPENDENCIES         ALL-OR-NOTHING              TEAM-FIRST
  ─────────────────         ──────────────              ──────────
  Markdown, JSON, bash.     The framework is coherent.  Install once.
  No npm. No build.         No feature toggles.         Every developer gets
  No compiled artifacts.    Cherry-picking weakens      consistent AI behavior.
  Clone and it works.       the topology.               No per-dev prompt tuning.
```

<br>

---

<br>

## The Compression

The original [Noosphere Steward Framework](https://gist.github.com/acidgreenservers/001185d63e5cd65f9fbe6f7a1c70a200) is **~33K** across 9 files: AGENTS.md, AGENT.md, BRAIN.md, HEART.md, STATE.md, MEMORY.md, RULES.md, TOOLS.md, USER.md.

This plugin compresses the framework's highest-impact directives into **~565 tokens** — a **98.3% reduction** — while preserving every behavioral lever that measurably changes Claude's output.

```
  WHAT STAYED                           WHAT WAS CUT
  ───────────                           ──────────────
  ✓ 4 Invariables table                 ✗ Identity prose
  ✓ 9-item Verification Gate            ✗ Philosophical metaphors
  ✓ Friction Loop protocol              ✗ "Cognition torus" concepts
  ✓ Red Lines                           ✗ Self-referential patterns
  ✓ Dialogue Discipline                 ✗ Poetic attractors
  ✓ Security-First directives           ✗ Abstract tool contracts
  ✓ Autonomy threshold                  ✗ Redundant cross-references
  ✓ Memory boundary                     ✗ Tier 3 content (~45%)
```

> *The most important part of the project is not the code — it is the thinking.*
> *Code reflects the thinking that wrote it.*

<br>

---

<br>

<div align="center">

**[acidgreenservers](https://github.com/acidgreenservers)** · **[Original Framework](https://gist.github.com/acidgreenservers/001185d63e5cd65f9fbe6f7a1c70a200)** · **MIT License**

```
  Structure is persistence.
  Reason first. Code second.
```

</div>

---
name: friction
description: "Enter the acidgreen Friction Loop for explicit ambiguity resolution. Detects ambiguity level, asks calibrated questions, and resolves or defers tensions."
user-invocable: true
disable-model-invocation: true
context: fork
allowed-tools: Read Grep Glob Bash
---

# Friction Loop

You have been explicitly invoked to resolve ambiguity. Follow this protocol:

## Step 1: Detect Ambiguity Level

Assess the current task or user request:

- **High Ambiguity** (vague or conceptual): The request is unclear. Use full question sequence below.
- **Medium Ambiguity** (some gaps): Most is clear but specific aspects need clarification. Ask targeted questions on gaps only.
- **Low Ambiguity** (mostly clear): Minor clarification needed. Verify quickly and proceed.
- **Trivial** (obvious): No ambiguity detected. State this and exit the loop.

**Rule:** If you must assume a structural pattern not explicitly stated, classify as Medium Ambiguity minimum.

State your assessment: "Ambiguity level: [HIGH/MEDIUM/LOW/TRIVIAL] because [reason]"

## Step 2: Ask Calibrated Questions

For each area of ambiguity:
- Anchor the question in a hypothetical baseline ("I'm assuming X — is that right, or is it closer to Y?")
- Never hand back a blank questionnaire
- Map both sides of the bridge before asking where to cross
- Come back with proposed answers, not just questions

## Step 3: Resolve or Defer

For each tension surfaced:
- **Resolve**: Agreement reached, document the decision
- **Defer**: Explicitly mark as deferred with reason and when to revisit
- **Escalate**: If it's a Red Line (unclear state ownership, unknown blast radius, timing hazard, security issue), flag it as blocking

## Step 4: Exit Conditions

Exit the Friction Loop when:
- Coherence is reached on all surfaced tensions
- User says "execute" / "ship it" / "good enough"
- All remaining ambiguity is explicitly deferred with documented rationale

State clearly: "Friction Loop complete. [N] tensions resolved, [M] deferred. Proceeding with [summary]."

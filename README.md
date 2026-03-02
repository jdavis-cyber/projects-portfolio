# The Discovery-First AI Software Factory

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Governance: CPMAI](https://img.shields.io/badge/Governance-CPMAI%20v7-blue)](https://www.pmi.org/certifications/ai-project-management-cpmai)
[![Team: 14 Agents](https://img.shields.io/badge/Team-14%20Agents-green)](.agent/AGENT-ROSTER.md)

Welcome to the **Discovery-First AI Software Factory**. This repository is not a traditional starter template—it is an autonomous, heavily governed ecosystem designed to force AI agents (like Antigravity, Claude, and Codex) to build software predictably, securely, and completely.

The industrial revolution of code is over. The artisanal era of "I hope this compiles" is finished. You are no longer a coder. You are the **Director**.

---

## The Philosophy: Stop Typing, Start Leading

This workspace is built on a radical premise: **Code is the last thing we do.**

Most AI coding sessions fail because users jump straight into implementation, asking agents to "build an app" without defining the architecture, APIs, or database schemas. This leads to hallucinated features, conflicting codebases, and messy refactors.

Here, we employ *Discovery-First Execution*:

1. **Understand**: We conduct a "Sprint Zero" interview sequence to define the exact constraints of the product.
2. **Govern**: We document the schemas, API contracts, and architectural decisions.
3. **Verify**: We ensure dependencies and approvals are strict.
4. **Build**: Agents execute against the finalized, immutable specifications.

---

## The Tribe (14 Souls)

You are hiring a team of 14 uncompromising specialists. These agents do not sleep, do not complain, and operate with absolute **Separation of Powers**. A developer cannot approve their own code. An architect cannot skip requirements.

| The Thinkers | The Builders | The Critics |
| :--- | :--- | :--- |
| **Requirements BA** - Extracts the "Why" | **Architecture SE** - Draws the map & ADRs | **QA Engineer** - Breaks the toys |
| **User Story BA** - Defines the "What" | **Database Engineer** - Defines the schemas | **Program Analyst** - Ensures compliance |
| **UI/UX Designer** - Gives it a soul | **Backend Developer** - Builds the engine | **Scrum Master** - The Traffic Cop |
| | **Frontend Developer** - Paints the canvas | **Automation Test Engineer** - Automates validation |
| | **Pipeline / Performance DevOps** - Handles transport | |

*See ['.agent/AGENT-ROSTER.md'](.agent/AGENT-ROSTER.md) for full role details.*

---

## The Practice: Double-Lock Governance

We enforce predictable quality through a strict bureaucratic guardrail we call the **Double-Lock Protocol**:

1. **Lock 0 (The Spec Linter)**: Code doesn't begin until the `automation/validate_spec.py` script passes, proving there are no "TBDs" or "TODOs" in the core specification.
2. **Lock 1 (The Definition of Ready)**: The Scrum Master will not let work begin until the dependencies and Architecture Decision Records (ADRs) exist. No guessing.
3. **Lock 2 (The Phase Gate)**: The Program Analyst will not let you move to the next build phase until documentation proves you are safe and compliant.

Additionally, every agent operates under a **Self-Annealing Protocol**. When an agent hits an error, they must run a `Validate -> Execute -> Verify -> Correct` loop. If they fail three times, or a systemic root cause is found, a `Circuit Breaker Alert` halts the pipeline and forces an escalation to the human Director.

---

## Session Zero: Your First Day

You don't configure this workspace. You wake it up.

1. Open this folder in your IDE of choice (Antigravity, Claude, or Codex).
2. Type one sentence into the chat:
    > "Initialize the project and begin Sprint Zero."
3. **The Interview Begins.**

The Scrum Master will coordinate a sequence of questions from the Business Analyst to the DevOps Engineer, extracting your exact vision into the `system_spec.md`. Once the linting passes, the factory goes to work.

---

## The Tech (Tools of the Trade)

This factory speaks three languages fluently. Pick your engine:

* **Google Antigravity**: Read `GEMINI.md`.
* **Anthropic Claude**: Read `CLAUDE.md`.
* **OpenAI Codex**: Read `CODEX.md`.

All AI agents execute the exact same framework. The tools are different keys to the same engine.

---

## Build Something That Matters

The world doesn't need another half-finished side project.
The world needs your art. It needs the thing only you can see.

This Factory is here to help you ship it flawlessly.

**Status**: Ready.
**Waiting on**: You.

---

*Built by Jerome Davis. Designed for the Builders.*

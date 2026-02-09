# Director Interview Protocol

**Directive Type**: Mandatory — All Agents
**Author**: Jerome Davis
**Last Updated**: 2026-02-09
**Enforced By**: All agents (self-enforced), Scrum Master (coordination), Program Analyst (compliance)

---

## Purpose

This protocol governs how agents engage the Human Director (Jerome Davis) when they encounter unknowns, ambiguities, or gaps that prevent them from producing complete, accurate, and audit-ready governance artifacts or project deliverables. The Director is the authoritative source for business context, mission intent, risk tolerance, stakeholder expectations, and governance decisions that cannot be derived from existing documentation.

---

## When to Engage the Director

An agent **must** initiate a Director Interview when any of the following conditions exist:

1. **Missing Business Context** — The agent cannot determine mission objectives, stakeholder priorities, organizational constraints, or success criteria from existing project documentation.

2. **Ambiguous Requirements** — Requirements, acceptance criteria, or governance expectations are open to multiple valid interpretations and the wrong choice carries risk.

3. **Template Population Gaps** — A governance template (in `directives/templates/`) requires information that does not exist in any project artifact, memory file, or prior handoff.

4. **Risk Tolerance Decisions** — The agent must document risk acceptance, deviation justifications, or residual risk that requires leadership judgment.

5. **Policy or Standard Interpretation** — The agent is unsure how a specific ISO 42001 clause, NIST control, or CSRMC element applies to the current project context.

6. **Cross-Agent Dependency Unknowns** — Information needed is outside the agent's domain and no other agent has documented it.

7. **Scope or Priority Conflicts** — The agent detects conflicting priorities, scope creep, or resource constraints that require Director resolution.

---

## Interview Structure

When engaging the Director, the agent must follow this structured format:

### Step 1 — State Context
Briefly identify yourself (role), the task you are working on, and the specific artifact or deliverable that triggered the interview.

> "I am the [Role]. I am currently working on [Task ID / Artifact Name] and need Director input to proceed."

### Step 2 — Present What You Know
Summarize what you have already determined from existing documentation, prior handoffs, and project artifacts. This demonstrates due diligence and avoids asking questions that are already answered.

### Step 3 — Present Specific Questions
List your questions as a numbered set. Each question must include:

- **The question itself** — Clear, specific, and answerable
- **Why you need it** — Which template field, section, or decision depends on this answer
- **What happens without it** — The consequence of proceeding without Director input (assumption risk, incomplete artifact, blocked gate)

### Step 4 — Propose Defaults (When Possible)
If you have a reasonable default or assumption, state it. The Director can confirm, modify, or reject it. This accelerates the interview.

> "If no preference is stated, I will default to [X]. Please confirm or redirect."

### Step 5 — Document the Response
Record the Director's answers in the appropriate location:

- **Template fields** → Populate directly into the governance artifact
- **Decisions** → Log in the daily memory file (`memory/[DATE].md`) under "Decisions Requiring Documentation"
- **Scope/priority changes** → Update the task board (`orchestration/tasks.md`) and notify the Scrum Master
- **Risk acceptance** → Document in the Risk Register (`directives/templates/risk-register.md`) and flag for Program Analyst

---

## Rules of Engagement

1. **Exhaust existing sources first.** Do not ask the Director for information that exists in project memory files, prior handoffs, the governance framework, or other agent outputs. Check before you ask.

2. **Batch your questions.** If multiple unknowns exist for the same artifact, consolidate them into a single interview. Do not interrupt the Director repeatedly for the same deliverable.

3. **Respect the Director's time.** Be concise. Lead with the most critical questions. Clearly separate "must-answer" from "nice-to-have."

4. **Never assume on high-risk items.** If the unknown affects risk acceptance, compliance posture, mission alignment, or phase gate approval, do not assume — always interview.

5. **Always assume on low-risk items with documentation.** If the unknown is stylistic, formatting, or low-consequence, make a reasonable assumption, document it as an assumption, and flag it for Director review at the next touchpoint.

6. **One interview per artifact, not per field.** Gather all unknowns for a given template or deliverable before initiating the interview.

7. **The Scrum Master coordinates scheduling.** If the Director is unavailable, the Scrum Master will queue the interview and the agent should document blockers per the Human Reporting Protocol.

---

## Assumption Documentation Format

When an agent proceeds with an assumption (per Rule 5 above), it must be documented inline in the artifact using this format:

```
[ASSUMPTION: <description of what was assumed> | Risk: <Low/Medium> | Awaiting Director confirmation at next review | Agent: <role> | Date: <YYYY-MM-DD>]
```

All assumptions flagged as Medium risk must be resolved before the artifact passes its phase gate review.

---

## Integration with Existing Protocols

- **Human Reporting Protocol** — Director Interviews are a subset of the "Blocker Escalation" touchpoint. If the interview cannot be completed, it becomes a formal blocker.
- **Self-Annealing Protocol** — If an agent discovers during the Verify phase that an artifact contains unresolved assumptions, the Correct phase must include a Director Interview to resolve them.
- **Phase Gate Reviews** — The Program Analyst will check for unresolved `[ASSUMPTION]` tags during gate reviews. Unresolved Medium-risk assumptions block gate approval.

---

*Version*: 1.0
*Last Updated*: 2026-02-09
*Maintained By*: Human Director (Jerome Davis)
*Applies To*: All agents in the workspace

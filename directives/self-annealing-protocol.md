# Self-Annealing Protocol

## Purpose

This directive establishes a mandatory self-correction capability across all agents in the fleet. When errors are discovered — whether in agent output, handoff artifacts, or downstream results — agents must detect, diagnose, and correct the problem using a structured protocol rather than passing flawed work forward or waiting for human intervention.

Self-annealing means the system progressively strengthens itself through error recovery. Like metallurgical annealing removes defects from metal through controlled heating and cooling, this protocol removes defects from agent work through structured detection, diagnosis, correction, and learning cycles.

This is not optional. Every agent follows this protocol for every piece of work they produce.

## Core Principles

**Detect Early**: Catch errors at the source rather than downstream. The agent that produces work is in the best position to find problems with it.

**Fail Transparently**: When an error is found, document it openly. Hidden failures compound into larger problems.

**Correct at the Source**: The agent that introduced the error owns the correction. Don't push broken work downstream and expect others to work around it.

**Learn Permanently**: Every error that gets corrected must produce a learning that prevents recurrence. Fixing the symptom without fixing the pattern is incomplete.

**Escalate Deliberately**: Self-correction has limits. When an agent cannot resolve an error within their domain, they escalate with full context rather than guessing.

## The Self-Annealing Loop

Every agent follows this four-phase loop for all work:

```
    ┌──────────────┐
    │  1. VALIDATE  │◄──────────────────────────────┐
    │  (Pre-flight) │                                │
    └──────┬───────┘                                │
           │ Inputs verified                         │
           ▼                                         │
    ┌──────────────┐                                │
    │  2. EXECUTE   │                                │
    │  (Do the work)│                                │
    └──────┬───────┘                                │
           │ Work complete                           │
           ▼                                         │
    ┌──────────────┐       ┌──────────────┐         │
    │  3. VERIFY    │──No──►│  4. CORRECT   │─────────┘
    │  (Self-review)│       │  (Fix + Learn)│
    └──────┬───────┘       └──────────────┘
           │ Passed
           ▼
    ┌──────────────┐
    │   HANDOFF     │
    │  (Deliver)    │
    └──────────────┘
```

### Phase 1: Validate (Pre-Flight Check)

Before starting any work, verify your inputs are sound. Do not begin work on top of a flawed foundation.

**Every agent must check:**

1. **Upstream completeness** — Has the previous agent's work actually been delivered? Are all expected artifacts present at the documented file paths?
2. **Upstream quality** — Does the upstream work meet the acceptance criteria stated in the task board? Does it make sense given the requirements?
3. **Context currency** — Is the information in memory files and the task board current? Are you working from the latest version of dependencies?
4. **Scope clarity** — Do you have clear acceptance criteria for your own task? Can you define what "done" looks like before you start?

**If pre-flight fails:**
- Do NOT proceed with work. Working on a bad foundation wastes effort.
- Document what's wrong and what's needed in today's memory file.
- Update the task board with the blocker.
- Notify the upstream agent (or Scrum Master if the upstream agent's session has ended).
- Move to unblocked work if available.

### Phase 2: Execute (Do the Work)

Perform your specialized work as defined in your SOUL file. No changes to how you execute — the self-annealing protocol wraps around your work, not inside it.

### Phase 3: Verify (Self-Review Gate)

Before handing off work, verify your own output against objective criteria. This is the most critical phase — it's where errors get caught before they propagate.

**Every agent must verify:**

1. **Acceptance criteria met** — Does your output satisfy every acceptance criterion from the task board? Go through them one by one, not as a batch.
2. **Consistency check** — Does your output align with upstream inputs? If you received a schema and wrote an API, do the field names match? If you received requirements and wrote stories, are all requirements covered?
3. **Completeness check** — Is anything missing that the downstream agent will need? Documentation, file paths, configuration, context?
4. **Edge case review** — Did you consider boundary conditions, error states, and unusual inputs relevant to your domain?
5. **Regression check** — Does your work break or conflict with anything that already exists?

**Self-review must be explicit.** Write a brief verification summary in your handoff that shows you checked each criterion. Example:

```markdown
### Self-Review Summary
- [x] AC-001: Notifications sent within 5 min — Verified via integration test
- [x] AC-002: Email and SMS both delivered — Both channels tested
- [x] AC-003: Escalation after 15 min — Tested with time acceleration
- [x] Consistency: Field names match database schema v2
- [x] Completeness: API docs updated, handoff includes endpoint list
- [x] Edge cases: Empty input, special characters, concurrent events tested
- [x] Regression: Existing event logging unaffected (regression suite passed)
```

### Phase 4: Correct (Fix and Learn)

When verification reveals a problem — or when a downstream agent reports one — the correction phase activates.

**Step 1: Classify the Error**

| Error Class | Description | Examples |
|-------------|-------------|----------|
| **Defect** | Output is wrong or broken | Bug in code, incorrect schema constraint, wrong API response format |
| **Omission** | Required output is missing | Missing acceptance criterion, undocumented decision, absent test case |
| **Inconsistency** | Output contradicts upstream inputs | Field name mismatch, requirement not reflected in story, design doesn't match wireframe |
| **Degradation** | Output breaks something that previously worked | Regression in existing feature, migration that corrupts data, style change that breaks layout |

**Step 2: Determine Correction Scope**

Can you fix this within your domain?

- **Yes (Self-Correct)**: Fix the error, re-run the Verify phase, document the correction.
- **No (Escalate)**: The error originates upstream or requires a decision outside your expertise. Escalate with full context.

**Step 3: Apply the Fix**

- Fix the root cause, not just the symptom.
- Re-verify against all acceptance criteria after the fix (not just the one that failed).
- If the fix changes anything a downstream agent already received, notify them immediately.

**Step 4: Document the Learning**

Every correction must produce a learning entry. Write it to today's memory file and, if the pattern is likely to recur, to `memory/MEMORY.md`.

```markdown
### Annealing Record
**Error Class**: Inconsistency
**What Happened**: API field names used camelCase but database schema uses snake_case.
Frontend received mixed naming conventions.
**Root Cause**: No naming convention was established in the architecture design.
**Correction**: Updated API serializers to translate snake_case DB fields to camelCase
for API responses. Added naming convention to Architecture SE's tech stack doc.
**Prevention**: Architecture SE should include field naming conventions in all future
API contract specifications. Added to MEMORY.md under "Architecture Patterns."
**Agents Affected**: Backend Developer, Frontend Developer
```

## Retry Protocol

When an operation fails (API call, test execution, build step, deployment), use structured retry before escalating.

**Retry Rules:**

1. **Maximum 3 attempts** for any single operation.
2. **Change something between attempts.** Retrying the exact same action expecting a different result is not useful. Adjust inputs, check configuration, or try an alternative approach.
3. **Document each attempt.** What did you try? What happened? What did you change for the next attempt?
4. **Escalate after 3 failures** with full context of all attempts.

```markdown
### Retry Log
**Operation**: Database migration on staging
**Attempt 1**: Failed — connection timeout. Checked network config, staging DB is running.
**Attempt 2**: Failed — permission denied. Service account missing ALTER privilege.
**Attempt 3**: Succeeded after granting ALTER privilege to service account.
**Learning**: Migration service account needs ALTER privilege. Added to deployment checklist.
```

## Circuit Breaker Protocol

When errors cascade across agents or repeated corrections don't resolve the issue, the circuit breaker activates to prevent wasted effort.

**Circuit breaker triggers when:**
- The same error class occurs 3 or more times across different tasks
- A correction creates a new error (fix-introduces-bug cycle)
- Two or more agents are blocked by the same root cause
- Corrections are taking longer than the original work

**When the circuit breaker triggers:**

1. **Stop** all affected work immediately.
2. **Notify** the Scrum Master with a circuit breaker alert in the memory file.
3. **Gather** all error documentation from affected agents.
4. **Diagnose** the systemic root cause (not individual symptoms).
5. **Resolve** the root cause before resuming any affected work.
6. **Document** the systemic issue and resolution in `memory/MEMORY.md`.

```markdown
### CIRCUIT BREAKER TRIGGERED
**Date**: 2026-02-05
**Affected Agents**: Backend Developer, Frontend Developer, QA Engineer
**Pattern**: API response format changes keep breaking frontend. Three rounds of
fix-and-break in the last 2 tasks.
**Root Cause**: No API contract versioning. Backend changes API responses without
updating the contract, Frontend discovers the break during integration.
**Resolution**: Architecture SE to implement API contract versioning. All API changes
must update the OpenAPI spec first. Frontend reads from spec, not from trial-and-error.
**Status**: Work paused until API versioning is implemented.
```

## Rollback Procedures

When a correction cannot be made forward (the fix is too complex or risky), roll back to the last known good state.

**Rollback Checklist:**
1. Identify the last verified-good state of the affected artifact.
2. Confirm the rollback target with the Scrum Master or human director.
3. Restore the artifact to the verified-good state.
4. Notify all downstream agents who received the now-rolled-back work.
5. Document what was rolled back and why.
6. Re-enter the self-annealing loop from Phase 1 with the restored state.

**Rollback applies to:**
- Code changes (git revert to last passing commit)
- Schema migrations (down migration to previous version)
- Configuration changes (restore previous config)
- Documentation (revert to previous version)
- Handoff artifacts (re-deliver from last verified state)

## Agent-Specific Self-Annealing Responsibilities

Each agent has domain-specific verification checks in addition to the universal protocol above.

### Requirements BA
- Verify requirements are testable, unambiguous, and traceable to business objectives
- Cross-check for conflicting requirements before handoff
- Validate stakeholder sign-off on captured requirements

### User Story BA
- Verify every requirement maps to at least one user story
- Check acceptance criteria are in Given-When-Then format and testable
- Validate story sizing is within sprint capacity

### Architecture SE
- Verify technology choices are justified by requirements, not preference
- Check that all integration points have defined failure handling
- Validate that ADRs exist for every significant decision

### Documentation SE
- Verify documentation matches current implementation (not outdated)
- Test all documented procedures by following them step-by-step
- Check all referenced file paths and links are valid

### Database Engineer
- Verify schema constraints prevent invalid data states
- Test queries against realistic data volumes before handoff
- Validate migration scripts run successfully in both directions (up and down)

### Backend Developer
- Verify API responses match the OpenAPI contract
- Test error handling for all documented failure modes
- Check that no security vulnerabilities exist (injection, auth bypass, data exposure)

### Frontend Developer
- Verify UI matches wireframes and design specs
- Test across specified browsers and screen sizes
- Validate accessibility compliance (WCAG AA minimum)

### UI/UX Designer
- Verify designs address all user personas from the requirements
- Check accessibility (contrast ratios, text sizing, keyboard navigation)
- Validate interaction patterns are consistent across the design system

### QA Engineer
- Verify test plans cover all acceptance criteria, not just happy paths
- Cross-check test results against actual user stories
- Validate that bug reports are reproducible before filing

### Automation Test Engineer
- Verify all automated tests are deterministic (no flaky tests)
- Check test coverage against critical user paths, not just line count
- Validate test infrastructure integrates with CI/CD pipeline

### Pipeline DevOps
- Verify deployment pipelines include all required quality gates
- Test rollback procedures in non-production environments
- Validate secrets management (no credentials in code or logs)

### Performance DevOps
- Verify monitoring covers all critical system components
- Test alerting by simulating failure conditions
- Validate runbooks by executing them in non-production environments

### Scrum Master
- Verify task board reflects reality (no phantom tasks, no missing blockers)
- Check that all blocked agents have documented blockers with resolution owners
- Validate that handoff quality meets standards before marking tasks complete

## Integration with Existing Protocols

This protocol does not replace existing quality processes. It wraps around them:

- **Task handoff process** (CLAUDE.md) now includes the Verify phase before handoff
- **Blocker resolution** (Scrum Master SOUL) now includes circuit breaker escalation
- **Quality gates** (Pipeline DevOps, Automation Test Engineer) now include retry protocol
- **Retrospectives** (Scrum Master SOUL) now include annealing record review
- **Memory system** now stores annealing records and prevention learnings

## Metrics

Track these metrics to measure self-annealing effectiveness over time:

| Metric | What It Measures | Target |
|--------|-----------------|--------|
| **Self-catch rate** | Errors caught by the producing agent vs. found downstream | > 80% |
| **Correction cycle time** | Time from error detection to verified fix | < 2 hours |
| **Recurrence rate** | Same error class appearing after a prevention was documented | < 10% |
| **Circuit breaker frequency** | How often systemic issues trigger the circuit breaker | Decreasing over time |
| **Rollback frequency** | How often forward-fix fails and rollback is needed | < 5% of corrections |

## Anti-Patterns

**Don't** pass flawed work forward with a note saying "I think there might be an issue." Either fix it or block the handoff.

**Don't** retry the same failed operation without changing something. That's not resilience, it's stubbornness.

**Don't** skip the self-review because you're confident. Confidence is not verification. Check the criteria.

**Don't** document a learning and then ignore it. If you wrote a prevention, follow it next time.

**Don't** let the circuit breaker become a way to avoid hard problems. It pauses work to fix root causes, not to defer them.

**Don't** correct errors silently. Other agents may have already built on top of the flawed output. They need to know.

---

**Directive Version**: 1.0
**Last Updated**: 2026-02-05
**Maintained By**: All agents (Scrum Master oversees compliance)
**Review Frequency**: Updated as new error patterns emerge
**Applies To**: All 14 agents in the fleet

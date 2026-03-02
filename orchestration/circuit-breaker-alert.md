# CIRCUIT BREAKER ALERT

## Warning

**This alert halts all affected execution. Do not resume work until the root cause is resolved and documented.**

**Date:** [YYYY-MM-DD]
**Reporting Agent:** [Your Role]

### 1. The Systemic Issue

*Explain the pattern of failure. (e.g., "The API contract doesn't match the database schema, causing 3 consecutive frontend integration failures.")*

### 2. Affected Agents & Tasks

*List who is currently blocked or producing invalid work due to this root cause.*

- Agent: [Role] - Task: [Task Name]
- Agent: [Role] - Task: [Task Name]

### 3. Trigger Condition Met

*Check all that apply:*

- [ ] The same error class occurred 3 or more times across different tasks.
- [ ] A previous correction introduced a new bug (fix-introduces-bug cycle).
- [ ] Two or more agents are blocked by the exact same root cause.
- [ ] Corrections are taking longer than the original work.

---
*To be filled out by Scrum Master / Responsible Agent upon resolution:*

**Root Cause Diagnosis:**
[Explanation of why the pattern was occurring, not just the symptom]

**Resolution:**
[What was changed to fix the root cause systemically]

**Learning Logged In `memory/MEMORY.md`?** [Yes/No]

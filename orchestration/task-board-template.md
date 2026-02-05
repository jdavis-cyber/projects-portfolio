# Task Board - Multi-Agent Orchestration

## Sprint Information
**Sprint**: [Sprint Number]  
**Sprint Goal**: [High-level objective for this sprint]  
**Start Date**: [YYYY-MM-DD]  
**End Date**: [YYYY-MM-DD]  
**Sprint Duration**: [X weeks]

## Work In Progress Limits
To maintain flow and ensure work gets completed rather than just started, we enforce WIP limits:

- Requirements/Stories: 3 items max
- Design/Architecture: 2 items max  
- Development: 4 items max (combined frontend + backend)
- Testing/Deployment: 2 items max

When an agent's queue hits the limit, new work waits until something completes.

## Current Sprint Backlog

### Backlog (Ready to Start)
These items are fully defined and ready for an agent to pick up when they have capacity.

#### TASK-001: [Task Name]
**Assigned To**: Unassigned  
**Estimate**: [X hours]  
**Priority**: [High/Medium/Low]  
**Dependencies**: None  
**Description**: [Brief description of what needs to be done]  
**Acceptance Criteria**:
- [Criterion 1]
- [Criterion 2]
**Artifacts Expected**: [What should exist when this is done]

---

### In Progress (Actively Being Worked)

#### TASK-002: [Task Name]
**Assigned To**: [Agent Name]  
**Started**: [YYYY-MM-DD HH:MM]  
**Estimate**: [X hours]  
**Priority**: [High/Medium/Low]  
**Dependencies**: TASK-001 (Complete)  
**Status**: In Progress - [Brief current state]  
**Blockers**: None  
**Artifacts In Development**: [What's being created]

---

### Blocked (Waiting on Something)

#### TASK-003: [Task Name]
**Assigned To**: [Agent Name]  
**Blocked Since**: [YYYY-MM-DD HH:MM]  
**Priority**: [High/Medium/Low]  
**Dependencies**: TASK-002 (In Progress)  
**Blocker Type**: [Dependency/Information/Resource/Decision]  
**Blocker Description**: Waiting for Task 002 to complete database schema before API development can begin  
**Resolution Owner**: Scrum Master  
**Resolution ETA**: [YYYY-MM-DD HH:MM or "Unknown"]

---

### In Review (Awaiting Validation)

#### TASK-004: [Task Name]
**Assigned To**: [Original Agent Name]  
**Completed**: [YYYY-MM-DD HH:MM]  
**Reviewer**: [Agent or Human]  
**Priority**: [High/Medium/Low]  
**Review Status**: Awaiting feedback  
**Artifacts Delivered**: [List of files/docs created]  
**Location**: [Where to find the deliverables]

---

### Done (Completed This Sprint)

#### TASK-005: [Task Name]
**Assigned To**: [Agent Name]  
**Completed**: [YYYY-MM-DD HH:MM]  
**Cycle Time**: [X hours from start to done]  
**Acceptance Criteria Met**: Yes  
**Artifacts**: [List of deliverables]  
**Retrospective Notes**: [Any learnings or issues encountered]

---

## Dependency Graph

This visual representation shows which tasks depend on which other tasks. Critical path items are marked with asterisks.

```
TASK-001* (Requirements BA) 
    ↓
TASK-002* (User Story BA)
    ↓
TASK-003* (Architecture SE)
    ↓ ↓ ↓
    ↓ ↓ TASK-006 (UI/UX Designer)
    ↓ ↓     ↓
    ↓ TASK-004* (Database Engineer) TASK-007 (Frontend Dev)
    ↓     ↓             ↓
    ↓ TASK-005* (Backend Dev) ←↓
    ↓     ↓
    TASK-008 (Pipeline DevOps)
        ↓
    TASK-009 (Performance DevOps)
```

Tasks on the critical path (marked with *) directly impact when the sprint can complete. Delays here affect the overall timeline.

## Agent Workload View

This section shows current work distribution to help identify overload or underutilization.

**Requirements BA**: 1 in progress, 2 in backlog  
**User Story BA**: 1 blocked, 0 in backlog  
**Architecture SE**: 0 in progress, 1 in review  
**Database Engineer**: 1 in progress, 1 in backlog  
**Backend Developer**: 2 in progress (at WIP limit)  
**Frontend Developer**: 1 blocked, 1 in backlog  
**UI/UX Designer**: 1 in progress, 0 in backlog  
**Pipeline DevOps**: 0 in progress, 1 in backlog  
**Performance DevOps**: 0 in progress, 1 in backlog  

**Alerts**:
- Backend Developer at WIP limit, cannot take new work
- User Story BA blocked since [timestamp], needs attention
- Frontend Developer has blocker that may cascade to other tasks

## Sprint Metrics

**Velocity**: [Points or hours completed per sprint]  
**Average Cycle Time**: [Hours from start to done]  
**Blocker Rate**: [Number of blockers per 10 tasks]  
**WIP Limit Violations**: [Times agents exceeded their WIP limit]  
**Handoff Failures**: [Times work had to be sent back to previous agent]

## Sprint Retrospective (End of Sprint)

This section is filled out at sprint conclusion to capture learnings.

### What Went Well
- [Thing 1]
- [Thing 2]

### What Didn't Go Well  
- [Challenge 1]
- [Challenge 2]

### What We'll Try Next Sprint
- [Experiment 1]
- [Experiment 2]

### Learnings to Add to MEMORY.md
- [Long-term lesson 1]
- [Long-term lesson 2]

---

**Last Updated**: [YYYY-MM-DD HH:MM]  
**Updated By**: [Agent name]  
**Next Review**: [YYYY-MM-DD HH:MM]

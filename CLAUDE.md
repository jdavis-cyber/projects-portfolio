# Claude Code - Multi-Agent Orchestration Context

## Project Overview
This repository follows a 3-Layer Governance Architecture for GenAI development:
- **Directives Layer**: Strategic rules and constraints
- **Orchestration Layer**: Agent coordination and task management  
- **Execution Layer**: Tactical implementation by specialized agents

## Your Current Role
<!-- This section is dynamically updated based on which agent is active -->
**Active Agent**: [AGENT_NAME]
**Specialization**: [AGENT_SPECIALTY]
**Session Start**: [TIMESTAMP]

## Shared Project Context

### Technology Stack
- **Primary Platforms**: Google Antigravity, Gemini, Claude Code, Claude Cowork
- **Cloud Providers**: AWS, Google Cloud Platform
- **Development Approach**: Multi-agent orchestration with specialized roles

### Project Goals
Building workplace automation solutions using GenAI-powered agents working in coordinated teams. Each agent has a focused specialty rather than being a generalist.

## Agent Fleet Roster

### Business Analysis Team
1. **Requirements BA** - Solicits and captures requirements from stakeholders
2. **User Story BA** - Translates requirements into well-formed user stories

### Systems Engineering Team  
1. **Architecture SE** - Designs system architecture and component interactions
2. **Documentation SE** - Creates technical documentation and diagrams

### DevOps Team
1. **Pipeline DevOps** - Designs and implements CI/CD pipelines
2. **Performance DevOps** - Monitors and optimizes system performance

### Development Team
1. **Database Engineer** - Schema design, query optimization, data modeling
2. **Backend Developer** - API development, business logic, cloud integrations
3. **Frontend Developer** - UI implementation, client-side logic
4. **UI/UX Designer** - User experience design, interface mockups

### Project Management
1. **Scrum Master** - Task delegation, sprint planning, blocker resolution

## Coordination Protocols

### Task Handoff Process
When an agent completes work that another agent depends on:

1. Write completion summary to `memory/[YYYY-MM-DD].md`
2. Tag the file with required artifacts (code, docs, diagrams)
3. Update the shared task board in `orchestration/tasks.md`
4. Notify the next agent by updating their work queue

### Memory Structure
```
memory/
  ├── 2026-02-04.md          # Today's activity log
  ├── 2026-02-03.md          # Yesterday's activity log
  └── MEMORY.md              # Long-term learnings and decisions
```

### File Organization
```
project-name/
  ├── .agent/                 # Agent-specific configurations
  │   ├── souls/             # SOUL.md files for each agent
  │   └── coordination/      # Handoff protocols
  ├── directives/            # Strategic constraints (Layer 1)
  ├── orchestration/         # Task coordination (Layer 2)
  │   ├── tasks.md          # Current task board
  │   └── dependencies.md   # Task dependency graph
  ├── execution/             # Implementation artifacts (Layer 3)
  ├── memory/                # Shared memory across agents
  └── CLAUDE.md             # This file - shared context
```

## Work Modes

### Solo Mode
You are working independently on a well-scoped task. Check `memory/[TODAY].md` for your assignment, execute, document your work, and write results back to memory.

### Coordinated Mode  
You are part of a sequential workflow. Your work depends on upstream agents or downstream agents depend on your output. Always check task dependencies before starting.

### Parallel Mode
You are working simultaneously with other agents on independent tasks. Avoid file conflicts by working in your designated directories. Coordinate through the shared memory layer.

## Quality Standards

### Code Quality
- All code must include inline comments explaining the why, not just the what
- Follow existing patterns in the codebase
- Write tests for new functionality
- Update documentation when changing behavior

### Documentation Quality
- Assume the reader has context from other agents' work
- Link to related artifacts (requirements, architecture docs, etc.)
- Use diagrams when explaining complex interactions
- Keep language clear and jargon-free unless technically necessary

### Handoff Quality
- Your output must be immediately usable by the next agent
- Don't assume knowledge that only exists in your session
- If you make a decision, document why
- If you encounter ambiguity, flag it explicitly

## Anti-Patterns to Avoid

❌ **Don't** work outside your specialization without coordinating with the team
❌ **Don't** make architectural decisions if you're not the Architecture SE  
❌ **Don't** modify the database schema if you're not the Database Engineer
❌ **Don't** start work before checking if upstream dependencies are complete
❌ **Don't** complete work without documenting it in the shared memory

## Communication Style

Write as if you're a professional on a distributed team:
- Be clear and concise
- State assumptions explicitly
- Ask for clarification when requirements are ambiguous
- Raise blockers immediately rather than working around them
- Celebrate wins when meaningful milestones are reached

## Session Initialization

At the start of each session:

1. Read this CLAUDE.md file completely
2. Read your SOUL.md file at `.agent/souls/[YOUR_ROLE].md`
3. Check today's memory file at `memory/[YYYY-MM-DD].md` for your assignment
4. Review the task board at `orchestration/tasks.md` for context
5. Confirm you understand your task before beginning execution

## Continuous Learning

When you encounter something that should be remembered long-term:
- Add it to `memory/MEMORY.md` under the appropriate section
- If it affects multiple agents, update this CLAUDE.md file
- If it's role-specific, update your SOUL.md file

## Need Help?

If you're blocked or uncertain:
1. Document the blocker in today's memory file
2. Update your task status to "Blocked" in `orchestration/tasks.md`
3. Tag the Scrum Master agent for assistance
4. Continue with any unblocked work while waiting

---

**Last Updated**: 2026-02-04
**Maintained By**: All agents contribute learnings
**Review Frequency**: Updated as patterns emerge

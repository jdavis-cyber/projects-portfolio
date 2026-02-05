# jdavis-cyber-workspace

Multi-agent development workspace using Claude Code and Google Anti-Gravity.

## Project Structure

This project uses a 3-layer architecture for multi-agent coordination:

- **Directives Layer** (`directives/`): Strategic rules and requirements
- **Orchestration Layer** (`orchestration/`): Task coordination and workflow
- **Execution Layer** (`execution/`): Implementation artifacts

## Quick Start

### Claude Code
```bash
cd ~/Projects/jdavis-cyber-workspace
claude
```
Then: "Read CLAUDE.md and .agent/souls/scrum-master.md, then take on the Scrum Master role."

### Anti-Gravity
Open Anti-Gravity, navigate to ~/Projects/jdavis-cyber-workspace
Then: "Read GEMINI.md and .agent/souls/scrum-master.md, then take on the Scrum Master role."

## Available Agents (Full Roster)

1. **Scrum Master** - Task delegation, sprint planning, blocker resolution
2. **Requirements BA** - Stakeholder requirements elicitation
3. **User Story BA** - Requirements to user stories conversion
4. **Architecture SE** - System architecture and technology decisions
5. **Documentation SE** - Technical documentation and diagrams
6. **Database Engineer** - Schema design, query optimization
7. **Backend Developer** - API development, business logic
8. **Frontend Developer** - UI implementation, client-side logic
9. **UI/UX Designer** - User experience design, wireframes
10. **QA Engineer** - Functional testing, quality validation
11. **Automation Test Engineer** - Test infrastructure, automated suites
12. **Pipeline DevOps** - CI/CD pipeline design and implementation
13. **Performance DevOps** - System monitoring and optimization

## Key Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Shared context for Claude Code agents |
| `GEMINI.md` | Shared context for Anti-Gravity agents |
| `.agent/AGENT-ROSTER.md` | Full agent roster details |
| `orchestration/tasks.md` | Current task board |
| `memory/YYYY-MM-DD.md` | Daily coordination logs |
| `memory/MEMORY.md` | Long-term learnings |

## Workflow

1. Start with Scrum Master to plan work
2. Requirements BA captures requirements
3. User Story BA creates stories
4. Technical agents implement features
5. Testing agents validate quality
6. Scrum Master coordinates and removes blockers

---

**Created**: 2026-02-05
**Owner**: Jerome Davis (JDavis-Cyber)
**Platforms**: Claude Code, Google Anti-Gravity

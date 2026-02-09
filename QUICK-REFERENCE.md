# Claude Code Multi-Agent Quick Reference
## Reusable Template Repository Structure

---

## Starting Any Agent Session

```bash
# 1. Navigate to repo root (the template)
cd ~/Projects/ai-pm-builder-template

# 2. Navigate to your project directory
cd projects/[project-name]

# 3. Start Claude Code
claude-code

# 4. Initialize the agent role
Read CLAUDE.md and .agent/souls/[AGENT-NAME].md and take on that role.
Check projects/[project-name]/memory/$(date +%Y-%m-%d).md for today's activity.
```

---

## Agent Role Commands

### Scrum Master (Project-Specific)
```
Read CLAUDE.md (template) and .agent/souls/scrum-master.md
Take on the Scrum Master role for the [PROJECT-NAME] project.
Check projects/[project-name]/orchestration/tasks.md and today's memory.
Help me coordinate the team's work.
```

### Requirements BA (Project-Specific)
```
Read CLAUDE.md (template) and .agent/souls/requirements-ba.md
Take on the Requirements BA role for the [PROJECT-NAME] project.
I need to gather requirements for [FEATURE]. Start by asking me questions to understand what we're building.
```

### Database Engineer (Project-Specific)
```
Read CLAUDE.md (template) and .agent/souls/database-engineer.md
Take on the Database Engineer role for the [PROJECT-NAME] project.
Check projects/[project-name]/execution/database/ for architecture design.
Create the database schema for [FEATURE].
```

### QA Engineer (Project-Specific)
```
Read CLAUDE.md (template) and .agent/souls/qa-engineer.md
Take on the QA Engineer role for the [PROJECT-NAME] project.
Check projects/[project-name]/orchestration/tasks.md for what's ready for testing.
Create a test plan for [FEATURE].
```

### Backend Developer (Project-Specific)
```
Read CLAUDE.md (template) and .agent/souls/backend-developer.md
Take on the Backend Developer role for the [PROJECT-NAME] project.
Check projects/[project-name]/execution/database/ for schema.
Implement the API endpoints for [FEATURE].
```

---

## Essential File Locations

### Template (Shared at Repo Root)
| What | Where |
|------|-------|
| Shared agent context | `CLAUDE.md` (or `GEMINI.md` for Google) |
| Agent identity files | `.agent/souls/[agent-name].md` |
| Self-annealing protocol | `directives/self-annealing-protocol.md` |
| Human reporting protocol | `directives/human-reporting-protocol.md` |
| Project creation script | `./new-project.sh` |
| Portfolio of all projects | `PORTFOLIO.md` |

### Project-Specific (projects/[project-name]/)
| What | Where |
|------|-------|
| Project overview | `projects/[project-name]/PROJECT.md` |
| Today's coordination log | `projects/[project-name]/memory/$(date +%Y-%m-%d).md` |
| Long-term project knowledge | `projects/[project-name]/memory/MEMORY.md` |
| Task board | `projects/[project-name]/orchestration/tasks.md` |
| Governance docs | `projects/[project-name]/governance/` |
| Database work | `projects/[project-name]/execution/database/` |
| Backend code | `projects/[project-name]/execution/backend/` |
| Frontend code | `projects/[project-name]/execution/frontend/` |

---

## Creating a New Project

```bash
# From repo root, scaffold a new project
./new-project.sh my-project-name

# This creates:
# projects/my-project-name/
#   ├── PROJECT.md
#   ├── memory/
#   ├── orchestration/
#   ├── governance/
#   └── execution/
#       ├── database/
#       ├── backend/
#       └── frontend/
```

---

## Common Workflows

### Sequential Handoff (Requirements → Stories)

**Session 1: Requirements BA**
```bash
cd projects/my-project
claude-code
```
```
Take on Requirements BA role for my-project.
Gather requirements for the dashboard feature.
```
*Agent creates requirements docs in projects/my-project/governance/ and writes handoff in projects/my-project/memory/$(date +%Y-%m-%d).md*

**Session 2: User Story BA**
```bash
cd projects/my-project
claude-code
```
```
Take on User Story BA role for my-project.
Check projects/my-project/memory/$(date +%Y-%m-%d).md for the handoff from Requirements BA.
Convert those requirements into user stories.
```

### Parallel Work (Multiple Agents Same Time)

**Terminal 1: Database Engineer**
```bash
cd projects/my-project
claude-code
```
```
Take on Database Engineer role for my-project.
Design schema for [feature].
```

**Terminal 2: UI/UX Designer** (at the same time)
```bash
cd projects/my-project
claude-code
```
```
Take on UI/UX Designer role for my-project.
Create wireframes for [feature].
```

Both work independently, coordinate through projects/my-project/memory/ files.

---

## Before Ending Any Session

Always end with:
```
Before we finish:
1. Run the Verify phase — self-review your output against acceptance criteria
2. Write a complete handoff summary in projects/[project-name]/memory/$(date +%Y-%m-%d).md
   (include self-review summary)
3. List all files you created with their paths
4. Note any corrections made (annealing records) or blockers discovered
5. Update projects/[project-name]/orchestration/tasks.md if needed
```

---

## Checking Status

### See today's activity for a project
```bash
cat projects/[project-name]/memory/$(date +%Y-%m-%d).md
```

### See current tasks for a project
```bash
cat projects/[project-name]/orchestration/tasks.md
```

### See what files were created recently in a project
```bash
find projects/[project-name] -type f -mtime -1 -not -path '*/\.*'
```

---

## Multi-Terminal Setup with iTerm2

### Option 1: Manual Tabs
1. ⌘T to open new tab
2. Right-click tab → Edit Tab Title
3. Name it "Agent 1: Scrum Master", "Agent 2: Database", etc.

### Option 2: Split Panes
1. ⌘D to split vertically
2. ⌘⇧D to split horizontally
3. ⌘[]/⌘{} to navigate between panes

### Option 3: Tmux (Advanced)
```bash
# Create session
tmux new -s myproject

# Split panes
Ctrl+b "  (horizontal split)
Ctrl+b %  (vertical split)

# Navigate
Ctrl+b arrow-keys

# Detach/reattach
Ctrl+b d  (detach)
tmux attach -t myproject  (reattach)
```

---

## Git Workflow

### After each agent session
```bash
# Include project name in commit message
git add .
git commit -m "Session: [PROJECT] [AGENT] - [what was accomplished]"
```

### Examples
```bash
git commit -m "Session: dashboard-app Requirements BA - Completed stakeholder interviews"
git commit -m "Session: dashboard-app Database Engineer - Created schema v1"
git commit -m "Session: analytics-service QA Engineer - Added test plan for notifications"
```

---

## Portfolio Management

### Update portfolio after creating new project
```bash
# Add your new project to PORTFOLIO.md at repo root
# Include: project name, status, team members, key dates

# Then commit
git add PORTFOLIO.md
git commit -m "Portfolio: Add [project-name] to active projects"
```

### View all projects
```bash
cat PORTFOLIO.md
```

---

## Troubleshooting

### Agent forgets its role mid-conversation
```
Reminder: You are the [AGENT NAME]. Check your SOUL file at .agent/souls/[agent].md
```

### Can't find handoff from previous agent
```bash
# Check if it was written
grep -A 20 "Handoff" memory/$(date +%Y-%m-%d).md
```

### Files in wrong location
```bash
# Move them to the right place
mv wrong/location/file.py execution/backend/
```

### Need to see all agent work today
```bash
# Show all files modified today
find . -type f -mtime 0 -ls
```

---

## Agent Communication Pattern

1. **Agent A completes work**
   - Creates artifacts in appropriate directory
   - Writes detailed handoff in memory file
   - Updates task board

2. **Agent B starts new session**
   - Reads CLAUDE.md (shared context)
   - Reads their SOUL file (identity)
   - Reads memory file (gets Agent A's handoff)
   - Continues work based on handoff

3. **Agent B completes work**
   - Repeats the cycle for Agent C

---

## Pro Tips

✓ Always read memory file before starting work
✓ Run the Validate phase before starting execution
✓ Run the Verify phase before handing off work
✓ Include self-review summary in every handoff
✓ Always write handoffs before ending sessions
✓ Use descriptive file names
✓ Commit after each agent session
✓ Keep task board current
✓ Name terminals/tabs by agent role
✓ Don't let agents work in wrong directories
✓ Don't pass flawed work forward — fix it or block the handoff

---

## Template Structure Overview

```
ai-pm-builder-template/          (repo root)
├── CLAUDE.md                     (shared agent context)
├── GEMINI.md                     (for Google anti-gravity projects)
├── PORTFOLIO.md                  (all projects overview)
├── directives/                   (template shared directives)
│   ├── self-annealing-protocol.md
│   ├── human-reporting-protocol.md
│   └── requirements/
├── .agent/souls/                 (shared agent identities)
│   ├── scrum-master.md
│   ├── requirements-ba.md
│   ├── backend-developer.md
│   ├── database-engineer.md
│   └── qa-engineer.md
└── projects/
    ├── project-1/
    │   ├── PROJECT.md
    │   ├── memory/               (daily logs & MEMORY.md)
    │   ├── orchestration/        (tasks.md)
    │   ├── governance/           (requirements, decisions)
    │   └── execution/            (database/, backend/, frontend/)
    └── project-2/
        └── (same structure)
```

---

**Keep this card handy for daily multi-agent development!**

# Claude Code Multi-Agent Quick Reference

## Starting Any Agent Session

```bash
# 1. Navigate to your project
cd ~/Projects/your-project

# 2. Start Claude Code
claude-code

# 3. Initialize the agent role
Read CLAUDE.md and .agent/souls/[AGENT-NAME].md and take on that role.
Check memory/2026-02-04.md for today's activity and any assignments for you.
```

---

## Agent Role Commands

### Scrum Master
```
Read CLAUDE.md and .agent/souls/scrum-master.md and take on the Scrum Master role.
Check the task board at orchestration/tasks.md and today's memory.
Help me coordinate the team's work.
```

### Requirements BA
```
Read CLAUDE.md and .agent/souls/requirements-ba.md and take on the Requirements BA role.
I need to gather requirements for [FEATURE]. Start by asking me questions to understand what we're building.
```

### Database Engineer
```
Read CLAUDE.md and .agent/souls/database-engineer.md and take on the Database Engineer role.
Check the architecture design and create the database schema for [FEATURE].
```

### QA Engineer
```
Read CLAUDE.md and .agent/souls/qa-engineer.md and take on the QA Engineer role.
Check what's ready for testing and create a test plan for [FEATURE].
```

### Backend Developer
```
Read CLAUDE.md and .agent/souls/backend-developer.md and take on the Backend Developer role.
Check the database schema and implement the API endpoints for [FEATURE].
```

---

## Essential File Locations

| What | Where |
|------|-------|
| Shared context all agents read | `CLAUDE.md` |
| Agent identity files | `.agent/souls/[agent-name].md` |
| Today's coordination log | `memory/$(date +%Y-%m-%d).md` |
| Long-term team knowledge | `memory/MEMORY.md` |
| Task board | `orchestration/tasks.md` |
| Requirements | `directives/requirements/` |
| Database work | `execution/database/` |
| Backend code | `execution/backend/` |
| Frontend code | `execution/frontend/` |

---

## Common Workflows

### Sequential Handoff (Requirements → Stories)

**Session 1: Requirements BA**
```bash
claude-code
```
```
Take on Requirements BA role. Gather requirements for the dashboard feature.
```
*Agent creates requirements docs and writes handoff in memory file*

**Session 2: User Story BA**  
```bash
claude-code
```
```
Take on User Story BA role. Check memory/2026-02-04.md for the handoff from Requirements BA.
Convert those requirements into user stories.
```

### Parallel Work (Multiple Agents Same Time)

**Terminal 1: Database Engineer**
```bash
cd ~/Projects/your-project
claude-code
```
```
Take on Database Engineer role. Design schema for [feature].
```

**Terminal 2: UI/UX Designer** (at the same time)
```bash
cd ~/Projects/your-project
claude-code
```
```
Take on UI/UX Designer role. Create wireframes for [feature].
```

Both work independently, coordinate through memory files.

---

## Before Ending Any Session

Always end with:
```
Before we finish:
1. Write a complete handoff summary in memory/2026-02-04.md
2. List all files you created with their paths
3. Note any blockers or decisions needed
4. Update the task board if needed
```

---

## Checking Status

### See today's activity
```bash
cat memory/$(date +%Y-%m-%d).md
```

### See current tasks
```bash
cat orchestration/tasks.md
```

### See what files were created recently
```bash
find . -type f -mtime -1 -not -path '*/\.*'
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
git add .
git commit -m "Session: [AGENT] - [what was accomplished]"
```

### Examples
```bash
git commit -m "Session: Requirements BA - Completed stakeholder interviews"
git commit -m "Session: Database Engineer - Created schema v1"
git commit -m "Session: QA Engineer - Added test plan for notifications"
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
✓ Always write handoffs before ending sessions  
✓ Use descriptive file names
✓ Commit after each agent session
✓ Keep task board current
✓ Name terminals/tabs by agent role
✓ Don't let agents work in wrong directories

---

## Quick Setup for New Project

```bash
# Using the setup script
./setup-claude-project.sh my-new-project

# Or with custom agents
./setup-claude-project.sh -a scrum-master,requirements-ba,backend-developer my-app

# Or in custom location
./setup-claude-project.sh -p ~/Code my-app
```

---

**Keep this card handy for daily multi-agent development!**

# Quick Start Guide: Multi-Agent Development with Claude Code & Google Antigravity

## Introduction

This guide will help you set up and run your first multi-agent development workflow using the AI PM Builder's Template. You're about to move from single-agent prompting to orchestrating a full development team of specialized AI agents working in parallel.

The key insight with the new repository structure is a clean separation of concerns: the repository root contains reusable shared resources that apply to all projects, while individual projects live in isolation under `projects/[project-name]/`. This lets you run multiple projects simultaneously without interference, and reuse the same governance frameworks and agent personalities across all of them.

## What You're Building

You're creating a coordinated team of AI agents that work like a real software development team. Each agent has deep expertise in their domain, whether that's gathering requirements, designing databases, writing code, or managing deployments. They coordinate through shared memory files and a task board, handing work to each other as features flow from concept to production.

This isn't about automating yourself out of the picture. You're becoming the director who sets strategy, makes key decisions, and removes blockers while your agent team handles the tactical execution.

## Architecture Overview

The system operates as a two-tier architecture. The template tier lives at the repository root and contains resources shared across all projects. This includes 22 governance templates organized in `directives/`, 5 mandatory directives for compliance and standards, 14 specialized agent SOUL files in `.agent/souls/`, and the universal context files CLAUDE.md and GEMINI.md that every agent reads regardless of project. The template tier also includes PORTFOLIO.md, which tracks all completed projects across your organization.

The project tier, under `projects/[project-name]/`, contains all work artifacts specific to that individual project. Each project is completely self-contained in its own directory, with its own memory files, task boards, execution directories, and project-specific governance instantiations. This isolation means you can safely run multiple projects in parallel without file conflicts or context confusion.

The three-layer pattern within each project tier still applies: Directives contain strategic rules and constraints, Orchestration coordinates work through task boards and dependencies, and Execution produces actual artifacts.

Agents coordinate through two mechanisms. Short-term coordination happens through daily memory files where agents log what they did, what they're working on, and what they're handing off to other agents. Long-term knowledge lives in a persistent memory file that captures decisions, user preferences, and lessons learned that should influence all future work.

## Repository Structure: Two-Tier Architecture

### Repository Root: Shared Template Resources

The repository root is the "AI PM Builder's Template" that contains reusable components available to all projects.

**CLAUDE.md and GEMINI.md** are the universal context files. Every agent reads the appropriate file for their AI platform when they start a session to understand the shared project philosophy, quality standards, and communication patterns.

**.agent/souls/** contains 14 specialized agent SOUL files. Each SOUL file defines an agent's identity, values, working style, and expertise. Agents include Scrum Master, Requirements BA, User Story BA, Architecture SE, Database Engineer, Backend Developer, Frontend Developer, UI/UX Designer, QA/Test Automation, Pipeline DevOps, Performance DevOps, Documentation Specialist, Release Manager, and System Administrator. These are reference implementations that get customized for individual projects.

**directives/** contains 22 reusable governance templates and 5 mandatory directives. These include requirements templates, architectural decision records, security policies, regulatory compliance frameworks, performance standards, and quality gates. These are the immutable rules that guide all agent decisions across all projects. When you start a new project, you instantiate relevant templates into that project's `projects/[project-name]/governance/` directory.

**PORTFOLIO.md** lives at the root and tracks all completed projects, their outcomes, duration, key learnings, and lessons that informed future projects. This becomes your organizational memory across projects.

**new-project.sh** is a scaffolding script that creates a new project directory with the correct structure and populated templates.

### Per-Project Directory: projects/[project-name]/

Each project lives in its own isolated directory under `projects/`. When you scaffold a new project with `./new-project.sh my-project-name`, you get this structure:

**PROJECT.md** at the root of your project directory contains the shared context specific to this project: business objectives, technical constraints, team composition, and project scope. This is the one file agents read to understand what problem they're solving in this specific project.

**memory/** directory holds both daily activity logs and long-term project memory. Each day gets its own YYYY-MM-DD.md file where agents log their work, decisions, and handoffs. The MEMORY.md file captures knowledge that should persist throughout the project and inform decisions.

**orchestration/** directory contains workflow management. The tasks.md file is your living task board showing what's in progress, what's blocked, and what's done. The dependencies.md file maps out which tasks depend on which other tasks so agents know when their dependencies are satisfied.

**execution/** directory is where agents put their work output. You might organize this by agent type or by feature, whatever makes sense for your project. Code goes here, documentation goes here, deployment configurations go here.

**governance/** directory contains project-specific instantiations of the shared templates from the repo root's `directives/` folder, plus any project-specific governance rules. Inside governance, you'll have:
- **Phase_Gates/** with explicit go/no-go decision points for major project phases
- **Cross_Cutting/** with standards that apply across the entire project (security, performance, testing, documentation standards specific to this project)

The key architectural principle is that **directives are shared, but instantiations are isolated**. The template for a security policy lives in `directives/templates/security-policy.md`. When you start the banking project, you create `projects/banking/governance/security-policy.md` with details specific to banking regulations. When you start the SaaS project, you create `projects/saas/governance/security-policy.md` with different compliance requirements. The template is the common language; the instantiation is the specific implementation.

## Creating a New Project

### Step 1: Scaffold the Project Directory

From the repository root, run the scaffolding script with your project name:

```bash
./new-project.sh my-project-name
```

This creates the complete directory structure under `projects/my-project-name/` with template files ready for customization.

### Step 2: Customize PROJECT.md

Open `projects/my-project-name/PROJECT.md` and fill in the project-specific context. Describe what business problem you're solving, what technologies you've chosen, who's involved, and what success looks like. This is the file agents will read to understand the project context.

### Step 3: Populate Governance

Review which governance templates from `directives/` apply to your project. For a typical web application, you'd likely need architecture standards, security policies, performance requirements, and testing standards. Copy relevant templates into `projects/my-project-name/governance/` and customize them for your specific project constraints.

The Phase_Gates subdirectory should contain decision points for your major phases (requirements complete, architecture approved, backend complete, frontend complete, ready for release). The Cross_Cutting subdirectory should contain standards that apply throughout execution.

### Step 4: Create Initial Task Board

Open `projects/my-project-name/orchestration/tasks.md` and create your initial task structure. This doesn't need to be complete — you'll refine it as work progresses. Start with major epics that break into stories.

### Step 5: Begin the First Session

With the project scaffolded and context documents in place, you're ready to start your first multi-agent session.

## Initial Setup: Day One

You've just scaffolded a new project with `./new-project.sh`. Now it's time to populate the initial context and begin work.

Create your first daily memory file in `projects/my-project-name/memory/` named with today's date (YYYY-MM-DD.md). Copy the daily memory template as your starting point. This file will capture what the Requirements BA learns and what they hand off to the next agents.

Open your preferred AI development environment (Claude Code or Google Antigravity) and point it at the repository root directory. You'll be working within the `projects/my-project-name/` subdirectory for all artifacts, but the agents will read the shared context from the repo root.

## Starting Your First Multi-Agent Session

Begin with the Scrum Master and Requirements BA working together. Open two terminal sessions or two browser instances, one for each agent.

### Loading Agent Context

In the first session, initialize the Scrum Master agent. The agent should read:
1. `CLAUDE.md` or `GEMINI.md` (the shared template context)
2. `.agent/souls/scrum-master.md` (the agent's identity and working style)
3. `projects/my-project-name/PROJECT.md` (the project-specific context)
4. `projects/my-project-name/memory/` (to see previous days' work, if this isn't day one)

Then tell the agent: "You are the Scrum Master for the [my-project-name] project. Read the context above and tell me what you understand about our project goals and constraints."

In the second session, initialize the Requirements BA the same way, reading the same root context but `.agent/souls/requirements-ba.md` instead. Tell them: "You are the Requirements BA for the [my-project-name] project. I need you to help us understand what we're building and why."

### The First Handoff

Tell the Requirements BA what business problem you're solving. They'll start asking you clarifying questions to understand requirements. As they capture requirements, they'll write them to files in `projects/my-project-name]/governance/requirements/` and update today's memory file with what they learned.

Once requirements are captured, the Requirements BA writes a handoff summary in `projects/my-project-name/memory/YYYY-MM-DD.md`. This tells the User Story BA everything they need to know to start crafting user stories.

Now you shift contexts. Close the Requirements BA session and open a User Story BA session. This agent reads their SOUL file, reads the shared context, reads the project context, checks today's memory file for the handoff from Requirements BA, and begins their work. They'll convert requirements into user stories with clear acceptance criteria.

### The Repeating Pattern

This pattern continues as work flows through your agent team. Each agent in sequence:
1. Reads `CLAUDE.md` or `GEMINI.md` (shared template context)
2. Reads their SOUL file from `.agent/souls/`
3. Reads `projects/my-project-name/PROJECT.md` (project context)
4. Reads `projects/my-project-name/memory/YYYY-MM-DD.md` (today's handoffs)
5. Runs the **validate phase** to confirm their inputs are sound
6. Executes their specialty work, writing to `projects/my-project-name/execution/`
7. Runs the **verify phase** to self-review their output against acceptance criteria
8. Writes a handoff summary in `projects/my-project-name/memory/YYYY-MM-DD.md` including a self-review summary

Each agent understands this pattern implicitly once they've been briefed on the self-annealing protocol (see below). They know they're responsible for ensuring their work is complete and correct before handing it off.

## Parallel Execution: Moving Beyond Sequential

Once you're comfortable with sequential handoffs, you're ready for parallel execution. This is where the real productivity gains appear. Look at your task board in `projects/my-project-name/orchestration/tasks.md` and identify tasks that can happen simultaneously because they don't depend on each other.

For example, once the Architecture SE completes the system design, three things can happen in parallel. The Database Engineer can design the schema. The UI/UX Designer can create wireframes. The Backend Developer can start defining API contracts. None of these tasks blocks the others.

Open three terminal sessions or browser instances, one for each agent. Each agent reads the shared context, reads their SOUL file, reads the project context, and starts their assigned work. They work in different subdirectories under `projects/my-project-name/execution/` to avoid file conflicts. The Database Engineer works in `projects/my-project-name/execution/database/`. The UI/UX Designer works in `projects/my-project-name/execution/design/`. The Backend Developer works in `projects/my-project-name/execution/backend/`.

As each agent completes their work, they write to the shared daily memory file at `projects/my-project-name/memory/YYYY-MM-DD.md`. This is how the team maintains visibility into who's done what. The Scrum Master monitors the memory file and the task board to see when parallel work completes and what can start next.

## Managing Dependencies and Blockers

Sometimes an agent discovers they're blocked. Maybe the Backend Developer realizes they need the database schema before they can write data access code, but the Database Engineer hasn't finished yet. The Backend Developer documents this blocker in `projects/my-project-name/memory/YYYY-MM-DD.md` with a clear description of what's blocking them and what would unblock them.

The Scrum Master sees this blocker when reviewing the daily memory file. They update the task board at `projects/my-project-name/orchestration/tasks.md` to mark the Backend Developer's task as blocked. They check the Database Engineer's progress and might prioritize schema completion to unblock the Backend Developer quickly. They might also reassign the Backend Developer to other unblocked work in the meantime.

When the Database Engineer completes the schema, they write the completion and handoff information to `projects/my-project-name/memory/YYYY-MM-DD.md`. The Scrum Master sees this, updates the task board to mark the database task complete, and changes the Backend Developer's status from blocked to ready to resume. The Backend Developer reads the handoff documentation and continues their work.

## Quality Patterns That Emerge

As you run more projects through this system, certain quality patterns become important. Handoff documentation should be detailed enough that the next agent can work without asking questions. When the Database Engineer hands off a schema, they should include example queries, explain the indexing strategy, and document any performance considerations.

Agents should state their assumptions explicitly. If the Backend Developer assumes the system will never have more than 1000 concurrent users, that assumption should be documented in `projects/my-project-name/memory/` or in the work artifact itself. Later agents or humans can spot where assumptions might be wrong and address them.

When agents make decisions, especially architectural or technical decisions, they should document why they chose that approach over alternatives. This helps when someone later questions the decision or when the team needs to revisit it due to changed requirements. Store these decision records in `projects/my-project-name/governance/`.

Work should be tested before it's handed off. The Database Engineer shouldn't just write a schema and declare it done. They should test it against realistic data volumes to verify performance. The Backend Developer should write unit tests for their API code. The UI/UX Designer should test wireframes with potential users if possible. Testing evidence should be documented in handoffs or in the execution directory.

## Self-Annealing: How the System Corrects Its Own Errors

Every multi-agent system will produce errors. Agents misinterpret requirements, schemas don't match API contracts, tests miss edge cases. The question isn't whether errors happen but how quickly they're caught and corrected.

The self-annealing protocol, defined in `directives/self-annealing-protocol.md`, gives every agent a structured process for detecting and fixing their own mistakes before passing work downstream. The name comes from metallurgy where annealing removes defects from metal through controlled heating and cooling. In your agent fleet, self-annealing removes defects through structured self-review cycles.

Every piece of work follows a four-phase loop. First, the agent validates their inputs by checking that upstream work is complete and correct. Second, they execute their specialty work. Third, they verify their own output against acceptance criteria before handing it off. Fourth, if verification reveals a problem, they correct it and re-verify. No agent hands off work without completing the verify phase.

When you're reviewing an agent's handoff in `projects/my-project-name/memory/`, look for the self-review summary. It should show that the agent checked each acceptance criterion individually, verified consistency with upstream inputs, confirmed completeness for the downstream agent, and considered edge cases. If the summary is missing or vague, send the work back. The verify phase is not optional.

Sometimes errors cascade across multiple agents. When the same type of error keeps recurring, or when fixes create new problems, the circuit breaker protocol kicks in. This pauses all affected work until the systemic root cause is identified and resolved. The Scrum Master oversees circuit breaker events and coordinates the response.

The real power of self-annealing is the learning loop. Every correction produces a documented learning that prevents the same error from recurring. Over time, these learnings accumulate in `projects/my-project-name/memory/MEMORY.md` and in individual SOUL files, making the entire fleet progressively more reliable. Review these annealing records during retrospectives to spot patterns and strengthen the system's weakest points.

## Continuous Improvement Through Retrospectives

At the end of each sprint or major milestone, run a retrospective. Review the daily memory files from the sprint in `projects/my-project-name/memory/` and look for patterns. Where did work flow smoothly? Where did handoffs fail and require rework? Where did agents get blocked frequently?

Capture these insights in `projects/my-project-name/memory/MEMORY.md`. If you notice that Database Engineer handoffs are always smooth because they include detailed documentation, document that as the standard pattern. If you notice that Frontend Developer often has to go back to UI/UX Designer for clarifications, improve the UI/UX handoff protocol.

Update the shared CLAUDE.md or GEMINI.md file with patterns that affect multiple agents across multiple projects. Update individual agent SOUL files in `.agent/souls/` with patterns specific to that agent's role. The system should get smarter over time as you capture what works.

Also consider: did the project-level governance in `projects/my-project-name/governance/` help the team make better decisions? If a Phase Gate template prevented errors by forcing review, document that. If a Cross_Cutting standard improved quality, make it standard across future projects.

## Scaling Up: Adding More Agents

Once you've successfully coordinated two to three agents on a project, you can add more. Don't jump straight to running all eleven agents at once. Add them one at a time as you need them. If your current project doesn't need DevOps automation yet, don't spin up the Pipeline DevOps and Performance DevOps agents.

When you do add a new agent, make sure their SOUL file is appropriate for your project context. The templates in `.agent/souls/` provide a starting point, but you should brief the agent on your project-specific technology stack, quality standards, and communication preferences by ensuring they read `projects/my-project-name/PROJECT.md` carefully.

Each new agent adds coordination complexity. Make sure your existing coordination is smooth before adding more agents to the mix. Three agents coordinating well is better than ten agents stepping on each other.

## Running Multiple Projects Simultaneously

One of the key advantages of the new two-tier architecture is the ability to run multiple projects in parallel. Each project is completely isolated under its own `projects/[project-name]/` directory, so work in one project doesn't interfere with another.

You might have the banking project in `projects/banking/` running its Backend Developer and Database Engineer in parallel, while the SaaS project in `projects/saas/` is in the Requirements phase, and the internal tool project in `projects/internal-tool/` is deploying to production.

Each project draws from the same shared agent personalities in `.agent/souls/` and the same governance templates in `directives/`, but each instantiates them for its own specific constraints. The banking project might have strict regulatory requirements in its governance that the SaaS project doesn't need.

## Completing a Project and Updating PORTFOLIO.md

When a project is complete and deployed to production, it's time to close it out and capture the lessons learned for future projects.

Write a project closure summary in `projects/my-project-name/CLOSURE.md` that documents:
- Start and end dates
- Final scope compared to initial scope
- Key deliverables and their quality
- Major blockers and how they were resolved
- Lessons learned about the technology choices
- Lessons learned about the team and workflow
- Metrics (cycle time, handoff quality, defect rates)
- Recommendations for future similar projects

Then update `PORTFOLIO.md` at the repository root to add a summary of the completed project:
- Project name and timeframe
- Business objective
- Key outcomes and deliverables
- Duration and team composition
- Lessons that informed future project approaches
- Link to the full closure summary at `projects/my-project-name/CLOSURE.md`

This accumulated portfolio becomes your organizational memory. When you start a similar project three months later, you can read about what worked and what didn't in the previous project with the same technology stack or domain.

## Common Pitfalls to Avoid

One common mistake is starting work without clear requirements. Agents are good at executing, but they can't read your mind. If you tell the Backend Developer to build an API without first having the Requirements BA and User Story BA define what the API should do in `projects/my-project-name/governance/requirements/`, you'll get something built but it won't be what you needed.

Another pitfall is letting work pile up without completing it. The temptation is to start many tasks because you have many agents. But if nothing reaches done, you're just creating work in progress that will eventually need to be finished. Follow the work in progress limits defined in `projects/my-project-name/orchestration/tasks.md`.

Don't skip handoff documentation. It feels like overhead when you're eager to keep moving, but sloppy handoffs in `projects/my-project-name/memory/` create rework downstream. The time you save by skipping documentation gets spent triple when the next agent has to interrupt the previous agent to ask questions.

Don't ignore blockers. When an agent raises a blocker in the daily memory file, address it or explicitly decide to defer it with a clear plan. Blockers don't age like wine. They get worse the longer they sit.

Don't confuse shared templates with project instantiations. A governance template in `directives/` is a starting point. The actual rules your project follows live in `projects/my-project-name/governance/`. Update the project governance, not the shared templates, when you need to adjust rules mid-project.

## Tools and Interfaces

You can run this system with just terminal sessions and text editors, opening multiple terminal windows with different agent contexts loaded. This works well when you're starting out and want to understand the mechanics. Each agent session reads from the repo root (shared context and SOUL files) and from the project directory (project-specific context and artifacts).

As you scale up, consider tools like VibeKanban which provides a visual interface for managing multiple coding agents in parallel. It gives you a Kanban-style board where you can see all your agents, what they're working on, and their status. The task board moves from a markdown file at `projects/my-project-name/orchestration/tasks.md` to a visual board you can drag and drop on.

For agents that need to coordinate in real-time, you might use cron jobs to have them check the task board and memory files on a schedule. An agent could wake up every thirty minutes, check for work assigned to them in `projects/my-project-name/orchestration/tasks.md`, execute it if it's ready, and write results to `projects/my-project-name/memory/YYYY-MM-DD.md`. This creates an autonomous agent team that works while you sleep.

## Measuring Success

You'll know the system is working when you see certain indicators. Your cycle time decreases, meaning work flows from requirements to production faster. Your handoff rate improves, with agents rarely needing to send work back to previous agents for clarification. Your blocker rate drops as coordination patterns improve. Your quality increases because specialized agents do deep work in their domains rather than generalists doing shallow work across everything.

Most importantly, you should feel more like a director and less like a doer. If you're still in the weeds writing code or gathering requirements yourself, the agents aren't carrying enough load yet. If you're spending your time on strategy, removing blockers, and making key decisions while agents handle tactical execution, you've successfully shifted from doing to directing.

## Next Steps

Start with a small project that you can complete in one to two weeks. Use `./new-project.sh my-project-name` to scaffold it properly. Use just the core agents you need, maybe three to five agents total. Build the coordination muscle memory with sequential handoffs before attempting parallel execution. Document what you learn in `projects/my-project-name/memory/MEMORY.md` as you go.

Once you've successfully coordinated a small project from requirements to deployment, add complexity gradually. Try parallel execution with two agents working simultaneously. Add specialized agents you didn't use the first time. Experiment with different handoff protocols and see what works best for your style.

Run a second project with a different technology stack or domain. Notice how the shared agent personalities and governance templates adapt to new contexts. Notice which governance patterns you reuse and which you customize.

Remember that this is as much about building a mental model of multi-agent coordination as it is about the tools and templates. The templates give you structure, but you'll develop intuition about when to use which agent, how to decompose work effectively, and where coordination is likely to break down. That intuition is what lets you orchestrate effectively.

The templates and architecture provide the scaffolding. Your projects fill it with reality. Start simple, learn from what works and what doesn't, and build up your coordination capabilities over time. Review your PORTFOLIO.md periodically to see how your organization's capability is maturing.

You're ready to begin. Run `./new-project.sh my-first-project` and choose your first project. Start with the Requirements BA and Scrum Master. The rest of the team is standing by.

---

**Document Version**: 2.0
**Last Updated**: 2026-02-09
**Maintained By**: Multi-Agent Orchestration Team

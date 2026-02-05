# Quick Start Guide: Multi-Agent Development with Claude Code & Google Antigravity

## Introduction

This guide will help you set up and run your first multi-agent development workflow using the templates provided. You're about to move from single-agent prompting to orchestrating a full development team of specialized AI agents working in parallel.

## What You're Building

You're creating a coordinated team of AI agents that work like a real software development team. Each agent has deep expertise in their domain, whether that's gathering requirements, designing databases, writing code, or managing deployments. They coordinate through shared memory files and a task board, handing work to each other as features flow from concept to production.

This isn't about automating yourself out of the picture. You're becoming the director who sets strategy, makes key decisions, and removes blockers while your agent team handles the tactical execution.

## Architecture Overview

The system has three layers that work together. The Directives layer contains your strategic rules and constraints that never change mid-project. These are things like regulatory requirements, technology choices, and quality standards. The Orchestration layer is where coordination happens through task boards, dependency graphs, and agent communication protocols. The Execution layer is where agents produce actual artifacts like code, documentation, and deployments.

Agents coordinate through two mechanisms. Short-term coordination happens through daily memory files where agents log what they did, what they're working on, and what they're handing off to other agents. Long-term knowledge lives in a persistent memory file that captures decisions, user preferences, and lessons learned that should influence all future work.

## Repository Structure

When you start a new project, you'll create this directory structure. At the root level, you'll have either CLAUDE.md for Claude Code or GEMINI.md for Google Antigravity. These files contain the shared context that every agent reads when they start a session.

The .agent directory holds agent-specific configurations. Inside it, the souls subdirectory contains a SOUL.md file for each agent that defines their identity, values, and working style. The coordination subdirectory has protocols for how agents hand work to each other.

The directives directory contains strategic constraints organized by category. You might have requirements documents, regulatory compliance rules, technology standards, and security policies here. These are the immutable rules that guide all agent decisions.

The orchestration directory is where workflow management happens. The tasks.md file is your living task board showing what's in progress, what's blocked, and what's done. The dependencies.md file maps out which tasks depend on which other tasks so agents know when their dependencies are satisfied.

The execution directory is where agents put their work output. You might organize this by agent type or by feature, whatever makes sense for your project. Code goes here, documentation goes here, deployment configurations go here.

The memory directory holds both daily activity logs and long-term memory. Each day gets its own YYYY-MM-DD.md file where agents log their work. The MEMORY.md file captures knowledge that should persist beyond individual days.

## Initial Setup: Day One

Start by choosing a project you're actually going to build, not a test project. Real work reveals real coordination challenges that help you learn the system. Copy the CLAUDE.md template if you're using Claude Code, or copy the GEMINI.md template if you're using Google Antigravity. Put this file at the root of your project directory.

Create the directory structure shown above. Copy the soul files for the agents you'll need for this specific project. If you're building a simple tool that doesn't need UI, you might skip the UI/UX Designer and Frontend Developer souls for now. Start small.

Create your first daily memory file in the memory directory named with today's date. Copy the daily memory template as your starting point. Create a task board file in the orchestration directory using the task board template. You'll populate this as you break down your first feature.

## Starting Your First Multi-Agent Session

Begin with the Scrum Master and Requirements BA working together. Open two terminal sessions or two browser instances, one for each agent. In the first session, load the Scrum Master context by reading CLAUDE.md or GEMINI.md followed by reading the Scrum Master SOUL file from the souls directory. In the second session, load the Requirements BA context the same way.

Tell the Requirements BA what business problem you're solving. They'll start asking you clarifying questions to understand requirements. As they capture requirements, they'll write them to files in the directives/requirements directory and update today's memory file with what they learned.

Once requirements are captured, the Requirements BA writes a handoff summary in the daily memory file. This tells the User Story BA everything they need to know to start crafting user stories from those requirements.

Now you shift contexts. Close the Requirements BA session and open a User Story BA session. This agent reads their SOUL file, reads the shared context, checks today's memory file for the handoff from Requirements BA, and begins their work. They'll convert requirements into user stories with clear acceptance criteria.

This pattern continues as work flows through your agent team. Each agent reads the shared context, reads their SOUL file, checks the daily memory for their assignment, executes their specialty work, and writes a handoff summary for the next agent.

## Parallel Execution: Moving Beyond Sequential

Once you're comfortable with sequential handoffs, you're ready for parallel execution. This is where the real productivity gains appear. Look at your task board and identify tasks that can happen simultaneously because they don't depend on each other.

For example, once the Architecture SE completes the system design, three things can happen in parallel. The Database Engineer can design the schema. The UI/UX Designer can create wireframes. The Backend Developer can start defining API contracts. None of these tasks blocks the others.

Open three terminal sessions or browser instances, one for each agent. Each agent reads their context, reads their SOUL file, and starts their assigned work. They work in different directories to avoid file conflicts. The Database Engineer works in execution/database. The UI/UX Designer works in execution/design. The Backend Developer works in execution/backend.

As each agent completes their work, they write to the shared daily memory file. This is how the team maintains visibility into who's done what. The Scrum Master monitors the memory file and the task board to see when parallel work completes and what can start next.

## Managing Dependencies and Blockers

Sometimes an agent discovers they're blocked. Maybe the Backend Developer realizes they need the database schema before they can write data access code, but the Database Engineer hasn't finished yet. The Backend Developer documents this blocker in the daily memory file with a clear description of what's blocking them and what would unblock them.

The Scrum Master sees this blocker when reviewing the daily memory file. They update the task board to mark the Backend Developer's task as blocked. They check the Database Engineer's progress and might prioritize schema completion to unblock the Backend Developer quickly. They might also reassign the Backend Developer to other unblocked work in the meantime.

When the Database Engineer completes the schema, they write the completion and handoff information to the daily memory file. The Scrum Master sees this, updates the task board to mark the database task complete, and changes the Backend Developer's status from blocked to ready to resume. The Backend Developer reads the handoff documentation and continues their work.

## Quality Patterns That Emerge

As you run more projects through this system, certain quality patterns become important. Handoff documentation should be detailed enough that the next agent can work without asking questions. When the Database Engineer hands off a schema, they should include example queries, explain the indexing strategy, and document any performance considerations.

Agents should state their assumptions explicitly. If the Backend Developer assumes the system will never have more than 1000 concurrent users, that assumption should be documented. Later agents or humans can spot where assumptions might be wrong and address them.

When agents make decisions, especially architectural or technical decisions, they should document why they chose that approach over alternatives. This helps when someone later questions the decision or when the team needs to revisit it due to changed requirements.

Work should be tested before it's handed off. The Database Engineer shouldn't just write a schema and declare it done. They should test it against realistic data volumes to verify performance. The Backend Developer should write unit tests for their API code. The UI/UX Designer should test wireframes with potential users if possible.

## Continuous Improvement Through Retrospectives

At the end of each sprint or major milestone, run a retrospective. Review the daily memory files from the sprint and look for patterns. Where did work flow smoothly? Where did handoffs fail and require rework? Where did agents get blocked frequently?

Capture these insights in the long-term memory file. If you notice that Database Engineer handoffs are always smooth because they include detailed documentation, document that as the standard pattern. If you notice that Frontend Developer often has to go back to UI/UX Designer for clarifications, improve the UI/UX handoff protocol.

Update the shared CLAUDE.md or GEMINI.md file with patterns that affect multiple agents. Update individual SOUL files with patterns specific to that agent's role. The system should get smarter over time as you capture what works.

## Scaling Up: Adding More Agents

Once you've successfully coordinated two to three agents, you can add more. Don't jump straight to running all eleven agents at once. Add them one at a time as you need them. If your current project doesn't need DevOps automation yet, don't spin up the Pipeline DevOps and Performance DevOps agents.

When you do add a new agent, make sure their SOUL file is customized for your project context. The templates provide a starting point, but you should refine them based on your specific technology stack, quality standards, and communication preferences.

Each new agent adds coordination complexity. Make sure your existing coordination is smooth before adding more agents to the mix. Three agents coordinating well is better than ten agents stepping on each other.

## Common Pitfalls to Avoid

One common mistake is starting work without clear requirements. Agents are good at executing, but they can't read your mind. If you tell the Backend Developer to build an API without first having the Requirements BA and User Story BA define what the API should do, you'll get something built but it won't be what you needed.

Another pitfall is letting work pile up without completing it. The temptation is to start many tasks because you have many agents. But if nothing reaches done, you're just creating work in progress that will eventually need to be finished. Follow the work in progress limits defined in the task board template.

Don't skip handoff documentation. It feels like overhead when you're eager to keep moving, but sloppy handoffs create rework downstream. The time you save by skipping documentation gets spent triple when the next agent has to interrupt the previous agent to ask questions.

Don't ignore blockers. When an agent raises a blocker, address it or explicitly decide to defer it with a clear plan. Blockers don't age like wine. They get worse the longer they sit.

## Tools and Interfaces

You can run this system with just terminal sessions and text editors, opening multiple terminal windows with different agent contexts loaded. This works well when you're starting out and want to understand the mechanics.

As you scale up, consider tools like VibeKanban which provides a visual interface for managing multiple coding agents in parallel. It gives you a Kanban-style board where you can see all your agents, what they're working on, and their status. The task board moves from a markdown file to a visual board you can drag and drop on.

For agents that need to coordinate in real-time, you might use cron jobs to have them check the task board and memory files on a schedule. An agent could wake up every thirty minutes, check for work assigned to them, execute it if it's ready, and write results to memory. This creates an autonomous agent team that works while you sleep.

## Measuring Success

You'll know the system is working when you see certain indicators. Your cycle time decreases, meaning work flows from requirements to production faster. Your handoff rate improves, with agents rarely needing to send work back to previous agents for clarification. Your blocker rate drops as coordination patterns improve. Your quality increases because specialized agents do deep work in their domains rather than generalists doing shallow work across everything.

Most importantly, you should feel more like a director and less like a doer. If you're still in the weeds writing code or gathering requirements yourself, the agents aren't carrying enough load yet. If you're spending your time on strategy, removing blockers, and making key decisions while agents handle tactical execution, you've successfully shifted from doing to directing.

## Next Steps

Start with a small project that you can complete in one to two weeks. Use just the core agents you need, maybe three to five agents total. Build the coordination muscle memory with sequential handoffs before attempting parallel execution. Document what you learn in your MEMORY.md file as you go.

Once you've successfully coordinated a small project from requirements to deployment, add complexity gradually. Try parallel execution with two agents working simultaneously. Add specialized agents you didn't use the first time. Experiment with different handoff protocols and see what works best for your style.

Remember that this is as much about building a mental model of multi-agent coordination as it is about the tools and templates. The templates give you structure, but you'll develop intuition about when to use which agent, how to decompose work effectively, and where coordination is likely to break down. That intuition is what lets you orchestrate effectively.

The goal isn't perfect coordination on day one. The goal is continuous improvement toward a system where your AI agent team works as smoothly as a well-oiled human team would. Start simple, learn from what works and what doesn't, and build up your coordination capabilities over time.

You're ready to begin. Choose your first project and start with the Requirements BA and Scrum Master. The rest of the team is standing by.

---

**Document Version**: 1.0  
**Last Updated**: 2026-02-04  
**Maintained By**: Multi-Agent Orchestration Team

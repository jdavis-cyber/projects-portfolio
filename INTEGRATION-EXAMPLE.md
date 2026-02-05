# Integration Example: Building a Risk Assessment Dashboard

## Scenario

You're building a risk assessment dashboard for your workplace. The system needs to collect risk events from various monitoring systems, score them, notify the appropriate people, and provide a real-time dashboard showing current risk status across business units.

This example walks through how your multi-agent team would coordinate to build this feature from initial concept to deployed system.

## Project Initialization

You start by creating your project directory structure following the templates. Your directory looks like this:

```
risk-dashboard/
├── CLAUDE.md                    # Shared context for Claude Code agents
├── GEMINI.md                    # Shared context for Google Antigravity agents
├── .agent/
│   └── souls/                   # Agent identity files
│       ├── requirements-ba.md
│       ├── user-story-ba.md
│       ├── scrum-master.md
│       ├── architecture-se.md
│       ├── database-engineer.md
│       ├── backend-developer.md
│       └── ui-ux-designer.md
├── directives/
│   └── requirements/            # Business requirements
├── orchestration/
│   ├── tasks.md                # Task board
│   └── dependencies.md         # Dependency graph
├── execution/
│   ├── architecture/           # Design docs and diagrams
│   ├── database/              # Schema and migrations
│   ├── backend/               # API implementation
│   └── design/                # Wireframes and UI specs
└── memory/
    ├── 2026-02-04.md          # Today's activity log
    └── MEMORY.md              # Long-term team knowledge
```

## Day 1: Requirements and Planning

### Morning: Requirements BA Session

You open a Claude Code session and load the Requirements BA context. The agent reads CLAUDE.md for shared context and then reads .agent/souls/requirements-ba.md for their identity and working style.

You explain the business problem: "Our risk management team currently discovers high-severity risk events hours after they occur because they have to manually check multiple monitoring systems. We need a centralized dashboard that shows all risk events in real-time and automatically notifies the on-call manager when critical events are detected."

The Requirements BA starts asking clarifying questions, exactly as their SOUL file directs them to do. They ask about risk severity scoring, notification requirements, who needs access to the dashboard, what systems currently monitor for risks, regulatory requirements around data retention, and success criteria for the project.

Through this conversation, the Requirements BA creates detailed requirement documents. They write these to directives/requirements/REQ-001-risk-dashboard.md with structured sections covering business objectives, stakeholder information, functional requirements, non-functional requirements, constraints, and dependencies.

As they work, they update memory/2026-02-04.md with their activity log following the daily memory template. When they complete requirements gathering, they write a handoff summary explaining what they captured, where the documents are located, what key decisions were made, and what the User Story BA needs to know to begin their work.

### Afternoon: User Story BA Session

You close the Requirements BA session and open a new session for the User Story BA. This agent reads CLAUDE.md, reads their SOUL file at .agent/souls/user-story-ba.md, and then checks memory/2026-02-04.md to find the handoff from the Requirements BA.

The User Story BA reads the requirement documents from directives/requirements/ and begins converting them into user stories with clear acceptance criteria. They create stories like "As a risk manager, I want to see a real-time dashboard of high-severity risk events so I can respond quickly to critical situations."

Each user story gets its own file in directives/stories/ with the story description, acceptance criteria, dependencies, and estimation. The User Story BA writes a handoff summary when complete, explaining that stories are ready for the Architecture SE to begin system design.

### End of Day: Scrum Master Session

You open a Scrum Master session to review the day's progress. The Scrum Master reads the daily memory file and sees that requirements gathering and user story creation are both complete. They update orchestration/tasks.md to reflect this progress and mark the next task (architecture design) as ready to begin.

The Scrum Master also creates orchestration/dependencies.md showing the task flow:

```
Requirements Gathering (COMPLETE)
    ↓
User Story Creation (COMPLETE)
    ↓
Architecture Design (READY TO START) ← Next session
    ↓ ↓ ↓
    Database Schema    UI Wireframes    API Design (WAITING)
```

## Day 2: Architecture and Design

### Morning: Architecture SE Session

You start the day with an Architecture SE session. This agent reads their context and SOUL file, checks the daily memory to see their assignment, and reviews the user stories from directives/stories/.

The Architecture SE begins designing the overall system architecture. They decide on a microservices approach with a dedicated dashboard service, determine the technology stack (Python backend with FastAPI, PostgreSQL database, React frontend), design the API contracts, and plan the integration points with existing monitoring systems.

They create several artifacts in execution/architecture/:

The component diagram shows how the dashboard service interacts with the notification service, database, monitoring system integrations, and frontend application. The API specification in OpenAPI format defines all the REST endpoints the backend will implement. An architecture decision record explains why they chose WebSocket for real-time updates rather than long polling or server-sent events.

The Architecture SE writes a detailed handoff in the daily memory file. They explain that the system design is complete and ready for parallel work streams to begin. The Database Engineer can start schema design based on the entity relationship diagram. The UI/UX Designer can create wireframes since the component boundaries are defined. The Backend Developer should wait for the database schema to be complete before implementing API endpoints.

### Afternoon: Parallel Session 1 - Database Engineer

You open a session for the Database Engineer. They read their context and SOUL file, check the daily memory for their assignment, and review the architecture documents from execution/architecture/.

Following the patterns shown in their SOUL file example, the Database Engineer designs a schema with proper constraints, indexes, and partitioning strategy. They create the risk_events table partitioned by month for performance at scale. They add appropriate foreign keys to enforce referential integrity. They create indexes optimized for the query patterns the Architecture SE identified.

They write comprehensive documentation explaining each design decision, providing example queries with expected performance characteristics, and giving guidance to the Backend Developer about what access patterns will perform well versus poorly.

All of this goes into execution/database/ with the schema DDL, migration scripts, and documentation. The Database Engineer writes a handoff in the daily memory file letting the Backend Developer know the schema is ready and pointing them to the specific documentation files they should read.

### Afternoon: Parallel Session 2 - UI/UX Designer

At the same time the Database Engineer is working, you have a separate session open for the UI/UX Designer. They're also reading their assignment from the daily memory and working independently in their designated directory.

The UI/UX Designer creates wireframes for the dashboard showing how risk events should be visualized. They design a heat map showing risk scores across business units, a filterable list view for detailed event inspection, and modal dialogs for event details and assignment.

They make design decisions about color coding for severity levels, layout for mobile responsiveness, and interaction patterns for drill-down navigation. All of this is documented in execution/design/ with wireframe files and an interaction specification document.

The UI/UX Designer writes their handoff explaining that wireframes are complete and the Frontend Developer can begin implementation. They point out that they used Material-UI components in the wireframes to match the technology decision from the Architecture SE.

### End of Day: Scrum Master Review

The Scrum Master reviews both parallel work streams. They update the task board to show that database schema design and UI wireframes are both complete. They note that the Backend Developer is now unblocked and can begin API implementation in tomorrow's session. The dependency graph is updated showing progress:

```
Architecture Design (COMPLETE)
    ↓ ↓ ↓
    Database Schema (COMPLETE)    UI Wireframes (COMPLETE)    
            ↓                           ↓
    Backend API (READY)         Frontend UI (READY)
```

## Day 3: Implementation Begins

### Morning: Backend Developer Session

You open a Backend Developer session. They read the database documentation from the Database Engineer's handoff and the API specification from the Architecture SE. They understand exactly what endpoints to implement and how to access the database efficiently.

The Backend Developer creates the FastAPI application structure, implements the data access layer using the database schema, creates the REST API endpoints according to the specification, adds the Redis caching layer the Architecture SE specified, and writes unit tests for the business logic.

As they work, they follow the performance guidance from the Database Engineer. They use the recommended query patterns, batch database operations where possible, and implement the caching strategy correctly.

They create all their code in execution/backend/ with proper directory structure. When they complete the API endpoints but before finishing the WebSocket implementation, they write a status update to the daily memory file explaining what's complete, what's still in progress, and that there are currently no blockers.

### Afternoon: Frontend Developer Session

In parallel, the Frontend Developer begins implementing the user interface based on the wireframes from the UI/UX Designer. They set up the React application, implement the dashboard layout, create the heat map visualization component, add the filterable event list, and connect the frontend to the backend API endpoints.

They follow the design specifications exactly, using the specified color palette for severity levels and implementing the interaction patterns the UI/UX Designer documented. They work in execution/frontend/ creating components, styles, and integration code.

The Frontend Developer writes a status update when the initial implementation is complete but before adding the real-time WebSocket updates. They note they're waiting for the Backend Developer to complete the WebSocket endpoint before implementing the frontend connection.

### End of Day: Integration Planning

The Scrum Master reviews progress and notes that both frontend and backend are nearly complete. They schedule an integration testing session for the next day where the Backend Developer and Frontend Developer will work together to connect the WebSocket implementation and test the complete flow.

## Day 4: Integration and Testing

### Morning: Backend Developer Completes WebSocket

The Backend Developer finishes implementing the WebSocket endpoint for real-time risk score updates. They test it with a simple client to verify it's broadcasting events correctly.

### Late Morning: Frontend Developer Adds WebSocket Connection

The Frontend Developer implements the WebSocket connection in the React application. They add the logic to update the dashboard in real-time when new risk events are broadcast from the backend.

### Afternoon: Integration Testing Session

Both the Backend Developer and Frontend Developer coordinate through the daily memory file. They test the complete flow:

Creating a test risk event in the database results in it appearing on the dashboard within seconds. Filtering the dashboard by business unit shows only relevant events. Clicking an event opens the detail modal with correct information. The WebSocket connection reconnects automatically if it drops.

They document the test results in the daily memory file and note that integration testing passed successfully. A few minor issues were found and fixed during testing, all documented for future reference.

### End of Day: Deployment Ready

The Scrum Master updates the task board to show the feature is code complete and ready for deployment pipeline setup. They write to the daily memory file that the Pipeline DevOps engineer can begin their work tomorrow.

## Day 5: Deployment and Production

The pattern continues with the Pipeline DevOps engineer setting up the CI/CD pipeline and the Performance DevOps engineer running load tests to verify the system performs well under production conditions. Each agent follows the same coordination pattern of reading context, checking their assignments, executing their specialty work, and writing handoffs.

## What This Example Demonstrates

This walkthrough shows how the templates work together in practice. The CLAUDE.md and GEMINI.md files provided shared context that every agent read on initialization. The SOUL files gave each agent their identity and working style, which directed how they approached their work. The daily memory file served as the primary coordination mechanism, enabling clean handoffs between sequential work and visibility into parallel work streams.

The task board tracked status and dependencies, helping the Scrum Master identify when tasks could begin and when agents were blocked. The directory structure kept work organized with each agent working in their designated areas. The quality standards from the SOUL files ensured that handoff documentation was complete and artifacts were production-ready.

Most importantly, you as the human director spent your time on strategic decisions like what features to build, which requirements mattered most, and how to prioritize competing needs. You didn't write the code, design the schema, or create the wireframes yourself. Your agent team handled all of that tactical execution while you orchestrated their coordination.

This is multi-agent development in practice. Not one AI doing everything sequentially, but a team of specialized agents working in parallel with clear handoffs and coordination through shared memory and task management. The result is faster delivery, higher quality through specialization, and a sustainable model where you scale by adding agents rather than working longer hours.

---

**Example Created**: 2026-02-04  
**Demonstrates**: Sequential handoffs, parallel execution, clean coordination, quality patterns  
**Purpose**: Show the templates in action on a realistic project

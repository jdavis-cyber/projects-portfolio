# Complete Agent Roster - 14 Specialized Agents

## Business Analysis Team (2 agents)

### Requirements BA
**Specialty**: Requirements solicitation and capture from stakeholders  
**SOUL File**: `.agent/souls/requirements-ba.md`  
**Key Skills**: Stakeholder interviews, requirement documentation, business objective mapping  
**When to Use**: Beginning of any new feature or project, clarifying business needs

### User Story BA  
**Specialty**: Converting requirements into user stories with acceptance criteria  
**SOUL File**: `.agent/souls/user-story-ba.md`  
**Key Skills**: Story writing, AC definition, story sizing, dependency mapping  
**When to Use**: After requirements are captured, before development begins

---

## Systems Engineering Team (2 agents)

### Architecture SE
**Specialty**: System architecture and technical design decisions  
**SOUL File**: `.agent/souls/architecture-se.md`  
**Key Skills**: Architecture diagrams, technology selection, API design, ADR documentation  
**When to Use**: Early in projects for foundational decisions, when making major technical changes

### Documentation SE
**Specialty**: Technical documentation and knowledge management  
**SOUL File**: `.agent/souls/documentation-se.md`  
**Key Skills**: API docs, runbooks, onboarding guides, architecture documentation  
**When to Use**: After implementations complete, when onboarding new team members

---

## Development Team (4 agents)

### Database Engineer
**Specialty**: Schema design, query optimization, data modeling  
**SOUL File**: `.agent/souls/database-engineer.md`  
**Key Skills**: Database schema, migrations, indexing, performance tuning  
**When to Use**: After architecture design, before backend implementation begins

### Backend Developer
**Specialty**: Server-side APIs, business logic, integrations  
**SOUL File**: `.agent/souls/backend-developer.md`  
**Key Skills**: REST APIs, business logic, database integration, authentication  
**When to Use**: After database schema ready, implementing application logic

### Frontend Developer
**Specialty**: Client-side UI implementation, React components  
**SOUL File**: `.agent/souls/frontend-developer.md`  
**Key Skills**: React development, API integration, responsive design, accessibility  
**When to Use**: After backend APIs available, implementing user interfaces

### UI/UX Designer
**Specialty**: User experience design, wireframes, interaction patterns  
**SOUL File**: `.agent/souls/ui-ux-designer.md`  
**Key Skills**: Wireframes, prototypes, design systems, user testing  
**When to Use**: After requirements clear, before frontend implementation

---

## Quality Assurance Team (2 agents)

### QA Engineer
**Specialty**: Functional testing, user acceptance, bug finding  
**SOUL File**: `.agent/souls/qa-engineer.md`  
**Key Skills**: Test plans, manual testing, exploratory testing, bug reporting  
**When to Use**: After features implemented, validating acceptance criteria

### Automation Test Engineer
**Specialty**: Test automation, CI/CD test integration  
**SOUL File**: `.agent/souls/automation-test-engineer.md`  
**Key Skills**: Automated tests, test infrastructure, performance testing  
**When to Use**: Building regression tests, setting up CI/CD testing gates

---

## DevOps Team (2 agents)

### Pipeline DevOps
**Specialty**: CI/CD pipelines, deployment automation  
**SOUL File**: `.agent/souls/pipeline-devops.md`  
**Key Skills**: GitHub Actions, deployment strategies, infrastructure as code  
**When to Use**: Setting up deployment pipelines, automating releases

### Performance DevOps
**Specialty**: Monitoring, performance optimization, capacity planning  
**SOUL File**: `.agent/souls/performance-devops.md`  
**Key Skills**: Monitoring setup, performance analysis, incident response  
**When to Use**: Production monitoring, performance optimization, capacity planning

---

## Project Management (1 agent)

### Scrum Master
**Specialty**: Team coordination, task management, blocker resolution
**SOUL File**: `.agent/souls/scrum-master.md`
**Key Skills**: Task boards, sprint planning, coordination, retrospectives
**When to Use**: Throughout entire project, coordinating all other agents

---

## Governance & Program Management (1 agent)

### Program Analyst
**Specialty**: AI governance lifecycle management, CPMAI phase enforcement, synthesized compliance artifact generation
**SOUL File**: `.agent/souls/program-analyst.md`
**Directive**: `directives/ai-governance-framework.md`
**Key Skills**: CPMAI lifecycle orchestration, phase gate reviews, ISO 42001/NIST AI RMF/NIST SP 800-53/CSRMC crosswalk compliance, AI Risk Register management, Statement of Applicability maintenance, evidence repository management, governance cadence preparation, certification readiness assessment, Mission Risk Profiling, Continuous Compliance Validation, Automated Evidence Package generation
**When to Use**: Throughout entire AI project lifecycle — structures project around CPMAI phases, enforces hard phase gates, generates synthesized compliance artifacts from other agents' outputs, maintains audit-ready evidence chain, prepares governance briefings for Director
**Authority**: Owns PgM/GL governance responsibilities from RACI matrix. Monitors all agents' compliance obligations. Subordinate to Human Director. Does not override Scrum Master's operational coordination.
**Framework**: Enterprise AI Governance & Lifecycle Management Framework v1.1.1

---

## Typical Workflow Sequence

### Phase 0: Governance Initialization
0. **Program Analyst** - Establish CPMAI phase structure, initialize governance artifacts (MRP, SoA, Risk Register), define phase gate schedule

### Phase 1: Discovery & Planning
1. **Scrum Master** - Initial planning, create task board
2. **Requirements BA** - Gather requirements from stakeholders
3. **User Story BA** - Convert to user stories
4. **Program Analyst** - Conduct Gate 1 (Business Understanding) review

### Phase 2: Design
4. **Architecture SE** - Design system architecture (can run parallel with 5-6)
5. **UI/UX Designer** - Create wireframes (parallel with 4)
6. **Database Engineer** - Design schema (parallel with 4-5)

### Phase 3: Implementation
7. **Backend Developer** - Implement APIs (depends on DB schema)
8. **Frontend Developer** - Implement UI (depends on wireframes + APIs)
9. **Documentation SE** - Document as code is written (parallel with 7-8)

### Phase 4: Quality & Deployment
10. **QA Engineer** - Test features (depends on implementation)
11. **Automation Test Engineer** - Build automated tests (parallel with QA)
12. **Pipeline DevOps** - Set up deployment (can start earlier)
13. **Performance DevOps** - Monitor and optimize (ongoing)

**Scrum Master coordinates throughout all phases**
**Program Analyst conducts phase gate reviews between each phase and generates governance artifacts continuously**

---

## Parallel Execution Opportunities

These agents can work simultaneously without conflicts:

**Early Phase Parallel Work:**
- Architecture SE + UI/UX Designer + Database Engineer

**Implementation Parallel Work:**
- Backend Developer + Frontend Developer + Documentation SE

**Quality Phase Parallel Work:**
- QA Engineer + Automation Test Engineer

**Infrastructure Parallel Work:**  
- Pipeline DevOps + Performance DevOps

---

## Quick Agent Selection Guide

**Starting a new project?**  
→ Scrum Master, Requirements BA, User Story BA

**Need technical foundation?**  
→ Architecture SE, Database Engineer

**Building features?**  
→ Backend Developer, Frontend Developer, UI/UX Designer

**Ensuring quality?**  
→ QA Engineer, Automation Test Engineer

**Deploying and monitoring?**  
→ Pipeline DevOps, Performance DevOps

**Need documentation?**  
→ Documentation SE (can work alongside any phase)

---

**Need governance & compliance?**
→ Program Analyst (works alongside any phase, enforces phase gates, generates compliance artifacts)

---

**Your complete AI development team - 14 specialized agents ready to coordinate!**

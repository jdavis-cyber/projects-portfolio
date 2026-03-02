# Sprint Zero Interview Playbook

## Overview

This playbook replaces agent "guesswork" with a structured, decision-forcing interview sequence. During Sprint Zero, the Human Director (PM) will interact with specialized agents one by one. The output of these interviews directly populates the **System Specification Document**, which becomes the single source of truth for the remainder of the project.

## Interview Sequence & Dependencies

Interviews must be conducted in the exact order below. No agent can begin their interview until the preceding agent's spec section is validated.

1. **Business Analyst (BA)**
   - *Requires*: Nothing (First Interview)
   - *Populates*: System Overview, Success Metrics, User Personas
2. **Systems Engineer (SE)**
   - *Requires*: BA Interview Complete
   - *Populates*: Architecture Decisions, Tech Stack, Non-Functional Requirements
3. **Database Engineer (DBE)**
   - *Requires*: SE Interview Complete
   - *Populates*: Data Model, Schema Relationships, Storage Requirements
4. **DevOps Engineer (DevOps)**
   - *Requires*: SE Interview Complete
   - *Populates*: Infrastructure, CI/CD, Environments, Security
5. **UI/UX Designer (UX)**
   - *Requires*: BA Interview Complete
   - *Populates*: Design System, User Flows, Accessibility
6. **Frontend Developer (FE)**
   - *Requires*: UX & SE Interviews Complete
   - *Populates*: Component Architecture, State Management, API Consumption
7. **Backend Developer (BE)**
   - *Requires*: SE & DBE Interviews Complete
   - *Populates*: API Endpoints, Auth Rules, Business Logic
8. **QA Engineer (QA)**
   - *Requires*: All Above Complete
   - *Populates*: Test Strategy, Coverage Requirements, Acceptance Criteria

---

## The Question Sets

### 1. Business Analyst (BA)

**Purpose**: Define the "What" and the "Why".
**Questions**:

1. What is the single, primary outcome this system must achieve to be considered successful?
2. Who are the primary user roles? Name up to 3 roles and define their core permissions (e.g., Admin, Read-Only User, Editor).
3. Do you have a strict deadline or budget constraint that forces scope reduction, or are we optimizing for feature completeness?
4. What is the most significant risk to user adoption if we get it wrong?
5. Are there any strict legal or compliance frameworks we must adhere to from Day 1 (e.g., HIPAA, SOC2, fedRAMP)?

**Validation Checklist**:

- [ ] Primary outcome is measurable.
- [ ] User roles are explicitly named and permission bounds are set.
- [ ] Compliance scope is defined (Yes/No with specifics).

### 2. Systems Engineer (SE)

**Purpose**: Define the "Bones" and the "Stack".
**Questions**:

1. Are we building a monolithic application, microservices, or a serverless architecture?
2. What are your strict technology requirements for the backend and frontend frameworks? (e.g., Next.js, FastAPI, Node.js)
3. Will this system need to integrate with external third-party APIs? List them.
4. What is the expected initial traffic load, and how rapidly must the system scale?
5. Are we deploying to AWS, GCP, Azure, or somewhere else?

**Validation Checklist**:

- [ ] Architecture pattern selected.
- [ ] Frameworks named and versioned.
- [ ] External dependencies listed.
- [ ] A mermaid.js architecture diagram is generated and saved to `docs/architecture/system-architecture.md`.

### 3. Database Engineer (DBE)

**Purpose**: Define the "Memory" of the system.
**Questions**:

1. Will this application primarily use a Relational Database (SQL) or NoSQL? Specify the exact engine (e.g., PostgreSQL).
2. What are the core entities (nouns) in the system? (e.g., User, Project, Invoice).
3. Is data isolation required at the database level? (Multi-tenant schema, row-level security, or single schema)?
4. What is the expected data volume growth per month?
5. Are there specific data fields that must be encrypted at rest? (e.g., SSN, passwords).

**Validation Checklist**:

- [ ] Database engine selected.
- [ ] Minimum 3 core entities identified.
- [ ] Multi-tenancy strategy declared.

### 4. DevOps Engineer (DevOps)

**Purpose**: Define the "Pipes" and "Guards".
**Questions**:

1. Do you require separate Dev, Staging, and Production environments?
2. Will we deploy via containerization (Docker/Kubernetes) or direct server/PaaS deployment (Vercel/Heroku)?
3. What CI/CD platform will we use for build and deploy automation (GitHub Actions, GitLab CI, AWS CodePipeline)?
4. What are the uptime/SLA requirements? (e.g., 99.9%, Best Effort).
5. Should infrastructure be provisioned manually or via Infrastructure-as-Code (Terraform/CloudFormation)?

**Validation Checklist**:

- [ ] Environment count established.
- [ ] CI/CD platform locked in.
- [ ] Hosting paradigm decided.

### 5. UI/UX Designer (UX)

**Purpose**: Define the "Skin" and the "Feel".
**Questions**:

1. Are we leveraging an existing design system/component library (e.g., Material UI, TailwindUI, Radix) or building scratch custom CSS?
2. What is the primary color palette and layout archetype (e.g., Dashboard with sidebar, Marketing site, Feed)?
3. Do we need Dark Mode support at launch?
4. What is the most complex specific user flow in the application? Explain it step-by-step.
5. Are there strict accessibility requirements (e.g., WCAG 2.1 AA) we must pass before launch?

**Validation Checklist**:

- [ ] UI Framework/Component library selected.
- [ ] Layout archetype defined.
- [ ] One complex user flow detailed out.

### 6. Frontend Developer (FE)

**Purpose**: Define the "Client-Side Logic".
**Questions**:

1. Will we use global state management (e.g., Redux, Zustand) or rely primarily on server state (React Query) and local context?
2. How will the application handle authentication on the client side? (JWT in localStorage, HttpOnly Cookies, Auth0/NextAuth)?
3. Are there any complex client-side calculations, visualizations, or data grids required?
4. What routing strategy are we using (Client-side SPA routing, specific frameworks like Next App/Pages router)?

**Validation Checklist**:

- [ ] State management tool/pattern selected.
- [ ] Auth persistence method defined.
- [ ] Routing paradigm chosen.

### 7. Backend Developer (BE)

**Purpose**: Define the "API Contracts" and "Rules".
**Questions**:

1. Will the frontend communicate with the backend via REST, GraphQL, or RPC (e.g., tRPC)?
2. Where does identity reside? Are we building an internal user credential table or delegating to an Identity Provider (Okta, Keycloak, Auth0)?
3. How will endpoints be authorized? (e.g., Role-Based Access Control via middleware).
4. Do any backend tasks require asynchronous processing (Background queues like RabbitMQ, Celery/Redis)?

**Validation Checklist**:

- [ ] API paradigm (REST/GraphQL) selected.
- [ ] Identity provider determined.
- [ ] Authorization middleware pattern decided.

### 8. QA Engineer (QA)

**Purpose**: Define the "Safety Net".
**Questions**:

1. What is the mandatory unit test coverage threshold? (e.g., 80%, No strict % just critical paths).
2. Are we implementing End-to-End (E2E) testing at launch? If so, what tool (Cypress, Playwright)?
3. How will we perform API contract testing?
4. Do we need explicit load/performance testing before the first release?

**Validation Checklist**:

- [ ] Unit testing framework & coverage threshold set.
- [ ] E2E testing framework decided.

---

## Output Formats & Recording

As the Human Director answers these questions, the active agent will parse the responses and inject the formalized definitions directly into the `system_spec.md` (System Spec Template), under the specific section that agent oversees. If an answer contradicts a previously validated constraint, the agent must point out the contradiction and force a resolution before updating the spec.

Once Sprint Zero is complete and the `system_spec.md` is fully populated, the **Scrum Master** MUST run the `automation/validate_spec.py` un-filled placeholder check. The project cannot proceed to execution until the spec passes linting.

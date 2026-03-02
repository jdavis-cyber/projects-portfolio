# System Specification Document (Template)

**Project Name**: [Inject Project Name]
**Status**: [Draft / Validated]
**Last Updated**: [Date]

---

## Instructions for Agents

This document is the **Single Source of Truth** for the project. When operating in executing or planning modes, refer to the section relevant to your domain. **Do not hallucinate assumptions.** If a required detail is missing from this spec, escalate to the Scrum Master to re-engage the Human Director.

---

## A. System Overview

*Populated by: Business Analyst (BA)*

### Purpose & Problem Statement

*Describe what the system does and why it exists.*

- **Good Entry**: "A multi-tenant SaaS application that allows healthcare providers to securely log patient intake forms via OCR, reducing manual entry time."
- **Poor Entry**: "A healthcare app."

### Target Users & Permissions

*List explicitly the roles and what they can do.*

- **Good Entry**:
  - `Admin`: Can provision clinics, view billing, manage all users.
  - `Provider`: Can view and edit patient records within their assigned clinic only.
- **Poor Entry**: "People who use the clinic."

### Success Metrics & Constraints

*Define measurable success and hard constraints.*

- **Deadline**: [Date or N/A]
- **Core KPIs**: [E.g., < 2s page load, OCR accuracy > 95%]
- **Compliance Restrictions**: [E.g., HIPAA compliant, data must reside in US-East]

---

## B. Architecture Specification

*Populated by: Systems Engineer (SE) and DevOps Engineer (DevOps)*

### Technology Stack

*Define the exact technologies and versions where known.*

- **Frontend**: [e.g., Next.js 14 App Router, React 18, TailwindCSS]
- **Backend**: [e.g., FastAPI, Python 3.11]
- **Database**: [e.g., PostgreSQL 16]
- **Infrastructure**: [e.g., AWS ECS, Terraform managed]

### Architecture Diagram / Boundaries

*Describe the high-level flow (e.g., Frontend -> API Gateway -> Microservices -> Data Layer).*

### Non-Functional Requirements

- **Scalability**: [e.g., Support 1,000 concurrent users at launch]
- **Security**: [e.g., JWT Auth, TLS 1.3, AES-256 at rest]
- **Availability**: [e.g., 99.9% uptime requirement]

---

## C. Interface Contracts

*Populated by: Database Engineer (DBE), Backend Developer (BE), and Frontend Developer (FE)*

### Database Schema (DBE)

*Define the core tables, foreign keys, and indexes.*

- **Good Entry**: `Table: Users { id: uuid PK, email: varchar(255) UNIQUE, clinic_id: uuid FK, role: enum }`
- **Poor Entry**: "We need a users table."

### API Endpoints (BE)

*Explicitly list the REST/GraphQL endpoints, request formats, and response schemas.*

- **Good Entry**:
  - `GET /api/v1/patients/{id}`
  - **Auth Required**: Yes (Bearer Token)
  - **Response 200**: `{ "id": "uuid", "name": "string", "dob": "date" }`
  - **Response 403**: `{ "error": "Insufficient clinic permissions" }`

### Component Interfaces (FE)

*Define global state shape, routing patterns, and reusable UI contracts.*

---

## D. Agent Work Packages

*Auto-generated from the above sections.*

### 1. Database Engineer

- **Input Dependencies**: Section B (Tech Stack), Section C (Data Model)
- **Output Contract**: Provide `init_schema.sql` and `seed_data.sql`.
- **Validation**: Schema must successfully run locally via Docker without errors.

### 2. Backend Developer

- **Input Dependencies**: Section C (API Contracts & Schema)
- **Output Contract**: Provide standard API routes matching the defined endpoints.
- **Validation**: 100% of endpoints must pass `pytest` cases provided.

### 3. Frontend Developer

- **Input Dependencies**: Section B (UI Framework), Section C (Component Interfaces & API)
- **Output Contract**: React components mapping to defined user flows.
- **Validation**: Must pass accessibility audit (axe-core) and render without console errors.

---

## E. Decision Log (ADR)

*Populated by: Any Agent making a structural choice during Sprint Zero*

| Date | Agent | Decision Made | Rationale & Alternatives Considered |
|------|-------|---------------|-------------------------------------|
| [Date] | SE | Used PostgreSQL over MongoDB | Relational integrity required for billing ledgers. |
| [Date] | BE | Selected FastAPI over Django | Async support needed for OCR processing webhooks. |

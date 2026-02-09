# Governance Scope Statement (GSS) Template

## Document Metadata

| Field | Value |
|-------|-------|
| Document ID | GSS-[YYYYMMDD]-[ProjectCode] |
| Document Title | Governance Scope Statement for [AI System Name] |
| Version | 1.0 |
| Date Created | [Enter creation date: YYYY-MM-DD] |
| Last Updated | [Enter last update date: YYYY-MM-DD] |
| Author/Agent | [Enter name/agent identifier responsible for creation] |
| Responsible Owner | [Enter owner name and organization] |
| Document Status | [Draft / Review / Approved / Active / Archived] |
| Governance Phase | Phase 1 - Business Understanding |
| Applicable Standards | ISO 42001 Clause 4.3, Clause 5.1, NIST AI RMF GOVERN-2 |

---

## 1. Purpose & Scope

*Instructions: Define the purpose of this governance scope statement and the overall governance approach for the AI system. Establish boundaries and constraints on governance activities.*

### 1.1 Purpose Statement

[Enter purpose statement. Describe what this governance scope statement establishes and why it is necessary. Include the organizational decision it supports.]

### 1.2 Governance Program Scope

[Define the scope of governance activities covered by this statement. What aspects of the AI system will be governed? What is explicitly excluded?]

### 1.3 Time Horizon

| Time Period | Phase | Description |
|------------|-------|-------------|
| [Date range] | [Phase] | [What governance covers during this period] |
| [Date range] | [Phase] | [Coverage] |

### 1.4 Document Hierarchy & Authority

[Describe this document's relationship to other governance documentation. Indicate its authority level and how it flows to subordinate governance plans.]

---

## 2. AI System Boundary Definition

*Instructions: Precisely define what is included in ("in scope") and excluded from ("out of scope") the AI system and its governance. This prevents scope creep and ensures clear accountability.*

### 2.1 System-in-Scope Definition

[Provide precise technical and operational boundaries. Use diagrams or descriptions to clarify what constitutes the AI system.]

#### In-Scope Components

| Component | Description | Rationale |
|-----------|------------|-----------|
| [Component name] | [What it is, its function] | [Why included in governance scope] |
| [Component name] | [Description] | [Rationale] |

#### In-Scope Data

[Describe data flows, data types, and data handling that fall within governance scope.]

- **Input Data**: [Describe input data sources, types, volume, and sensitivity levels in scope]
- **Processing Data**: [Intermediate data, training data, feature stores, caches]
- **Output Data**: [Results, predictions, recommendations]

#### In-Scope Lifecycle Phases

[Indicate which CPMAI phases are subject to governance oversight (typically all six).]

- [ ] Phase 1 - Business Understanding
- [ ] Phase 2 - Data Management & Preparation
- [ ] Phase 3 - Model Development & Training
- [ ] Phase 4 - Evaluation & Validation
- [ ] Phase 5 - Deployment & Operations
- [ ] Phase 6 - Monitoring & Maintenance

### 2.2 System-Out-of-Scope Definition

*Instructions: Explicitly state what is NOT governed by this scope statement and why. This clarifies boundaries and identifies any governance gaps.*

| Out-of-Scope Area | Reason for Exclusion | Alternative Governance |
|------------------|-------------------|----------------------|
| [Area/System] | [Why not included in this scope] | [What governs this, if anything] |
| [Area/System] | [Reason] | [Alternative governance] |

### 2.3 Scope Boundaries & Interfaces

*Instructions: Document interfaces with systems and processes outside the governance scope. Identify handoffs and dependencies.*

| Interface | Connected System/Process | Governance Authority | Communication Protocol |
|-----------|-------------------------|----------------------|------------------------|
| [Interface name] | [External system] | [Who governs the external system] | [How information flows] |
| [Interface name] | [External system] | [Authority] | [Protocol] |

### 2.4 Organizational Boundaries

[Specify organizational units, departments, and external entities within governance scope.]

| Organizational Unit | Role in AI System | Governance Applicability |
|-------------------|------------------|--------------------------|
| [Unit name] | [Function] | [What governance applies to this unit] |
| [Unit name] | [Function] | [Applicability] |

---

## 3. Applicable Standards & Regulatory Requirements

*Instructions: Create a comprehensive map of all standards, frameworks, and regulations applicable to this AI system. Clarify applicability rationale for each.*

### Standards Applicability Matrix

| Standard/Regulation | Full Name | Applicability | Key Requirements | Implementation Status | Owner |
|-------------------|-----------|--------------|------------------|----------------------|-------|
| ISO 42001 | AI Management System | [Fully/Partially/Not Applicable] | [Key clauses/sections that apply] | [Not Started/In Progress/Implemented] | [Role] |
| NIST AI RMF | NIST AI Risk Management Framework | [Fully/Partially/Not Applicable] | [Functions/categories that apply] | [Status] | [Role] |
| NIST SP 800-53 | Security and Privacy Controls | [Fully/Partially/Not Applicable] | [Control families in scope] | [Status] | [Role] |
| CPMAI | AI ML Maturity Framework | [Fully/Partially/Not Applicable] | [Phases/practices covered] | [Status] | [Role] |
| DoD CSRMC | CSRMC Methodology | [Fully/Partially/Not Applicable] | [Artifacts/phases required] | [Status] | [Role] |
| [Regulatory] | [Full name, e.g., GDPR, AI Act, HIPAA] | [Applicability] | [Requirements] | [Status] | [Role] |

### Regulatory Requirements by Jurisdiction

| Jurisdiction | Applicable Regulations | Key Compliance Obligations | Compliance Status |
|------------|----------------------|--------------------------|------------------|
| [Country/Region] | [Law/Regulation name] | [Primary obligations] | [Compliant/Non-Compliant/In Progress] |
| [Jurisdiction] | [Regulation] | [Obligations] | [Status] |

### Industry-Specific Standards

*Instructions: If the AI system operates in a regulated industry (finance, healthcare, etc.), document industry-specific standards:*

| Industry Standard | Applicability | Key Sections | Implementation |
|-----------------|--------------|-------------|-----------------|
| [Standard name] | [Yes/No/Partial] | [Relevant sections] | [Status] |

### Data Protection & Privacy Frameworks

[Document applicable data protection regulations and privacy frameworks.]

- [ ] GDPR (General Data Protection Regulation) - [Applicability statement]
- [ ] CCPA (California Consumer Privacy Act) - [Applicability statement]
- [ ] HIPAA (Health Insurance Portability and Accountability Act) - [Applicability statement]
- [ ] Other: [Name and applicability]

---

## 4. Governance Structure

*Instructions: Establish the organizational structure, roles, responsibilities, and decision authority for AI governance. This section creates accountability.*

### 4.1 Governance Organization Chart

[Insert or describe organizational structure for AI governance. Include:]

```
[ASCII diagram or description of governance structure, e.g.:

AI Governance Board (Leadership)
  |
  +-- AI Risk & Compliance Committee
  |     +-- Data Governance Workgroup
  |     +-- Model Validation Workgroup
  |
  +-- Project Delivery Team
  |     +-- Business Analysis
  |     +-- Data Science Team
  |     +-- Engineering Team
  |
  +-- Operations & Monitoring
        +-- MLOps Team
        +-- Incident Response
]
```

### 4.2 Governance Roles & Responsibilities

*Instructions: Define each governance role, accountabilities, required competencies, and reporting relationships.*

| Role | Organizational Title | Key Responsibilities | Authority | Reporting To | Competency Requirements |
|------|---------------------|----------------------|-----------|--------------|------------------------|
| AI Governance Lead | [Title] | - Oversee governance execution<br>- Coordinate across functions<br>- Chair governance bodies | Approve governance decisions | [Executive] | [Skills: governance, AI, compliance] |
| Risk Lead | [Title] | - Risk identification & assessment<br>- Mitigation tracking<br>- Risk reporting | Monitor & escalate | [Governance Lead] | [Risk assessment, AI domain knowledge] |
| Data Steward | [Title] | - Data quality oversight<br>- Data provenance<br>- Access controls | Control data usage | [Governance Lead] | [Data management, compliance] |
| Model Validator | [Title] | - Technical validation<br>- Fairness assessment<br>- Performance monitoring | Validate models | [Risk Lead] | [ML expertise, testing, statistics] |
| Compliance Officer | [Title] | - Regulatory compliance<br>- Audit coordination<br>- Documentation | Ensure compliance | [Governance Lead] | [Compliance, regulatory knowledge] |
| [Role] | [Title] | [Responsibilities] | [Authority] | [Reports to] | [Competencies] |

### 4.3 Decision Authority Matrix

*Instructions: Document who has authority to make key governance decisions. Clarify escalation paths.*

| Decision Type | Decision | Authority | Escalation Path | Quorum Required |
|--------------|----------|-----------|-----------------|-----------------|
| Strategic | Approve/reject AI system deployment | [Executive sponsor or board] | [N/A or escalation target] | [Number/% of decision-makers] |
| Governance | Approve governance framework changes | [Governance committee] | [Executive sponsor] | [Quorum threshold] |
| Risk | Accept high-risk residual risk | [Risk committee] | [Chief Risk Officer or executive] | [Quorum] |
| Model | Approve model for production | [Model review board] | [Risk committee] | [Quorum] |
| Data | Approve new data source | [Data governance committee] | [Compliance officer] | [Quorum] |
| [Decision Type] | [Specific decision] | [Authority] | [Escalation] | [Quorum] |

### 4.4 Governance Bodies & Meetings

| Body | Purpose | Composition | Frequency | Key Outputs |
|------|---------|-----------|-----------|------------|
| AI Governance Board | Strategic oversight & decision-making | [List key roles] | [Monthly/Quarterly/As needed] | [Decisions, approvals, escalations] |
| Risk Committee | Risk assessment & mitigation tracking | [Roles] | [Frequency] | [Risk reports, mitigation plans] |
| Data Governance Council | Data management decisions | [Roles] | [Frequency] | [Data policies, approval decisions] |
| Model Review Board | Technical validation & approval | [Roles] | [Frequency] | [Model approvals, test results] |
| [Body name] | [Purpose] | [Composition] | [Frequency] | [Outputs] |

---

## 5. Lifecycle Methodology & Governance Touchpoints

*Instructions: Map the CPMAI lifecycle phases to governance activities, decision gates, and required documentation. Show when governance bodies convene and what they review.*

### CPMAI Phase Mapping with Governance Touchpoints

| Phase | Phase Name | Duration | Entry Criteria | Governance Touchpoints | Gate Review | Exit Criteria | Responsible Owner |
|-------|-----------|----------|----------------|----------------------|------------|---------------|-----------------|
| Phase 1 | Business Understanding | [Duration] | [What must be true to start] | - Governance scoping<br>- Risk assessment<br>- Stakeholder mapping | Phase 1 Gate Review | [What must be complete] | [Owner] |
| Phase 2 | Data Management & Preparation | [Duration] | [Criteria] | - Data governance approval<br>- Privacy assessment<br>- Quality baseline | Phase 2 Gate Review | [Criteria] | [Owner] |
| Phase 3 | Model Development & Training | [Duration] | [Criteria] | - Architecture review<br>- Fairness assessment<br>- Security review | Phase 3 Gate Review | [Criteria] | [Owner] |
| Phase 4 | Evaluation & Validation | [Duration] | [Criteria] | - Performance testing<br>- Bias testing<br>- Model approval | Phase 4 Gate Review | [Criteria] | [Owner] |
| Phase 5 | Deployment & Operations | [Duration] | [Criteria] | - Deployment approval<br>- Runbook review<br>- Monitoring setup | Phase 5 Gate Review | [Criteria] | [Owner] |
| Phase 6 | Monitoring & Maintenance | [Duration] | [Criteria] | - Performance monitoring<br>- Drift detection<br>- Incident management | Phase 6 Gate Review | [Criteria] | [Owner] |

### Key Governance Decisions by Phase

[Document critical governance decisions required at each phase, decision authority, and timeline for decisions.]

---

## 6. Stakeholder Register

*Instructions: Identify all stakeholders, their interest in the AI system, influence on governance, and required communication approach. Update throughout project lifecycle.*

### Stakeholder Identification & Analysis

| Stakeholder Name | Role/Title | Organization | Interest Type | Power | Interest | Engagement Strategy |
|-----------------|-----------|--------------|----------------|-------|----------|-------------------|
| [Name] | [Executive/Manager/Practitioner/etc.] | [Org unit] | [High/Medium/Low interest in AI system] | [High/Medium/Low influence] | [What they care about] | [How to engage: inform/consult/involve/lead] |
| [Name] | [Role] | [Org] | [Interest] | [Power] | [Interest] | [Strategy] |

### Stakeholder Communication Plan

| Stakeholder Group | Information Needs | Communication Frequency | Communication Method | Owner |
|------------------|-------------------|------------------------|----------------------|-------|
| [Group, e.g., "Executive Leadership"] | [What info they need: metrics, risks, status] | [Monthly/Quarterly/Ad-hoc] | [Email/Meeting/Report/Dashboard] | [Role] |
| [Group, e.g., "Technical Team"] | [Governance policies, standards, requirements] | [Weekly/As needed] | [Documentation/Meetings/Tools] | [Owner] |
| [Group] | [Information needs] | [Frequency] | [Method] | [Owner] |

### Governance Training & Competency Requirements

[Specify training and competency requirements for stakeholders involved in governance.]

- [ ] AI Governance Fundamentals (all participants)
- [ ] Risk Assessment & Mitigation (risk team)
- [ ] Regulatory Compliance & Standards (compliance team)
- [ ] Model Validation & Testing (technical team)
- [ ] Data Governance & Privacy (data team)
- [ ] Other: [Specify]

---

## 7. Success Criteria & Key Performance Indicators (KPIs)

*Instructions: Define measurable success criteria for the governance program. Include metrics that track governance effectiveness and program health.*

### Governance Program Success Criteria

| Success Criterion | Metric | Target | Baseline | Review Frequency |
|------------------|--------|--------|----------|-----------------|
| Governance execution | % of gate reviews completed on schedule | [Target %] | [Starting %] | [Monthly] |
| Risk management | % of identified risks with documented mitigation | [Target %] | [Starting %] | [Monthly] |
| Compliance | % of applicable standards with documented evidence | [Target %] | [Starting %] | [Quarterly] |
| Stakeholder engagement | % of stakeholders reporting good governance communication | [Target %] | [Baseline %] | [Quarterly] |
| Documentation | % of required governance documents complete | [Target %] | [Baseline %] | [Monthly] |
| Effectiveness | % reduction in governance-related incidents | [Target %] | [Baseline count] | [Quarterly] |

### AI System Performance KPIs

[Include KPIs that track the AI system's actual performance against governance objectives.]

| KPI | Metric | Target | Measurement Method | Owner |
|-----|--------|--------|-------------------|-------|
| [KPI name] | [How measured] | [Target value] | [How measured/tools used] | [Responsible role] |
| [KPI name] | [Metric] | [Target] | [Method] | [Owner] |

### Governance Maturity Assessment

[Define how governance maturity will be assessed over time, tied to CPMAI phases or governance standards.]

---

## 8. Constraints & Assumptions

*Instructions: Document constraints that limit governance scope and key assumptions upon which governance planning is based.*

### Organizational Constraints

| Constraint | Impact | Mitigation Strategy |
|-----------|--------|-------------------|
| [Resource limit, e.g., "Limited governance staff"] | [How it affects governance execution] | [Mitigation approach] |
| [Constraint, e.g., "Legacy system integration required"] | [Impact] | [Strategy] |

### Technical Constraints

[Document technical limitations affecting governance implementation.]

| Constraint | Impact | Mitigation |
|-----------|--------|-----------|
| [Constraint] | [Impact] | [Mitigation] |

### Regulatory Constraints

[Document regulatory or legal constraints.]

| Constraint | Impact | Mitigation |
|-----------|--------|-----------|
| [Constraint] | [Impact] | [Mitigation] |

### Key Assumptions

*Instructions: Document assumptions made during governance planning. Monitor and validate these throughout the project.*

| Assumption | Validation Method | Risk if Invalid | Contingency |
|-----------|-------------------|-----------------|------------|
| [Assumption, e.g., "Adequate governance resources will be available"] | [How to validate] | [What happens if false] | [Backup plan] |
| [Assumption] | [Validation] | [Risk] | [Contingency] |

---

## 9. Dependencies & Interfaces

*Instructions: Identify external and internal dependencies that affect governance execution. Document how governance interfaces with other programs.*

### External Dependencies

| Dependency | Provider | Impact | Mitigation |
|-----------|----------|--------|-----------|
| [External entity, e.g., "Regulatory guidance"] | [Who provides] | [How it affects governance] | [Risk management strategy] |
| [Dependency] | [Provider] | [Impact] | [Mitigation] |

### Internal Dependencies

[Document dependencies on other organizational programs, systems, or initiatives.]

| Dependency | Owner | Impact | Coordination Needed |
|-----------|-------|--------|-------------------|
| [Internal program/system] | [Owner] | [How it affects governance] | [How to coordinate] |

### Governance Integration Points

[Document how this governance program interfaces with related governance programs (IT governance, compliance programs, risk management, etc.).]

| Integration Point | External Program | Interface | Communication Plan |
|------------------|------------------|-----------|-------------------|
| [Interface, e.g., "IT security controls"] | [Program name] | [How they interface] | [How coordination happens] |

---

## 10. Revision & Scope Change Management

*Instructions: Document how changes to governance scope will be managed. Establish approval authority and communication requirements.*

### Scope Change Process

[Describe the process for requesting, evaluating, and approving changes to governance scope.]

1. **Change Request**: [Who can request changes, how to submit]
2. **Evaluation**: [Who evaluates, evaluation criteria]
3. **Approval Authority**: [Who approves scope changes]
4. **Implementation**: [How approved changes are communicated and implemented]
5. **Documentation**: [How changes are documented and tracked]

### Scope Change Triggers

[List conditions that may trigger governance scope changes:]

- [ ] Change in AI system scope or capability
- [ ] Change in regulatory/compliance requirements
- [ ] Change in applicable standards or frameworks
- [ ] Organizational restructuring affecting governance
- [ ] Integration with additional systems or processes
- [ ] Change in risk profile or risk tolerance
- [ ] Other: [Specify]

---

## Standards Alignment & Traceability

*Instructions: Document how this Governance Scope Statement satisfies applicable standards.*

### ISO 42001 Alignment

- **Clause 4.3 (Determining the Scope of the AI Management System)**: This document establishes the scope of governance activities and AI systems covered by the governance program.
- **Clause 5.1 (Leadership and Commitment)**: Document establishes governance structure and decision authority supporting leadership commitment.

### NIST AI RMF Alignment

- **GOVERN-2 (Institutional Policies and Accountability)**: Governance scope statement defines governance structure, roles, and accountability mechanisms required by NIST AI RMF.

### CPMAI Alignment

- **Phase 1 - Business Understanding**: Scope statement supports planning and governance setup activities in Phase 1.

---

## Revision History

| Version | Date | Author/Agent | Change Description | Status |
|---------|------|-------------|-------------------|--------|
| 1.0 | [YYYY-MM-DD] | [Name] | Initial creation | [Draft/Approved] |

---

## Approvals & Sign-Off

*Instructions: Document formal approval of the Governance Scope Statement by authorized stakeholders.*

### Approval Authority

| Role | Name | Organization | Decision | Date | Signature |
|------|------|--------------|----------|------|-----------|
| Governance Sponsor | [Name] | [Org] | Approved / Conditionally Approved / Not Approved | [YYYY-MM-DD] | [Signature] |
| Chief Compliance Officer | [Name] | [Org] | Approved / Conditionally Approved / Not Approved | [YYYY-MM-DD] | [Signature] |
| Executive Steering Committee | [Representative] | [Org] | Approved / Conditionally Approved / Not Approved | [YYYY-MM-DD] | [Signature] |

### Conditions for Approval (if Conditionally Approved)

[Document any conditions that must be met for full approval status.]

### Archival Information

- **Repository Location**: [Document management system path]
- **Backup Location**: [Secondary storage location]
- **Retention Period**: [Years]
- **Access Control**: [Public / Internal / Restricted]

---

**End of Governance Scope Statement Template**

# Mission-Risk-Profile (MRP) Template

## Document Metadata

| Field | Value |
|-------|-------|
| Document ID | MRP-[YYYYMMDD]-[ProjectCode] |
| Document Title | Mission-Risk Profile for [AI System Name] |
| Version | 1.0 |
| Date Created | [Enter creation date: YYYY-MM-DD] |
| Last Updated | [Enter last update date: YYYY-MM-DD] |
| Author/Agent | [Enter name/agent identifier responsible for creation] |
| Responsible Owner | [Enter owner name and organization] |
| Document Status | [Draft / Review / Approved / Active / Archived] |
| Governance Phase | Phase 1 - Business Understanding |
| Applicable Standards | CSRMC MRP, NIST AI RMF GOVERN-1, ISO 42001 Clause 6.1 |

---

## 1. Executive Summary

*Instructions: Provide a high-level summary (200-300 words) of the AI system, its mission criticality, primary risk domains, and key governance decisions. This section is for senior leadership and external stakeholders.*

[Enter executive summary here. Include: system purpose, key risk findings, and high-level mitigation strategy.]

---

## 2. Mission Context & Objectives

*Instructions: Establish the operational and strategic context for the AI system. Define what the system supports and why it matters to the organization.*

### 2.1 Mission Statement

[Enter a concise mission statement describing the AI system's primary purpose and intended impact.]

### 2.2 Strategic Alignment

*Instructions: Document how this AI system aligns with organizational strategic objectives, long-term plans, and business priorities.*

[Describe strategic alignment. Reference applicable strategic plans, business outcomes, and organizational objectives.]

### 2.3 Operational Environment

*Instructions: Characterize the environment in which the AI system operates. Include deployment context, user base, integration points, and operational constraints.*

| Aspect | Description |
|--------|-------------|
| Deployment Context | [Cloud/On-Premises/Hybrid/Edge/Other] |
| Geographic Scope | [Regional/National/International/Other] |
| User Population | [Number of users, user types, access patterns] |
| Integration Points | [Systems/processes the AI connects to] |
| Operating Hours | [24/7/Business hours/Other] |
| Critical Timing Requirements | [Any time-sensitive operational requirements] |
| Environmental Constraints | [Regulatory, technical, organizational] |

### 2.4 Organizational Risk Appetite

*Instructions: Define the organization's tolerance for risk in AI deployments, informed by industry, legal, and strategic factors.*

[Enter organizational risk appetite statement. Include any formal risk appetite thresholds and decision-making authority for risk acceptance.]

---

## 3. AI System Description

*Instructions: Provide technical and operational details about the AI system. Ensure sufficient specificity for risk assessment and governance decisions.*

### 3.1 System Identification

| Element | Value |
|---------|-------|
| System Name | [Enter official system name/acronym] |
| System Description | [Brief 2-3 sentence description of what the system does] |
| System Type/Category | [Predictive/Generative/Recommender/Classifier/Other] |
| AI Technique/Model Family | [Neural Network/Decision Tree/LLM/Ensemble/Other] |
| Foundation Model Used (if applicable) | [Model name, vendor, version] |
| Lifecycle Phase | [Development/Testing/Pilot/Production/Maintenance/Retirement] |
| System Version | [Enter current version number] |

### 3.2 Purpose & Intended Use

[Describe the specific problem the AI system solves. Include intended users, decision processes supported, and expected business value.]

### 3.3 Key Features & Capabilities

[List primary capabilities. Include what the system can do and under what conditions.]

### 3.4 Input Data & Data Sources

| Data Element | Source | Volume | Update Frequency | Sensitivity Level |
|--------------|--------|--------|------------------|-------------------|
| [Data Type 1] | [Source] | [Size/count] | [Daily/Weekly/Real-time/Other] | [Public/Internal/Confidential/Restricted] |
| [Data Type 2] | [Source] | [Size/count] | [Daily/Weekly/Real-time/Other] | [Public/Internal/Confidential/Restricted] |

### 3.5 Output & Decision Support

[Describe outputs generated, format, and how they are used. Include decision authority and human review requirements.]

### 3.6 Operational Interfaces & Integration

[List systems the AI integrates with. Include APIs, databases, and downstream process connections.]

---

## 4. Mission Risk Assessment

*Instructions: Conduct a structured risk assessment using the AI Risk Governance Taxonomy. Identify risks across seven domains: Technical, Ethical, Operational, Cybersecurity, Privacy, Regulatory, and Mission-Driven. Complete a row for each identified risk.*

### Risk Identification & Analysis Matrix

| Risk ID | Risk Domain | Risk Description | Likelihood | Impact | Risk Level | Mitigation Strategy | Owner |
|---------|-------------|------------------|------------|--------|------------|-------------------|-------|
| MRP-R-001 | [Domain] | [Clear description of risk: condition that could occur and consequences] | [H/M/L] | [H/M/L] | [H/M/L] | [Specific mitigation action(s) with timeline] | [Assigned role] |
| MRP-R-002 | [Domain] | [Risk description] | [H/M/L] | [H/M/L] | [H/M/L] | [Mitigation strategy] | [Assigned role] |

*Instructions: Use the following guidance for risk domains:*
- **Technical**: Model accuracy, performance degradation, algorithmic bias, system reliability, integration failures
- **Ethical**: Fairness concerns, transparency gaps, accountability issues, unintended consequences, stakeholder impacts
- **Operational**: Process disruptions, user adoption barriers, operational complexity, change management, training gaps
- **Cybersecurity**: Unauthorized access, adversarial attacks, model poisoning, supply chain vulnerabilities
- **Privacy**: Data collection/use, PII exposure, consent violations, retention violations, third-party data sharing
- **Regulatory**: Compliance violations, regulatory change impacts, jurisdictional conflicts, audit/reporting gaps
- **Mission-Driven**: Failure to support critical mission functions, degraded mission outcomes, system unavailability

### Risk Ranking Summary

*Instructions: Summarize the distribution of identified risks by level.*

| Risk Level | Count | Percentage | Primary Domains |
|-----------|-------|-----------|-----------------|
| High | [Count] | [%] | [List domains with high risks] |
| Medium | [Count] | [%] | [List domains with medium risks] |
| Low | [Count] | [%] | [List domains with low risks] |

---

## 5. Mission-Critical Functions

*Instructions: Identify and document the critical functions this AI system supports. Rate criticality and assess degradation impact.*

| Function ID | Function Name | Business Process Supported | Criticality Rating | Acceptable Degradation | Impact if Unavailable | Fallback/Manual Process |
|-------------|--------------|---------------------------|-------------------|----------------------|----------------------|------------------------|
| MCF-001 | [Function name] | [Process name] | [Critical/High/Medium/Low] | [Time/Percentage tolerance] | [Operational, financial, safety, or mission impact] | [Documented alternative process] |
| MCF-002 | [Function name] | [Process name] | [Critical/High/Medium/Low] | [Time/Percentage tolerance] | [Impact description] | [Alternative process] |

### Critical Function Dependencies

[Document dependencies between critical functions. Include internal system dependencies and external system/process dependencies.]

---

## 6. Stakeholder Impact Analysis

*Instructions: Identify all stakeholder groups affected by the AI system and assess impact severity. Include direct and indirect stakeholders.*

### Stakeholder Groups & Impact Assessment

| Stakeholder Group | Impact Type | Severity | Mitigation Strategy | Communication Plan |
|------------------|-------------|----------|-------------------|-------------------|
| [Group name, e.g., "End Users"] | [Positive/Negative/Both] | [H/M/L] | [Mitigation approach] | [How will group be informed/involved] |
| [Group name, e.g., "Data Subjects"] | [Positive/Negative/Both] | [H/M/L] | [Mitigation approach] | [Communication plan] |

*Instructions: Include stakeholders such as:*
- End users of the AI system
- Data subjects (individuals whose data is used)
- Organizational leadership and business units
- Compliance/governance functions
- IT operations and security teams
- External partners and vendors
- Regulatory authorities
- Public/affected communities

### Vulnerable Populations & Protected Groups

[Identify any vulnerable populations or legally protected groups (e.g., by race, gender, age, disability status) that may be differentially impacted. Document specific safeguards.]

---

## 7. Risk Tolerance & Acceptance Criteria

*Instructions: Establish organizational thresholds for risk acceptance. Define what risk levels are tolerable across each domain.*

### Risk Tolerance by Domain

| Domain | Risk Tolerance Level | Acceptable Residual Risk | Decision Authority | Notes |
|--------|-------------------|------------------------|-------------------|-------|
| Technical | [High/Medium/Low] | [Specific threshold, e.g., "Model accuracy ≥ 92%"] | [Role/Committee] | [Additional context] |
| Ethical | [High/Medium/Low] | [Specific threshold, e.g., "Fairness metrics within ±2%"] | [Role/Committee] | [Context] |
| Operational | [High/Medium/Low] | [Specific threshold] | [Role/Committee] | [Context] |
| Cybersecurity | [High/Medium/Low] | [Specific threshold] | [Role/Committee] | [Context] |
| Privacy | [High/Medium/Low] | [Specific threshold] | [Role/Committee] | [Context] |
| Regulatory | [High/Medium/Low] | [Specific threshold] | [Role/Committee] | [Context] |
| Mission-Driven | [High/Medium/Low] | [Specific threshold] | [Role/Committee] | [Context] |

### Risk Acceptance Governance

[Document process for formally accepting residual risks, including approval authority, documentation requirements, and monitoring conditions.]

---

## 8. Initial Control Recommendations

*Instructions: Based on identified risks, recommend specific controls to mitigate them. Map controls to risk IDs. Provide implementation guidance.*

### Recommended Controls by Risk Domain

| Risk ID(s) | Risk Domain | Control Recommendation | Control Type | Implementation Status | Owner | Target Implementation Date |
|-----------|------------|----------------------|--------------|----------------------|-------|--------------------------|
| MRP-R-001 | [Domain] | [Specific control: what should be implemented] | [Preventive/Detective/Corrective] | [Not Started/In Progress/Complete] | [Role] | [YYYY-MM-DD] |
| MRP-R-002 | [Domain] | [Control description] | [Type] | [Status] | [Role] | [Date] |

### Control Implementation Roadmap

[Provide timeline and sequencing for control implementation across the project lifecycle. Indicate which controls are mandatory before production deployment.]

---

## 9. Update Schedule & Triggers

*Instructions: Define when the MRP will be reviewed and updated, and what events trigger immediate updates.*

### Scheduled Reviews

| Review Type | Frequency | Responsible Role | Documentation Location |
|------------|-----------|------------------|----------------------|
| Standard Review | [Quarterly/Semi-annually/Annually] | [Role] | [Where reviewed MRP is archived] |
| Pre-Gate Review | [Before each phase gate] | [Role] | [Storage location] |

### Triggers for Immediate Update

*Instructions: List conditions that require immediate MRP update and reassessment:*

- [ ] Significant change in system scope or capability
- [ ] Integration with new critical systems or data sources
- [ ] Regulatory or compliance requirement change
- [ ] Incident or near-miss event
- [ ] Major model retraining or performance degradation
- [ ] Change in data sources or data quality issues
- [ ] Change in intended user population or use cases
- [ ] External threat intelligence or vulnerability disclosure
- [ ] Organizational strategic change affecting system criticality
- [ ] Other: [Specify]

---

## Standards Alignment & Traceability

*Instructions: Document how this MRP satisfies applicable governance standards.*

### CSRMC Alignment

- **CSRMC MRP Core Artifact**: This document constitutes the Mission-Risk Profile required by CSRMC methodology.
- **Coverage**: Mission context, risk assessment, and control recommendations align to CSRMC Phase 1 requirements.

### NIST AI RMF Alignment

- **Satisfies: NIST AI RMF GOVERN-1 (Policy, Governance, and Oversight)**
  - Mission risk assessment documents organizational governance approach to AI risk
  - Stakeholder engagement and risk tolerance establishment supports governance framework

### ISO 42001 Alignment

- **Satisfies: ISO 42001 Clause 6.1 (Planning)**
  - Section 2 (Mission Context) establishes planning context
  - Section 4 (Risk Assessment) supports risk identification requirements
  - Section 7 (Risk Tolerance) documents acceptance criteria

---

## Revision History

| Version | Date | Author/Agent | Change Description | Status |
|---------|------|-------------|-------------------|--------|
| 1.0 | [YYYY-MM-DD] | [Name] | Initial creation | [Draft/Approved] |

---

## Approvals & Sign-Off

*Instructions: Document formal approval of this Mission-Risk Profile by authorized decision-makers.*

### Approval Authority

| Role | Name | Organization | Decision | Date | Signature |
|------|------|--------------|----------|------|-----------|
| AI Program Director | [Name] | [Org] | Approved / Conditionally Approved / Not Approved | [YYYY-MM-DD] | [Signature] |
| Risk/Compliance Lead | [Name] | [Org] | Approved / Conditionally Approved / Not Approved | [YYYY-MM-DD] | [Signature] |
| Business Sponsor | [Name] | [Org] | Approved / Conditionally Approved / Not Approved | [YYYY-MM-DD] | [Signature] |

### Conditions for Approval (if Conditionally Approved)

[Document any conditions that must be met for full approval status.]

### Archival Information

- **Repository Location**: [Document management system path]
- **Backup Location**: [Secondary storage location]
- **Retention Period**: [Years]
- **Access Control**: [Public / Internal / Restricted]

---

**End of Mission-Risk Profile Template**

# Corrective Action Register

## Document Metadata

| Field | Value |
|-------|-------|
| **Document ID** | CAR-[YYYY-MM-DD]-[ProjectID] |
| **Version** | [Enter version number, e.g., 1.0] |
| **Date Created** | [YYYY-MM-DD] |
| **Last Updated** | [YYYY-MM-DD] |
| **Author/Agent** | [Enter creator name/agent ID] |
| **Maintained By** | [Enter primary maintainer name/role] |
| **Status** | [Draft/Review/Active/Archived] |
| **Current Phase** | [Phase I/II/III/IV/V/VI] |
| **Review Cycle** | [Weekly/Bi-weekly/Monthly] |
| **Next Review Date** | [YYYY-MM-DD] |
| **Total Open CARs** | [Count] |
| **Total Closed CARs** | [Count] |

---

## 1. Purpose and Governance

*Instructions: This register tracks all corrective actions identified throughout the AI system lifecycle. It provides visibility into findings, remediation progress, and closure verification. Maintain as a living document throughout project execution and operational phases.*

**1.1 Purpose**

The Corrective Action Register (CAR) serves as:
- Master tracking log for all findings requiring remediation
- Evidence artifact demonstrating commitment to continuous improvement
- Tool for managing dependencies, escalations, and overdue items
- Audit trail of findings and corrective actions for regulatory compliance
- Mechanism for organizational learning and repeat finding prevention

**1.2 Sources of Findings**

Findings enter the CAR from multiple sources:

| Source | Description | Frequency | Priority |
|--------|-------------|-----------|----------|
| **Phase Gate Review** | Findings from phase gate assessments | At each phase gate | High |
| **Continuous Compliance Verification (CCV)** | Findings from ongoing compliance assessments | Quarterly | High |
| **Internal Audit** | Findings from internal audits | Quarterly/Annual | High |
| **External Audit/Assessment** | Findings from third-party audits or certifications | Annual or on-demand | Critical |
| **Self-Annealing/Self-Assessment** | Issues identified by team; proactive improvements | Continuous | Medium |
| **Incident/Root Cause Analysis** | Corrective actions arising from incidents | As incidents occur | High/Critical |
| **Governance Review** | Issues identified during operational reviews | Monthly/Quarterly | Medium |
| **Monitoring & Operations** | Performance issues or anomalies | Continuous | Medium |

**1.3 CAR Lifecycle**

```
Finding Identified → Logged in CAR → Root Cause Analysis →
Corrective Action Assigned → Implementation Begins →
Verification Testing → Closure Sign-Off → CAR Closed
```

**1.4 Escalation Model**

- **Overdue Items**: Escalate after 2 weeks past due date to manager
- **Critical Severity**: Escalate immediately to CRO/CAO
- **High Severity Overdue**: Escalate after 1 week to director level
- **Repeated Finding**: Escalate to VP/CRO for process improvement

---

## 2. Corrective Action Register

*Instructions: This is the master table of all findings and corrective actions. Maintain complete, current entries. Add new rows as findings are identified. Update status, verification, and closure information as work progresses.*

*Satisfies: ISO 42001 Clause 10.2, NIST SP 800-53 CA-5*

| CAR ID | Finding Source | Finding ID | Date Identified | Description | Severity | Root Cause | Corrective Action Description | Assigned To | Due Date | Status | % Complete | Verification Method | Verified By | Verification Date | Evidence Reference | Owner Sign-off | Days Open | Trend |
|--------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| [CAR-001] | [Source] | [FND-XXX] | [YYYY-MM-DD] | [Finding description] | [Critical/High/Medium/Low] | [Root cause analysis] | [What action will remediate?] | [Owner name] | [YYYY-MM-DD] | [Open/In Progress/Implemented/Verified/Closed] | [0-100%] | [Test/Review/Audit/Demo] | [Verifier name] | [YYYY-MM-DD] | [Link to evidence] | [Name] | [#] | [On Track/At Risk/Overdue] |
| | | | | | | | | | | | | | | | | | | |

**Column Definitions:**

- **CAR ID**: Unique identifier (CAR-001, CAR-002, etc.)
- **Finding Source**: Where finding originated (Phase Gate, CCV, Audit, Incident, etc.)
- **Finding ID**: Link to original finding (e.g., AUDIT-FINDING-001)
- **Date Identified**: When finding was first identified (YYYY-MM-DD)
- **Description**: Clear description of the finding and why it's non-compliant
- **Severity**:
  - **Critical**: Major non-compliance; significant risk; immediate action required
  - **High**: Significant finding; remediation required within 30 days
  - **Medium**: Moderate finding; remediation within 60 days acceptable
  - **Low**: Minor finding; remediation within 90 days acceptable
- **Root Cause**: Analysis of why the finding occurred (use 5-Why technique)
- **Corrective Action Description**: Specific, measurable action to remediate the finding
- **Assigned To**: Person/role accountable for executing the corrective action
- **Due Date**: Target completion date for corrective action
- **Status**:
  - **Open**: Not yet started
  - **In Progress**: Work underway; on track for due date
  - **Implemented**: Corrective action completed but not yet verified
  - **Verified**: Verification testing completed; closure pending sign-off
  - **Closed**: Verification complete and accepted
- **% Complete**: Percentage of corrective action work completed
- **Verification Method**: How completion will be verified (Test/Review/Audit/Demo/Other)
- **Verified By**: Person who conducted verification
- **Verification Date**: When verification was completed
- **Evidence Reference**: Link to artifact proving compliance (document, test result, etc.)
- **Owner Sign-off**: Approval by appropriate authority that CAR is closed
- **Days Open**: How many days CAR has been open (calculated)
- **Trend**: Status against due date (On Track/At Risk/Overdue)

---

## 3. Severity Levels & Examples

*Instructions: Understand the severity classification system to ensure findings are categorized appropriately.*

| Severity | Definition | Timeline | Examples | Escalation |
|----------|-----------|----------|----------|-----------|
| **Critical** | Poses immediate significant risk to safety, security, regulatory compliance, or operations | Immediate (1-2 days) | Unencrypted PII exposure; critical security vulnerability; regulatory violation; model producing systematically biased outputs affecting protected groups | Immediate to CRO, CAO, Executive |
| **High** | Significant gap in governance, control, or compliance; materially affects risk posture | 30 days | Missing security control; incomplete data quality documentation; fairness testing gaps; inadequate incident response procedures | Within 3 days to VP/Director |
| **Medium** | Moderate gap; process improvement needed but does not immediately impair operations | 60 days | Incomplete evidence documentation; outdated procedures; minor monitoring gaps; process inefficiency | Within 1 week to Manager |
| **Low** | Minor issue; nice-to-have improvement or documentation clarification | 90 days | Formatting/clarity issues in documentation; minor procedural updates; suggested process improvements | Tracked for next cycle |

---

## 4. Corrective Action by Source

*Instructions: Summarize corrective actions by their originating source. This helps identify patterns and systemic issues.*

### 4.1 Phase Gate Findings

| Phase | CAR IDs | Count | Critical | High | Medium | Low | Status |
|-------|---------|-------|----------|------|--------|-----|--------|
| Phase I | [CAR-XXX, CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [Open/Closed] |
| Phase II | [CAR-XXX, CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [Open/Closed] |
| Phase III | [CAR-XXX, CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [Open/Closed] |
| Phase IV | [CAR-XXX, CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [Open/Closed] |
| Phase V | [CAR-XXX, CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [Open/Closed] |
| Phase VI | [CAR-XXX, CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [Open/Closed] |
| **TOTAL** | | [#] | [#] | [#] | [#] | [#] | |

### 4.2 Continuous Compliance Verification (CCV) Findings

| Assessment Period | CAR IDs | Count | Critical | High | Medium | Low | Closure Rate |
|-------------------|---------|-------|----------|------|--------|-----|--------------|
| [Q1/Q2/Q3/Q4 YYYY] | [CAR-XXX, CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [%] |
| | | | | | | | |

### 4.3 Audit Findings

| Audit Type | Date | CAR IDs | Count | Critical | High | Medium | Low | Closure Status |
|-----------|------|---------|-------|----------|------|--------|-----|----------------|
| Internal Audit | [YYYY-MM-DD] | [CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [% Closed] |
| External Audit | [YYYY-MM-DD] | [CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [% Closed] |
| Certification Assessment | [YYYY-MM-DD] | [CAR-XXX, ...] | [#] | [#] | [#] | [#] | [#] | [% Closed] |
| | | | | | | | | |

### 4.4 Incident-Related Corrective Actions

| Incident ID | Date | CAR IDs | Description | Root Cause Category | Resolution Status |
|-----------|------|---------|-------------|-------------------|------------------|
| [INC-001] | [YYYY-MM-DD] | [CAR-XXX, CAR-XXX] | [Incident summary] | [People/Process/Technology] | [Open/Closed] |
| | | | | | |

---

## 5. Overdue Actions

*Instructions: Provide a focused view of all overdue corrective actions requiring immediate escalation and management attention.*

### 5.1 Critical Overdue Items

| CAR ID | Finding | Assigned To | Original Due Date | Days Overdue | Current Status | Blocker? | Escalation Action |
|--------|---------|-------------|------------------|--------------|----------------|---------|------------------|
| [CAR-XXX] | [Description] | [Owner] | [YYYY-MM-DD] | [# days] | [Status] | [Yes/No] | [Action taken] |
| | | | | | | | |

**Escalation Actions for Critical Overdue Items:**
- Contact owner immediately to determine status
- Identify and remove blockers
- Increase resources if necessary
- Escalate to management for attention
- Document reason for delay
- Adjust due date only if justified with plan

### 5.2 High Severity Overdue Items

| CAR ID | Finding | Assigned To | Original Due Date | Days Overdue | Current Status | Next Action |
|--------|---------|-------------|------------------|--------------|----------------|------------|
| [CAR-XXX] | [Description] | [Owner] | [YYYY-MM-DD] | [# days] | [Status] | [Next step] |
| | | | | | | |

---

## 6. Trend Analysis

*Instructions: Track trends over time to understand corrective action efficiency and identify systemic issues.*

### 6.1 Corrective Actions Opened vs. Closed

| Period | CAR-Opened | CAR-Closed | Net Change | Backlog |
|--------|-----------|-----------|-----------|---------|
| [YYYY-MM] | [#] | [#] | [+/-#] | [#] |
| [YYYY-MM] | [#] | [#] | [+/-#] | [#] |
| [YYYY-MM] | [#] | [#] | [+/-#] | [#] |

*Guidance: Ideally, closures should exceed openings each period. If backlog is growing, increase resources or review blockers.*

### 6.2 Average Time to Close by Severity

| Severity | Count | Avg Days to Close | 90th Percentile | Target | Status |
|----------|-------|------------------|-----------------|--------|--------|
| Critical | [#] | [# days] | [# days] | 7 days | [On Target/At Risk] |
| High | [#] | [# days] | [# days] | 30 days | [On Target/At Risk] |
| Medium | [#] | [# days] | [# days] | 60 days | [On Target/At Risk] |
| Low | [#] | [# days] | [# days] | 90 days | [On Target/At Risk] |

### 6.3 Finding Category Trends

*Identify if certain types of findings recur, indicating systemic issues.*

| Finding Category | Q1 Count | Q2 Count | Q3 Count | Q4 Count | Trend | Root Pattern |
|-----------------|----------|----------|----------|----------|-------|-------------|
| [Governance] | [#] | [#] | [#] | [#] | [↑/→/↓] | [Systemic issue?] |
| [Requirements/Data] | [#] | [#] | [#] | [#] | [↑/→/↓] | [Systemic issue?] |
| [Development] | [#] | [#] | [#] | [#] | [↑/→/↓] | [Systemic issue?] |
| [Testing/Validation] | [#] | [#] | [#] | [#] | [↑/→/↓] | [Systemic issue?] |
| [Security] | [#] | [#] | [#] | [#] | [↑/→/↓] | [Systemic issue?] |
| [Operations] | [#] | [#] | [#] | [#] | [↑/→/↓] | [Systemic issue?] |
| **TOTAL** | [#] | [#] | [#] | [#] | [↑/→/↓] | |

### 6.4 Repeat Finding Analysis

*Track findings that recur, indicating failure of initial corrective action.*

| Original CAR ID | Original Finding | Date Closed | Repeat CAR ID | Date Reopened | Root Cause of Repeat | New Corrective Action |
|-----------------|-----------------|------------|---------------|--------------|-------------------|-----------------------|
| [CAR-XXX] | [Finding] | [YYYY-MM-DD] | [CAR-YYY] | [YYYY-MM-DD] | [Why did it happen again?] | [Enhanced action] |
| | | | | | | |

**Repeat Finding Guidance:**
- If a finding recurs within 90 days of closure, the original corrective action was likely insufficient
- Escalate repeats to management; they indicate systemic issues
- For repeat findings, conduct more thorough root cause analysis
- Consider process changes, training, or system redesign

---

## 7. Escalation Log

*Instructions: Document all corrective actions escalated due to severity, overdue status, or other factors. Use this to track escalation effectiveness.*

| Date | CAR ID | Finding | Escalation Reason | Escalated To | Action Taken | Resolution Date | Resolved |
|------|--------|---------|------------------|--------------|-------------|-----------------|----------|
| [YYYY-MM-DD] | [CAR-XXX] | [Finding] | [Reason: Critical/Overdue/Blocker/Repeat] | [Executive name/title] | [Action taken] | [YYYY-MM-DD] | [Yes/No] |
| | | | | | | | |

**Escalation Triggers:**
- **Severity Escalation**: Critical items escalate to CRO/CAO immediately
- **Timeline Escalation**: Overdue items escalate per escalation model (see Section 1.4)
- **Blocker Escalation**: Items blocked by external dependencies escalate to sponsoring executive
- **Repeat Finding Escalation**: Repeated findings escalate to VP/process owner
- **Resource Escalation**: Items blocked by resource constraints escalate to VP/PMO

---

## 8. Root Cause Analysis Framework

*Instructions: Use structured RCA techniques to identify true root causes rather than symptoms. Document RCA approach in each CAR.*

### 8.1 5-Why Technique Example

**Finding**: Inadequate data quality documentation discovered during Phase II gate

```
Why 1: Data quality documentation is incomplete
  → Because requirements for documentation weren't clear

Why 2: Requirements for documentation weren't clear
  → Because data governance policy was not finalized early

Why 3: Data governance policy was not finalized early
  → Because governance team lacked dedicated resources

Why 4: Governance team lacked dedicated resources
  → Because initial project budget did not allocate sufficient governance capacity

Why 5: Budget did not account for governance needs
  → Because planning phase (Phase I) did not include data governance discipline properly

ROOT CAUSE: Insufficient governance capacity planning in Phase I
```

### 8.2 RCA Documentation Template

| Section | Content |
|---------|---------|
| **Finding Description** | [Clear statement of what is wrong] |
| **Immediate Cause** | [What directly caused the finding?] |
| **Why 1** | [Why did immediate cause occur?] |
| **Why 2** | [Why did Why 1 occur?] |
| **Why 3** | [Why did Why 2 occur?] |
| **Why 4** | [Why did Why 3 occur?] |
| **Root Cause(s)** | [Fundamental systemic issue(s)] |
| **Contributing Factors** | [Other factors that contributed] |
| **Corrective Actions** | [Actions to address root cause, not just symptom] |

---

## 9. Verification & Closure Process

*Instructions: Establish clear criteria and process for verifying that corrective actions actually remedy the finding.*

### 9.1 Verification Methods

| Method | Applicability | Effectiveness | Evidence |
|--------|--------------|---------------|----------|
| **Test/Re-test** | Technical issues, system changes | High | Test results, pass/fail report |
| **Documentation Review** | Process, procedure, policy issues | Medium | Updated document with review sign-off |
| **Audit/Re-audit** | Control issues, governance gaps | High | Audit report confirming remediation |
| **Demonstration** | Operational, training issues | Medium | Demo notes, observer sign-off |
| **Inspection** | Physical/environmental issues | Medium | Inspection checklist, photos |
| **Interview/Assessment** | People/competency issues | Medium | Interview notes, assessment results |
| **Metrics/Monitoring** | Performance, ongoing compliance issues | High | Metric report showing improvement |
| **Certification** | Third-party validation | High | Certificate or assessment report |

### 9.2 Closure Criteria

A corrective action can only be closed when:

1. **Corrective Action Completed**: Work is finished and implemented
2. **Verification Conducted**: Appropriate verification method completed
3. **Verification Successful**: Verification confirms finding is remediated
4. **Evidence Documented**: Proof of verification linked to CAR
5. **Owner Approval**: Owner/manager signs off that CAR is resolved
6. **Documentation Updated**: Related policies/procedures updated if needed
7. **Stakeholders Notified**: Relevant parties informed of closure

### 9.3 Closure Sign-Off

| Role | Responsibility | Sign-off Required |
|------|---------------|--------------------|
| **Corrective Action Owner** | Verify action completed | Yes |
| **Verification Conductor** | Verify remediation effective | Yes |
| **Functional Manager** | Approve closure | Yes |
| **CAR Owner/Maintainer** | Final closure in register | Yes |

### 9.4 Post-Closure Monitoring

For Critical and High severity CARs:
- Monitor area for 90 days post-closure
- Include in next governance review
- If repeat finding occurs within 90 days, reopen CAR and escalate

---

## 10. Integration with Risk Register

*Instructions: Corrective actions often address risks identified in the risk register. Maintain traceability between CAR and Risk Register.*

### 10.1 CAR-to-Risk Mapping

| CAR ID | Related Risk ID | Finding | Risk Mitigation | Status |
|--------|-----------------|---------|----------------|--------|
| [CAR-XXX] | [RK-XXX] | [Finding] | [How CAR mitigates the risk] | [CAR status → Risk status change] |
| | | | | |

**Guidance:**
- When a CAR closes, review related Risk Register to determine if risk level changes
- Successful closure of mitigation strategies should reduce likelihood/impact in Risk Register
- Update Risk Register residual risk levels when related CARs close

### 10.2 Risk-to-CAR Traceability

When updating Risk Register, link to related CARs:
- **Mitigation Strategy column**: Reference CAR IDs implementing the strategy
- **Progress tracking**: CAR status indicates mitigation implementation progress
- **Residual risk**: Update based on CAR closure status

---

## 11. Satisifes

**Standards Alignment:**
- ISO 42001:2024 Clause 10.2 (Nonconformity and Corrective Action)
- NIST SP 800-53 Control CA-5 (Corrective Action Program)
- NIST AI RMF Function: MANAGE-6 (Manage Incidents)
- CPMAI Phase: Phase III-VI (with ongoing capability during operations)

---

## 12. Revision History

| Version | Date | Author | Changes | Status |
|---------|------|--------|---------|--------|
| 1.0 | [YYYY-MM-DD] | [Author Name] | Initial template creation | [Draft/Approved] |
| | | | | |

---

## 13. Approvals and Sign-Off

| Role | Name | Signature | Date | Notes |
|------|------|-----------|------|-------|
| CAR Register Owner | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Governance Lead | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Chief Risk Officer | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Chief AI Officer (if applicable) | [Enter name] | ________________ | [YYYY-MM-DD] | |

---

**Document Control**

- **Classification**: [Confidential/Internal/Public]
- **Distribution**: [List authorized recipients]
- **Retention Period**: [Minimum 3 years post-project]
- **Review Frequency**: [Weekly/Bi-weekly/Monthly during active remediation]
- **Escalation Authority**: [CRO/CAO/VP/Director per severity]
- **Archival**: Upon project closure, archive CAR as part of permanent project records; retain for audit trail and organizational learning

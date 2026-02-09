# Governance Review Template

## Document Metadata

| Field | Value |
|-------|-------|
| **Document ID** | GR-[ReviewType]-[YYYY-MM-DD]-[ProjectID] |
| **Version** | [Enter version number, e.g., 1.0] |
| **Review Type** | [Operational/Governance/Executive/Audit] |
| **Review Date** | [YYYY-MM-DD] |
| **Review Period** | [Start date] to [End date] |
| **Status** | [Draft/Completed/Approved/Archived] |
| **Current Phase** | [Phase I/II/III/IV/V/VI] |
| **Next Scheduled Review** | [YYYY-MM-DD] |

---

## 1. Review Administration

*Instructions: Document the basic information about this review instance, including participants, facilitator, and organizational context.*

**1.1 Review Type**

Select one:
- [ ] **Operational Review** (Weekly) - Focus on telemetry, system health, issues, anomalies
- [ ] **Governance Review** (Bi-weekly/Monthly) - Focus on risk, compliance, SoA, documentation
- [ ] **Executive Review** (Monthly/Quarterly) - Focus on risk appetite, strategic alignment, performance
- [ ] **Audit Review** (Quarterly/Annual) - Focus on internal audits, external assessments, certification

**1.2 Review Details**

| Attribute | Details |
|-----------|---------|
| **Facilitator** | [Name/Role] |
| **Attendees** | [List names and roles] |
| **Location/Format** | [In-person/Virtual/Hybrid; location or call link] |
| **Time Scheduled** | [HH:MM AM/PM] |
| **Duration** | [Minutes] |
| **Materials Prepared By** | [Names] |
| **Materials Distribution Date** | [YYYY-MM-DD] |
| **Pre-Work Required** | [Yes/No; describe if yes] |

**1.3 Review Scope**

- **Project**: [Project name/ID]
- **Systems/Workstreams Covered**: [List applicable systems or project areas]
- **Reporting Period**: [YYYY-MM-DD to YYYY-MM-DD]
- **Comparative Period**: [Previous review period for trend analysis]

---

## 2. Review Type Configuration

*Instructions: Select the appropriate configuration section based on the review type selected above. Each type has different focus areas, objectives, and content requirements.*

### 2.1 Operational Review Focus

*Applicable when Review Type = Operational*

*Frequency: Weekly | Duration: 30-60 minutes | Audience: Technical/Operational Team + Governance Lead*

**Objectives:**
- Monitor system health, performance, and availability
- Identify and escalate operational anomalies
- Track incident resolution
- Review alert trends and false positives
- Discuss deployment status and infrastructure changes

**Key Metrics to Present:**
- System uptime and availability
- Request latency and throughput
- Error rates and anomalies detected
- Model accuracy/performance drift
- Data quality metrics
- Infrastructure utilization
- Active incidents and SLA compliance

**Escalation Criteria:**
- Performance degradation beyond thresholds
- Data quality anomalies
- Security alerts
- Unusual user patterns
- Any risk factors

---

### 2.2 Governance Review Focus

*Applicable when Review Type = Governance*

*Frequency: Bi-weekly or Monthly | Duration: 60-90 minutes | Audience: Governance, Risk, Compliance, Technical Leads*

**Objectives:**
- Assess risk register and update risk statuses
- Review compliance with governance policies and standards
- Approve changes to governance artifacts (SoA, policies, procedures)
- Prepare for phase gates and CCV assessments
- Discuss corrective action progress
- Review documentation and evidence completeness

**Key Artifacts to Review:**
- Risk register (updates, new risks, closures)
- Compliance status report
- Standards Crosswalk Matrix
- Corrective action register
- Evidence index (completeness, gaps)
- Policy/procedure updates
- Phase gate preparation checklist

**Decision Authority:**
- Approve risk acceptance (with escalation if High/Critical)
- Approve policy/procedure changes
- Approve phase gate progression
- Escalate governance issues to Executive/CRO

---

### 2.3 Executive Review Focus

*Applicable when Review Type = Executive*

*Frequency: Monthly or Quarterly | Duration: 45-60 minutes | Audience: Executives, Steering Committee, CRO, CAO*

**Objectives:**
- Report on strategic alignment and compliance status
- Present risk dashboard and appetite/tolerance positioning
- Discuss resource allocation and budget impact
- Review portfolio-level themes and trends
- Make strategic decisions on risk acceptance
- Communicate status to board or governance committees

**Key Metrics to Present:**
- Overall risk posture (count by severity)
- Compliance status by standard
- Budget vs. actual
- Schedule vs. plan
- Key metrics on trending up/down
- Critical issues needing decision
- Performance against strategic objectives

**Decision Authority:**
- Accept High/Critical risks
- Approve major policy changes
- Make strategic trade-off decisions
- Authorize escalation

---

### 2.4 Audit Review Focus

*Applicable when Review Type = Audit*

*Frequency: Quarterly Internal / Annual External | Duration: 2-4 hours | Audience: Internal/External Auditors, Governance, Compliance, CRO*

**Objectives:**
- Assess compliance with governance framework
- Evaluate control effectiveness
- Identify audit findings and deficiencies
- Assess readiness for external certifications
- Review CCV assessment results
- Determine audit ratings

**Key Audit Areas:**
- Governance structure and decision-making
- Risk management process effectiveness
- Compliance with standards and regulations
- Data governance and quality
- Model development and testing procedures
- Security controls and incident response
- Monitoring and measurement systems
- Documentation completeness

**Audit Rating Scale:**
- **Effective/Compliant**: Controls operating effectively; no findings
- **Generally Effective**: Minor findings; management plans adequate
- **Needs Improvement**: Significant findings; prompt action required
- **Ineffective/Non-Compliant**: Major findings; immediate remediation required

---

## 3. Agenda

*Instructions: List the topics to be covered in this review, with estimated time allocations. Customize based on review type and current priorities.*

| Item | Topic | Presenter | Duration | Notes |
|------|-------|-----------|----------|-------|
| 1 | Welcome & Objectives | [Facilitator] | 5 min | |
| 2 | Previous Action Items Review | [Action Owner] | 10 min | See Section 4 |
| 3 | Current Period Summary | [Project Lead] | 15 min | See Section 5 |
| 4 | Risk & Compliance Update | [Risk/Compliance Lead] | 20 min | See Section 6 |
| 5 | [Additional Topic] | [Presenter] | 10 min | |
| 6 | Decisions Required | [Facilitator] | 15 min | See Section 7 |
| 7 | Action Items & Next Steps | [Facilitator] | 5 min | See Section 8 |
| | **TOTAL** | | **80 min** | |

---

## 4. Previous Action Items Review

*Instructions: Review all open action items from prior reviews. Update status, resolve completed items, reassign overdue items, escalate blockers. Close items only when fully complete.*

*Satisfies: ISO 42001 Clause 9.3*

| Action ID | Description | Owner | Due Date | Status | Comments | New Owner (if changed) |
|-----------|-------------|-------|----------|--------|----------|----------------------|
| [ACT-XXX-01] | [Action description] | [Current owner] | [YYYY-MM-DD] | [Open/In Progress/Blocked/Complete] | [Progress update] | [If reassigned] |
| | | | | | | |

**Status Definitions:**
- **Open**: Not yet started
- **In Progress**: Work underway; on track for due date
- **Blocked**: Waiting on dependency; note blocker
- **Complete**: Work finished; ready for verification
- **Closed**: Verified complete; removed from tracking

**Action Item Closure Criteria:**
- Work fully completed and verified
- Evidence provided
- Acceptance from action item owner/sponsor
- Updated in tracking system

---

## 5. Current Period Summary

*Instructions: Present a summary of the reporting period, including key metrics, significant events, phase progress, and overall system health. Customize based on review type.*

### 5.1 Key Metrics

*Operational and governance metrics for the review period.*

| Metric | Current Value | Previous Value | Trend | Target | Status | Notes |
|--------|---------------|----------------|-------|--------|--------|-------|
| [Metric 1] | [Value] | [Value] | [↑/→/↓] | [Target] | [On Track/At Risk/Off Track] | |
| [Metric 2] | [Value] | [Value] | [↑/→/↓] | [Target] | [On Track/At Risk/Off Track] | |
| [System Uptime] | [%] | [%] | [↑/→/↓] | 99.9% | [On Track/At Risk] | |
| [Model Accuracy] | [%] | [%] | [↑/→/↓] | [Target %] | [On Track/At Risk] | |
| [Open Risks] | [Count] | [Count] | [↑/→/↓] | [Count] | [On Track/At Risk] | |
| [SLA Compliance] | [%] | [%] | [↑/→/↓] | [Target %] | [On Track/At Risk] | |

**Metric Interpretation:**
- **On Track**: Metric within acceptable range and trending appropriately
- **At Risk**: Metric approaching threshold; monitor closely
- **Off Track**: Metric outside acceptable range; action required

### 5.2 Significant Events & Incidents

*Document any significant occurrences during the review period.*

| Date | Event | Type | Severity | Status | Impact | Owner |
|------|-------|------|----------|--------|--------|-------|
| [YYYY-MM-DD] | [Event description] | [Incident/Change/Discovery/Issue] | [Critical/High/Medium/Low] | [Open/Resolved] | [Brief impact description] | [Owner] |
| | | | | | | |

**Event Types:**
- **Incident**: Unplanned operational issue or security event
- **Change**: Planned modification to system or configuration
- **Discovery**: Finding of risk, vulnerability, or compliance issue
- **Issue**: Operational or technical problem affecting functionality

### 5.3 Phase Gate Progress

*Show status of current phase and readiness for next gate.*

| Phase | Status | Start Date | Expected Completion | Gate Review Date | Gate Status |
|-------|--------|-----------|-------------------|-----------------|------------|
| [Current Phase] | [0-100% Complete] | [YYYY-MM-DD] | [YYYY-MM-DD] | [YYYY-MM-DD] | [On Track/At Risk/Blocked] |
| [Next Phase] | [Planning] | [YYYY-MM-DD] | [YYYY-MM-DD] | [YYYY-MM-DD] | [On Track/Planned] |

**Gate Readiness Checklist (for upcoming gates):**
- [ ] All phase deliverables completed
- [ ] Evidence gathered and verified
- [ ] Risk register updated
- [ ] Compliance assessment complete
- [ ] Security review completed
- [ ] Fairness & bias assessment done
- [ ] Steering committee alignment confirmed

### 5.4 Continuous Compliance Verification (CCV) Status

*If conducting CCV assessment during this review.*

| CCV Area | Status | Findings | Actions Required |
|----------|--------|----------|------------------|
| Governance | [Compliant/Non-Compliant/Partial] | [Findings count] | [Actions needed] |
| Risk Management | [Compliant/Non-Compliant/Partial] | [Findings count] | [Actions needed] |
| Data Governance | [Compliant/Non-Compliant/Partial] | [Findings count] | [Actions needed] |
| Model Development | [Compliant/Non-Compliant/Partial] | [Findings count] | [Actions needed] |
| Security & Resilience | [Compliant/Non-Compliant/Partial] | [Findings count] | [Actions needed] |
| Operations | [Compliant/Non-Compliant/Partial] | [Findings count] | [Actions needed] |

---

## 6. Risk & Compliance Update

*Instructions: Present updates to the risk register, compliance status, and outstanding corrective actions. Reference the Risk Register and Corrective Action Register documents.*

### 6.1 Risk Register Update

*Summarize changes to risks since last review.*

**6.1.1 New Risks Identified**

| Risk ID | Title | Domain | L | I | Risk Level | Owner | Status |
|---------|-------|--------|---|---|------------|-------|--------|
| [RK-XXX] | [Risk title] | [Domain] | [1-5] | [1-5] | [Low/Med/High/Crit] | [Owner] | [Identified] |
| | | | | | | | |

**6.1.2 Risk Register Changes**

| Risk ID | Title | Change | Previous Value | New Value | Reason | Decision |
|---------|-------|--------|----------------|-----------|--------|----------|
| [RK-XXX] | [Risk title] | [L/I/Status/Owner] | [Previous] | [New] | [Why changed] | [Approve/Reject] |
| | | | | | | |

**6.1.3 Risk Closure Summary**

| Risk ID | Title | Closure Date | Mitigation Evidence | Owner Sign-off |
|---------|-------|--------------|-------------------|----------------|
| [RK-XXX] | [Risk title] | [YYYY-MM-DD] | [Evidence reference] | [Approved by] |
| | | | | |

**6.1.4 Risk Dashboard**

- **Total Open Risks**: [Count]
  - Critical: [Count] (Target: [Count])
  - High: [Count] (Target: [Count])
  - Medium: [Count] (Target: [Count])
  - Low: [Count] (Target: [Count])
- **Risks Closed This Period**: [Count]
- **Average Days to Close**: [#] days

### 6.2 Compliance Status

*Summarize compliance assessments against governing standards.*

| Standard | Status | Last Assessed | Next Assessment | Notes |
|----------|--------|---------------|-----------------|-------|
| ISO 42001 | [Compliant/Non-Compliant/Partial] | [YYYY-MM-DD] | [YYYY-MM-DD] | [Summary] |
| NIST AI RMF | [Compliant/Non-Compliant/Partial] | [YYYY-MM-DD] | [YYYY-MM-DD] | [Summary] |
| NIST SP 800-53 | [Compliant/Non-Compliant/Partial] | [YYYY-MM-DD] | [YYYY-MM-DD] | [Summary] |
| CSRMC | [Compliant/Non-Compliant/Partial] | [YYYY-MM-DD] | [YYYY-MM-DD] | [Summary] |
| CPMAI | [Compliant/Non-Compliant/Partial] | [YYYY-MM-DD] | [YYYY-MM-DD] | [Summary] |

### 6.3 Active Corrective Actions

*Reference the Corrective Action Register. Summarize status of active corrective actions.*

| CAR ID | Finding | Severity | Due Date | Status | % Complete | Owner | Next Step |
|--------|---------|----------|----------|--------|------------|-------|-----------|
| [CAR-XXX] | [Finding description] | [Critical/High/Medium/Low] | [YYYY-MM-DD] | [Open/In Progress/Implemented] | [0-100%] | [Owner] | [Next action] |
| | | | | | | | |

**Corrective Action Summary:**
- **Total Open CARs**: [Count]
- **Overdue CARs**: [Count] (Escalation required: [Yes/No])
- **CARs Closed This Period**: [Count]
- **Average Resolution Time**: [# days]

---

## 7. Decisions Required

*Instructions: List all decisions that need to be made during or after this review. Present options, recommendations, and facilitate decision-making. Document all decisions with authority and rationale.*

*Satisfies: ISO 42001 Clause 9.3, NIST AI RMF GOVERN-1.5*

| Decision ID | Description | Options | Recommendation | Decision Made | Decided By | Approval Date | Rationale & Notes |
|-------------|-------------|---------|----------------|---------------|-----------|---------------|-------------------|
| [DEC-XXX-01] | [Decision to be made] | [Option A] [Option B] [Option C] | [Recommended option] | [Selected option] | [Decision authority] | [YYYY-MM-DD] | [Why this decision, any constraints] |
| | | | | | | | |

**Decision Format:**

**Decision ID: [DEC-XXX-XX]**
- **Description**: [What decision is needed?]
- **Options**:
  - Option A: [Description]
  - Option B: [Description]
  - Option C: [Description]
- **Recommendation**: [Which option is recommended and why?]
- **Approval Authority**: [Who can make this decision?]
- **Timeline**: [By when must decision be made?]
- **Impact**: [What are implications of each option?]

**Post-Review Decision Documentation:**
- **Decision Made**: [Selected option]
- **Decided By**: [Name/Title]
- **Approval Date**: [YYYY-MM-DD]
- **Rationale**: [Why this option was selected]
- **Implementation Required**: [Yes/No; if yes, see Action Items]

---

## 8. Action Items Generated

*Instructions: Document all action items assigned during this review. Each action must have a clear owner, due date, and success criteria.*

*Satisfies: ISO 42001 Clause 9.3*

| Action ID | Description | Owner | Due Date | Priority | Success Criteria | Blocker? | Assigned |
|-----------|-------------|-------|----------|----------|-----------------|---------|----------|
| [ACT-XXX-01] | [Action description] | [Owner name] | [YYYY-MM-DD] | [Critical/High/Medium/Low] | [How will this be verified?] | [Yes/No] | [YYYY-MM-DD] |
| | | | | | | | |

**Action Item Format:**

**Action ID: [ACT-XXX-XX]**
- **Description**: [What needs to be done?]
- **Owner**: [Name/Role]
- **Due Date**: [YYYY-MM-DD]
- **Priority**: [Critical/High/Medium/Low]
- **Success Criteria**: [How will completion be verified?]
- **Dependencies**: [Any blockers or dependencies?]
- **Resource Requirements**: [What resources needed?]

**Priority Levels:**
- **Critical**: Must be completed immediately; blocks other work
- **High**: Complete within next review cycle
- **Medium**: Complete within next 2 review cycles
- **Low**: Complete within next month; can be adjusted if needed

---

## 9. Next Review Planning

*Instructions: Plan for the next review, including timing, focus areas, and required pre-work.*

**9.1 Review Schedule**

| Item | Date/Frequency |
|------|----------------|
| **Next Review Date** | [YYYY-MM-DD] |
| **Review Type** | [Operational/Governance/Executive/Audit] |
| **Review Cycle** | [Weekly/Bi-weekly/Monthly/Quarterly] |
| **Planned Duration** | [# minutes] |
| **Facilitator** | [Name] |
| **Expected Attendees** | [List] |

**9.2 Expected Focus Areas**

List the topics anticipated for the next review:
- [Topic 1]
- [Topic 2]
- [Topic 3]
- [etc.]

**9.3 Pre-Work Required**

| Pre-Work Item | Owner | Due Date | Notes |
|---------------|-------|----------|-------|
| [Pre-work 1] | [Owner] | [Date before review] | [Details] |
| [Pre-work 2] | [Owner] | [Date before review] | [Details] |

**9.4 Materials to Prepare**

- [ ] Risk register updated and distributed
- [ ] Compliance status report prepared
- [ ] Metrics dashboard current
- [ ] Minutes from last review circulated
- [ ] Action item tracker updated
- [ ] Evidence index current
- [ ] CCV assessment (if applicable)

---

## 10. Review Notes & Discussion Summary

*Instructions: Capture key discussion points, rationale for decisions, and any other important notes from the review meeting.*

**10.1 Discussion Highlights**

[Enter narrative summary of key discussion points, concerns raised, resolutions discussed, and context for decisions made]

**10.2 Topics Deferred**

| Topic | Reason | Next Review Date |
|-------|--------|-----------------|
| [Deferred topic] | [Why deferred?] | [When will be addressed?] |

**10.3 Items of Note**

[Any other items that should be documented or followed up on; items that don't fit other sections]

---

## 11. Attendee Sign-Off & Distribution

*Instructions: Record who attended, confirm minutes accuracy, and document distribution.*

**11.1 Attendees**

| Name | Title/Role | Organization | Attended | Notes |
|------|-----------|--------------|----------|-------|
| [Name] | [Title] | [Org] | [Yes/No] | |
| | | | | |

**11.2 Minutes Accuracy Confirmation**

| Role | Name | Signature | Date | Approved |
|------|------|-----------|------|----------|
| Facilitator/Recorder | [Name] | ________________ | [YYYY-MM-DD] | [Yes/No] |
| [Another key role] | [Name] | ________________ | [YYYY-MM-DD] | [Yes/No] |

**11.3 Document Distribution**

- [ ] Minutes sent to attendees for review: [Date]
- [ ] Minutes approved and finalized: [Date]
- [ ] Minutes distributed to broader stakeholder list: [Date]
- [ ] Minutes filed in governance repository: [Date]
- [ ] Action items loaded into tracking system: [Date]

**Distribution List:**
[Names and roles of people receiving copies]

---

## 12. Satisfies

**Standards Alignment:**
- ISO 42001:2024 Clause 9.3 (Review Process)
- NIST AI RMF Function: GOVERN-1.5 (Communication)
- CPMAI Phase: All phases (I-VI)

---

## 13. Revision History

| Version | Date | Facilitator | Changes | Status |
|---------|------|------------|---------|--------|
| 1.0 | [YYYY-MM-DD] | [Name] | Initial review and minutes | [Approved/Draft] |
| | | | | |

---

## 14. Approvals and Sign-Off

| Role | Name | Signature | Date | Notes |
|------|------|-----------|------|-------|
| Review Facilitator | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Governance Lead | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Project Sponsor | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Chief AI Officer (if applicable) | [Enter name] | ________________ | [YYYY-MM-DD] | |

---

**Document Control**

- **Classification**: [Confidential/Internal/Public]
- **Distribution**: [List authorized recipients]
- **Retention Period**: [Minimum 3 years post-project]
- **Review Record**: This document serves as the official record of this review
- **Archival**: File with other governance reviews; maintain chronological record

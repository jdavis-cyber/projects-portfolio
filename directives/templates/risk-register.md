# Risk Register

## Document Metadata

| Field | Value |
|-------|-------|
| **Document ID** | RISK-REG-[YYYY-MM-DD]-[ProjectID] |
| **Version** | [Enter version number, e.g., 1.0] |
| **Date Created** | [YYYY-MM-DD] |
| **Last Updated** | [YYYY-MM-DD] |
| **Author/Agent** | [Enter creator name/agent ID] |
| **Maintained By** | [Enter primary maintainer name/role] |
| **Status** | [Draft/Review/Active/Archived] |
| **Current Phase** | [Phase I/II/III/IV/V/VI] |
| **Review Cycle** | [Weekly/Bi-weekly/Monthly/Quarterly] |
| **Next Review Date** | [YYYY-MM-DD] |

---

## 1. Risk Management Approach

*Instructions: Describe the overall methodology for risk identification, assessment, and management. This section establishes the governance framework for how risks are treated throughout the project lifecycle.*

**1.1 Risk Assessment Methodology**

[Enter description of risk identification methods used, e.g., stakeholder interviews, threat modeling, historical analysis, AI-specific risk taxonomies]

**1.2 Risk Rating Framework**

This register uses a 5x5 risk matrix combining likelihood and impact ratings to establish overall risk level.

**1.3 Risk Ownership Model**

- **Risk Owner**: [Enter role/department responsible for mitigation]
- **Risk Reviewer**: [Enter role responsible for periodic review]
- **Risk Escalation Authority**: [Enter role authorized to escalate risks]

**1.4 Risk Tolerance Statements**

*Satisfies: ISO 42001 Clause 6.1, NIST AI RMF GOVERN-5*

| Risk Level | Tolerance | Action Required |
|------------|-----------|-----------------|
| **Low** | [Enter tolerance statement] | Monitor and review regularly |
| **Medium** | [Enter tolerance statement] | Develop and implement mitigation |
| **High** | [Enter tolerance statement] | Immediate mitigation required; escalate if not addressable |
| **Critical** | [Enter tolerance statement] | Stop/pause activities; executive decision required |

---

## 2. Likelihood Scale

*Instructions: Define the probability ratings used to assess how likely a risk is to occur. This scale must be consistent across all risk assessments.*

| Rating | Label | Description | Probability Range | Frequency |
|--------|-------|-------------|-------------------|-----------|
| **1** | Very Low | Unlikely to occur; would only happen under exceptional circumstances | 0-10% | Rare (>1 year) |
| **2** | Low | May occur but is not expected under normal operations | 10-30% | Occasional (6-12 months) |
| **3** | Medium | Could occur; has precedent in industry or organization | 30-60% | Possible (3-6 months) |
| **4** | High | Likely to occur; precedent is common or conditions are favorable | 60-80% | Probable (1-3 months) |
| **5** | Very High | Almost certain to occur; conditions are present or similar risks materialized | 80-100% | Expected (monthly or more) |

---

## 3. Impact Scale

*Instructions: Define the consequence ratings used to assess the magnitude of impact if a risk occurs. Include examples relevant to AI systems (performance degradation, model bias, data leakage, regulatory penalties, reputational harm, etc.).*

| Rating | Label | Description | Examples |
|--------|-------|-------------|----------|
| **1** | Negligible | Minimal impact; can be absorbed within normal operations | Minor delay in project; isolated data quality issue; <$10K cost |
| **2** | Low | Limited impact; requires minor intervention but operational continuity maintained | Localized performance degradation; minor process workaround; $10-100K cost |
| **3** | Medium | Moderate impact; requires management intervention and may affect operations temporarily | Model accuracy degradation affecting 10-25% of use cases; $100K-1M cost; requires remediation |
| **4** | High | Significant impact; operational disruption likely; potential regulatory/reputational harm | Model bias affecting disadvantaged populations; regulatory notice; $1-10M cost; media attention |
| **5** | Critical | Severe impact; major operational failure; significant regulatory, legal, or safety implications | System failure affecting all users; regulatory action; $10M+ cost; significant reputational damage; potential safety/harm |

---

## 4. Risk Matrix

*Instructions: This visual 5x5 matrix maps likelihood (horizontal) against impact (vertical) to establish overall risk level. Use as a quick reference.*

```
                    LIKELIHOOD
              1         2         3         4         5
            (VL)      (L)       (M)       (H)      (VH)
        ┌─────────┬─────────┬─────────┬─────────┬─────────┐
      5 │ MEDIUM  │ MEDIUM  │ HIGH    │ HIGH    │CRITICAL │
    (C) ├─────────┼─────────┼─────────┼─────────┼─────────┤
    I   │ LOW     │ MEDIUM  │ MEDIUM  │ HIGH    │ HIGH    │
    M 4 ├─────────┼─────────┼─────────┼─────────┼─────────┤
    P   │ LOW     │ LOW     │ MEDIUM  │ MEDIUM  │ HIGH    │
    A 3 ├─────────┼─────────┼─────────┼─────────┼─────────┤
    C   │ LOW     │ LOW     │ LOW     │ MEDIUM  │ MEDIUM  │
    T 2 ├─────────┼─────────┼─────────┼─────────┼─────────┤
      1 │ LOW     │ LOW     │ LOW     │ LOW     │ MEDIUM  │
    (N) └─────────┴─────────┴─────────┴─────────┴─────────┘
```

**Risk Level Definitions:**
- **Low**: Acceptable risk; standard monitoring and periodic review
- **Medium**: Requires documented mitigation strategy; quarterly review
- **High**: Requires active mitigation; monthly review and status reporting
- **Critical**: Intolerable risk; immediate action; weekly review until mitigated or escalated

---

## 5. Risk Register

*Instructions: This is the master table containing all identified risks. Add rows for each unique risk. Maintain in order by Risk ID. Update Mitigation Status, Residual assessments, and Review Date as work progresses.*

*Satisfies: ISO 42001 Clause 6.1, NIST AI RMF MANAGE-2, NIST SP 800-53 RA-3*

| Risk ID | Date Identified | Phase Identified | Risk Domain | Title | Description | L | I | RL | Risk Owner | Mitigation Strategy | Mit. Status | R-L | R-I | R-RL | Control IDs | Review Date | Status |
|---------|-----------------|------------------|-------------|-------|-------------|---|---|----|-----------|--------------------|-------------|-----|-----|------|------------|-------------|--------|
| [RK-001] | [YYYY-MM-DD] | [Phase X] | [Domain] | [Risk title] | [Description of risk, conditions, potential triggers] | [1-5] | [1-5] | [Low/Med/High/Crit] | [Owner Name] | [Mitigation approach/activities] | [Not Started/In Progress/Implemented/Accepted] | [1-5] | [1-5] | [Low/Med/High/Crit] | [CTRL-XXX, ...] | [YYYY-MM-DD] | [Open/Mitigated/Accepted/Closed] |
| | | | | | | | | | | | | | | | | | |

**Column Definitions:**
- **Risk ID**: Unique identifier (RK-001, RK-002, etc.)
- **Date Identified**: When risk was first identified (YYYY-MM-DD)
- **Phase Identified**: CPMAI phase when risk was identified
- **Risk Domain**: One of [Governance/Reqs & Data/Development/Deployment/Operations/Fairness & Bias/Security]
- **Title**: Brief risk statement
- **Description**: Detailed description of the risk, conditions, potential triggers, and consequences
- **L**: Initial Likelihood (1-5)
- **I**: Initial Impact (1-5)
- **RL**: Initial Risk Level (Low/Medium/High/Critical)
- **Risk Owner**: Person/role accountable for mitigation
- **Mitigation Strategy**: Planned approach to reduce likelihood and/or impact
- **Mit. Status**: Current state of mitigation implementation
- **R-L**: Residual Likelihood after mitigation (1-5)
- **R-I**: Residual Impact after mitigation (1-5)
- **R-RL**: Residual Risk Level after mitigation
- **Control IDs**: Related security/compliance controls
- **Review Date**: Next scheduled review date
- **Status**: Current disposition (Open/Mitigated/Accepted/Closed)

---

## 6. Risk Trend Dashboard

*Instructions: Populate this section with visualizations and metrics showing risk trends over time. This can be generated from the Risk Register data above.*

**6.1 Open Risks by Severity**

| Risk Level | Count | Trend | Target |
|------------|-------|-------|--------|
| Critical | [#] | [↑/→/↓] | [Enter target count] |
| High | [#] | [↑/→/↓] | [Enter target count] |
| Medium | [#] | [↑/→/↓] | [Enter target count] |
| Low | [#] | [↑/→/↓] | [Enter target count] |
| **Total Open** | [#] | [↑/→/↓] | [Enter target count] |

**6.2 Risk Distribution by Domain**

[Insert visual chart showing count of risks by domain: Governance, Requirements & Data, Development, Deployment, Operations, Fairness & Bias, Security]

**6.3 Risk Distribution by Phase**

[Insert visual chart showing risks identified and remediated by CPMAI phase]

**6.4 Risk Closure Rate**

| Metric | Current Period | Previous Period | 12-Month Avg | Target |
|--------|----------------|-----------------|--------------|--------|
| Risks Closed | [#] | [#] | [#] | [#] |
| Avg. Days to Close | [#] | [#] | [#] | [#] |
| Residual Risk Reduction | [%] | [%] | [%] | [%] |

---

## 7. Risk Acceptance Log

*Instructions: When a risk is consciously decided to be accepted rather than mitigated, document the acceptance here. This requires executive-level approval for High and Critical risks.*

*Satisfies: NIST AI RMF GOVERN-5*

| Risk ID | Risk Title | Accepted By | Title | Date | Justification | Acceptance Conditions | Expiration/Review Date | Status |
|---------|-----------|-------------|-------|------|---------------|----------------------|------------------------|--------|
| [RK-XXX] | [Risk title] | [Name] | [Title] | [YYYY-MM-DD] | [Why risk is acceptable to organization] | [Under what conditions does acceptance remain valid?] | [YYYY-MM-DD] | [Active/Expired] |
| | | | | | | | | |

**Risk Acceptance Criteria:**
- Risk cannot be fully mitigated within project constraints
- Organization has explicitly chosen to accept residual risk
- Senior leadership approval required for High/Critical
- Conditions documented (e.g., time limits, trigger events)
- Periodic review required (recommended: annually for operational risks)

---

## 8. Escalated Risks

*Instructions: Document risks that have been escalated beyond the immediate project due to severity, urgency, or cross-organizational impact.*

| Risk ID | Title | Original Owner | Escalated To | Date Escalated | Escalation Reason | Action Taken | Status |
|---------|-------|-----------------|--------------|-----------------|-------------------|-------------|--------|
| [RK-XXX] | [Risk title] | [Original owner] | [Executive/Steering Committee/Board] | [YYYY-MM-DD] | [Why escalation was necessary] | [Action taken at escalated level] | [Active/Resolved] |
| | | | | | | | |

---

## 9. Risk Mitigation Playbooks

*Instructions: For each High or Critical risk, provide a reference to detailed mitigation playbooks or plans. Link to supporting documentation.*

| Risk ID | Title | Playbook Reference | Owner | Last Updated |
|---------|-------|-------------------|-------|--------------|
| [RK-XXX] | [Risk title] | [Link to mitigation plan document] | [Owner] | [YYYY-MM-DD] |
| | | | | |

---

## 10. Satisfies

**Standards Alignment:**
- ISO 42001:2024 Clause 6.1 (Risk Assessment and Management)
- NIST AI RMF Function: GOVERN-5 (Establish and Communicate Risk Appetite and Risk Tolerance)
- NIST AI RMF Function: MANAGE-2 (Develop Risk Mitigation Plans)
- NIST SP 800-53 Control RA-3 (Risk Assessment)
- CPMAI Phase: All phases (I-VI)

---

## 11. Revision History

| Version | Date | Author | Changes | Status |
|---------|------|--------|---------|--------|
| 1.0 | [YYYY-MM-DD] | [Author Name] | Initial template creation | [Draft/Approved] |
| | | | | |

---

## 12. Approvals and Sign-Off

| Role | Name | Signature | Date | Notes |
|------|------|-----------|------|-------|
| Risk Management Lead | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Project Sponsor | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Chief AI Officer / Governance Lead | [Enter name] | ________________ | [YYYY-MM-DD] | |
| Chief Risk Officer (if applicable) | [Enter name] | ________________ | [YYYY-MM-DD] | |

---

**Document Control**

- **Classification**: [Confidential/Internal/Public]
- **Distribution**: [List authorized recipients]
- **Retention Period**: [Minimum 3 years post-project]
- **Review Frequency**: [Weekly/Bi-weekly/Monthly/Quarterly]
- **Archival**: Upon project closure, archive risk register as part of permanent project records

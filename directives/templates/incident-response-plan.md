# AI-Specific Incident Response Plan

## Document Metadata

| Field | Value |
|-------|-------|
| **Document ID** | [Enter Document ID, e.g., IRP-2024-SYS-001] |
| **Version** | [Enter Version Number, e.g., 1.0] |
| **Date Created** | [Enter Creation Date: YYYY-MM-DD] |
| **Last Modified** | [Enter Last Modified Date: YYYY-MM-DD] |
| **Author / Agent** | [Enter Name of Author or Incident Response Coordinator] |
| **Status** | [Select: Draft / In Review / Approved / Published] |
| **Compliance Phase** | Phase VI - Operationalization & Risk Management |
| **Applicable Standards** | NIST SP 800-53 IR-1 through IR-10, NIST AI RMF MANAGE-4, ISO 42001 A.16 |

---

## 1. Plan Overview

*Instructions: Define the scope, purpose, and applicability of this incident response plan. Establish the foundation for coordinated incident management.*

### 1.1 Plan Purpose & Scope

**Purpose:** [2-3 sentences describing the plan's aim, e.g., "This plan establishes procedures for detecting, responding to, and recovering from AI-specific incidents affecting [System Name]. It enables rapid containment, root cause analysis, and service restoration while minimizing business impact and learning from events."]

**Scope - Systems Covered:**
- [ ] [System Name/ID, e.g., "Customer Churn Prediction Engine"]
- [ ] [System Name/ID]
- [ ] [Additional systems]
- [ ] [Or state: "All AI systems owned by [Organization/Team]"]

**Scope - Incident Types Covered:**
- [ ] Model Failures / Degradation
- [ ] Adversarial Attacks
- [ ] Data Integrity Compromises
- [ ] Bias / Fairness Incidents
- [ ] Privacy Breaches
- [ ] Model Theft / Extraction Attempts
- [ ] Unexpected Model Behavior / Hallucinations
- [ ] System Infrastructure Failures
- [ ] Security Incidents Affecting AI Systems

**Out of Scope:**
[Specify any incidents NOT covered by this plan, e.g., "General IT security incidents not affecting AI systems; handled per enterprise IR plan"]

### 1.2 Plan Applicability & Limitations

**Who Should Use This Plan:**
- [System owners and operators]
- [Incident response team members]
- [On-call engineers and data scientists]
- [Security and compliance teams]
- [Escalation authorities]

**Plan Activation Triggers:**
- Any alert categorized as Critical or High severity (per Section 2)
- Suspected security breach or unauthorized access
- Suspected data integrity issue
- Suspected fairness/bias incident affecting decisions
- Unexplained model behavior or performance degradation
- Any incident potentially affecting customer trust, safety, or regulatory compliance

**Plan Limitations:**
[Acknowledge constraints, e.g., "This plan assumes monitoring system is operational. If monitoring system itself fails, activate manual observation procedures per Appendix X."]

### 1.3 Plan Approval & Authority

| Role | Name | Title | Approval Authority | Date Approved |
|------|------|-------|------------------|-------|
| **Incident Response Coordinator** | [Name] | [Title] | Plan owner; activates plan | [YYYY-MM-DD] |
| **System Owner** | [Name] | [Title] | System decision authority; approves response actions | [YYYY-MM-DD] |
| **Security Lead** | [Name] | [Title] | Security decision authority; approves containment actions | [YYYY-MM-DD] |
| **Executive Sponsor** | [Name] | [Title] | Executive escalation authority | [YYYY-MM-DD] |

---

## 2. Incident Classification

*Instructions: Define incident severity levels and response requirements. Clear classification enables proportionate resource allocation.*

### 2.1 Severity Levels & Response SLAs

| Severity Level | Definition | Examples | Response SLA | Escalation | War Room |
|---|---|---|---|---|---|
| **1 - Critical** | Service completely unavailable; customer data/safety at imminent risk; potential regulatory violation | System outage >5 min; active security breach; data corruption >1% of records; fairness threshold breached; customer-impacting | <15 min acknowledgment; <1 hour decision/escalation | Immediate to on-call engineer and management | ACTIVATE |
| **2 - High** | Significant functionality degradation; material customer impact; fairness/privacy concern | Model accuracy drops >10%; unauthorized access detected; potential PII leak; bias >5% disparity; active exploitation attempt | <30 min acknowledgment; <4 hours diagnosis | Within 15 min to team lead if unacknowledged | ACTIVATE if >1 hour |
| **3 - Medium** | Partial functionality issue; minor customer impact; performance degradation | Latency >500ms; model accuracy drops 5-10%; data quality issue; minor policy violation; vulnerability in non-critical path | <2 hours acknowledgment; <8 hours diagnosis | Within 1 hour to team lead | Optional |
| **4 - Low** | Informational; minor anomaly; no immediate impact | Log errors; minor data quality issue; feature importance shift; performance trending slowly | <4 hours acknowledgment; <24 hours diagnosis | During business hours to team lead | No |

### 2.2 Severity Determination Framework

[How to classify incidents quickly at detection]

**Use these criteria to assign severity:**

1. **Business Impact:** Does this affect customer-facing functionality? How many customers?
   - All customers: +1 Severity level
   - >1000 customers: +1 Severity level
   - >100 customers: +0 (baseline)
   - <100 customers: -1 Severity level

2. **Data/Safety Impact:** Is customer data, privacy, or safety at risk?
   - Data/Safety at risk: +1 Severity level

3. **Regulatory/Compliance Impact:** Does this violate regulations or create legal exposure?
   - Yes: +1 Severity level

4. **Security Impact:** Is this a confirmed or suspected security breach?
   - Confirmed breach: Make it Critical
   - Suspected breach: +1 Severity level

**Example:** Model accuracy drops 8% affecting 500 customers = Base Medium (5-10% accuracy drop) + 0 (500 customers) + 0 (no safety risk) = **Medium Severity**

---

## 3. AI-Specific Incident Types

*Instructions: Document incident types specific to AI systems. Each type has distinct detection patterns, containment strategies, and recovery approaches.*

### 3.1 Model Failure / Degradation

*Instructions: Loss of model accuracy, prediction quality, or availability. Most common AI incident type.*

**Characteristics:**
- Sudden or gradual accuracy loss
- Increased error rate or failed predictions
- Model serving unavailable / crashes
- Confidence scores becoming unreliable

**Detection Signals:**
- AUC-ROC drops >5% (triggers Medium alert)
- AUC-ROC drops >10% (triggers High alert)
- Model serving error rate >1% (High alert)
- >50% predictions returning null/error (Critical alert)
- Model latency >1000ms persistently (Medium alert)

**Common Root Causes:**
- Feature engineering pipeline failure (upstream data unavailable)
- Data drift / distribution shift (training data doesn't match production data)
- Concept drift (outcome patterns changed; model outdated)
- Hardware/resource constraints (model can't run at scale)
- Code bug introduced in recent deployment
- Model corruption or incorrect version deployed

**Immediate Response (First 30 minutes):**
1. **Confirm Issue:** Verify alert is valid; reproduce if possible
2. **Scope Impact:** How many requests affected? Which customers/segments?
3. **Gather Evidence:** Collect logs, metrics, recent changes; screenshot current state
4. **Communicate:** Notify stakeholders of known issue; establish incident channel
5. **Assess Options:**
   - Can fallback/bypass model? (Activate business continuity plan)
   - Can rollback to prior model version? (Has been validated before)
   - Requires root cause analysis? (If root cause unclear)

**Containment (30 min - 2 hours):**
- [ ] **Option A - Fallback:** Disable model; use rule-based or prior approach; reduces quality but preserves service
- [ ] **Option B - Rollback:** Revert to previous model version; if model previously validated, usually safe
- [ ] **Option C - Quarantine:** Take model offline; implement manual review process; time-consuming but safest for critical systems
- [ ] **Option D - Continue with Monitoring:** If impact acceptable, maintain model with enhanced monitoring while investigating

**Root Cause Investigation:**
- Data pipeline issues? (Check feature pipeline health; validate input data)
- Code/configuration issues? (Review recent deployments; check logs for errors)
- Data drift? (Compare current data distribution to training data)
- Concept drift? (Check outcome rate changes; segment-level performance)
- Resource constraints? (Monitor CPU/memory/disk usage during failures)
- External dependency failure? (Check 3rd-party API/service status)

**Recovery:**
- Root Cause Remediation: Fix root cause (new training data, code fix, feature pipeline repair)
- Model Retraining: If data drift/concept drift, retrain with recent data
- Validation: Test model on validation set; compare to prior version
- Staged Deployment: Use canary/shadow approach for new model; monitor carefully
- Rollout: Once validated, complete deployment to production

**Escalation Path:** High severity model failure → Page on-call data scientist → Escalate to Data Science Lead if not resolved in 1 hour → Escalate to VP Engineering if not resolved in 4 hours

---

### 3.2 Adversarial Attack Detected

*Instructions: Detection of attempted or active adversarial attack on model or system.*

**Characteristics:**
- Unusual input patterns designed to fool model
- Extraction attempt (attacker querying model to reverse-engineer it)
- Poisoning attempt (attacker injecting malicious data into training)
- Evasion attempt (attacker manipulating data to achieve desired prediction)
- Adversarial examples crafted to bypass model

**Detection Signals:**
- Security monitoring detects anomalous query patterns (same source, structured queries, testing edges)
- Adversarial input detector flags suspicious inputs (>X std devs from normal)
- Unusual access patterns to model infrastructure
- Alerts from intrusion detection system (IDS) or Web Application Firewall (WAF)
- Model extraction detection: >100 queries/minute from single source with systematic patterns

**Common Attack Types:**
- **Extraction Attack:** Attacker queries model repeatedly to learn its decision boundary
- **Evasion Attack:** Attacker crafts adversarial inputs to bypass model (e.g., to evade churn prediction)
- **Poisoning Attack:** Attacker injects malicious data into training pipeline
- **Model Theft:** Attacker attempts to download/copy model weights or code
- **Denial of Service (DoS):** Attacker overwhelms model with requests

**Immediate Response (First 15 minutes):**
1. **Detect & Confirm:** Verify alert is actual attack, not anomaly
2. **Isolate:** If extraction/DoS confirmed, block source IP immediately
3. **Preserve Evidence:** Save logs, traffic patterns, extracted data (if applicable) for analysis
4. **Notify Security:** Activate security incident response team
5. **Assess Compromise:** Was model compromised? Were weights extracted? Is model still reliable?

**Containment (15 min - 1 hour):**
- [ ] **Block Source:** Firewall rules to reject traffic from attacking IP/region
- [ ] **Rate Limiting:** Implement aggressive rate limits on model endpoint
- [ ] **WAF Rules:** Update Web Application Firewall to detect similar attack patterns
- [ ] **Access Control:** Restrict model access to trusted consumers; require authentication
- [ ] **Model Quarantine:** Take model offline if integrity in question; activate fallback
- [ ] **DDOS Mitigation:** If DoS attack, activate DDOS protection / cloud provider mitigation

**Investigation:**
- Extraction Attack: Determine what the attacker learned about the model; assess if this is a risk
- Evasion Attack: Determine if actual exploitation occurred; assess if decisions were fraudulent
- Poisoning Attack: Identify malicious data; determine if model retraining needed
- Theft Attack: Determine what was accessed; assess IP/confidentiality risk
- Lateral Movement: Check if attack was vector for broader system compromise

**Recovery:**
- Containment Validation: Verify attack source is blocked and prevented
- Model Remediation: If poisoning or theft, consider model redaction/retraining
- Enhanced Security: Deploy additional adversarial input detection; rate limiting; access controls
- Communication: Notify stakeholders; assess if customer notification required
- Root Cause: Implement controls to prevent similar attack (e.g., input validation, access controls)

**Escalation Path:** Confirmed adversarial attack → Immediate escalation to Security Lead → Notify Chief Information Security Officer and Legal if IP theft suspected or customer data involved

---

### 3.3 Data Integrity Compromise

*Instructions: Detection of corrupted, altered, or poisoned data affecting model inputs or training.*

**Characteristics:**
- Corrupted data records (NaN, impossible values, formatting issues)
- Data injection by unauthorized source
- Data modification (changed values, record deletion)
- Missing or incomplete data
- Data quality metric degradation (outliers, inconsistencies)

**Detection Signals:**
- Data quality score drops (>10% records have quality issues)
- Anomalous values in feature distributions
- Data validation checks fail (range checks, format validation)
- Unexpected schema changes
- Upstream data source unavailable or returning errors
- Audit logs show unauthorized data modifications

**Common Root Causes:**
- Upstream data pipeline failure (source system outage, API error)
- ETL (Extract-Transform-Load) process failure or misconfiguration
- Data injection / poisoning (deliberate malicious modification)
- Database corruption or write failure
- Data migration or backup restoration errors
- Configuration error in data transformation

**Immediate Response (First 30 minutes):**
1. **Isolate Affected Data:** Identify which records/fields corrupted; timestamp of corruption
2. **Stop Downstream Impact:** If corrupted data used for model decisions, pause or limit exposure
3. **Preserve Evidence:** Save corrupted data, logs, audit trails for investigation
4. **Assess Scope:** How much data affected? How long has corruption existed? How critical?
5. **Communicate:** Notify data team, model team, downstream users

**Containment (30 min - 2 hours):**
- [ ] **Halt Data Pipeline:** Stop ingestion of potentially corrupted data
- [ ] **Quarantine Data:** Move suspect data to isolated environment for analysis
- [ ] **Activate Backup:** Restore valid data from prior backup if available
- [ ] **Manual Override:** If model relies on bad data, activate fallback decision process
- [ ] **Access Control:** Lock data for investigation; restrict access to authorized personnel

**Investigation:**
- Root Cause: Upstream system failure? ETL bug? Malicious modification?
- Scope: How much data affected? Which records/features? Time window?
- Impact: Did corrupted data affect model decisions? Which customers/decisions?
- Integrity Check: Are backups/archives also affected? Is there a clean version?

**Recovery:**
- Data Restoration: Restore clean data from backup; validate restoration
- Data Cleanup: Remove/correct corrupted records
- Model Revalidation: If corrupted data reached model, revalidate model quality
- Root Cause Fix: Address underlying cause (pipeline fix, access control improvement)
- Audit Trail: Document incident in MEMORY.md; update security posture

**Escalation Path:** Data corruption confirmed → Notify Data Engineering Lead and Compliance Officer → Escalate to Chief Risk Officer if customer data affected → Legal notification if breach suspected

---

### 3.4 Bias / Fairness Incident

*Instructions: Detection of systematic unfair treatment or disparate impact on protected groups.*

**Characteristics:**
- Model prediction disparities across demographic groups
- Disparate impact (minority group selection rate <80% of majority)
- False positive or false negative rate significantly different across groups
- Model behavior change discriminating against protected group
- Regulatory complaint related to fairness

**Detection Signals:**
- Demographic parity disparity >5pp (high tolerance) or >3pp (strict tolerance)
- Disparate impact ratio <0.80 (80% rule)
- Equal Opportunity Difference (TPR/FPR difference) >5% across groups
- Fairness metric alert triggered (per Monitoring Plan)
- External complaint or regulatory inquiry received
- Audit discovers systematic disparities in model decisions

**Common Root Causes:**
- Data drift: Training data demographics different from deployment
- Proxy variables: Features indirectly correlate with protected attribute
- Biased training data: Historical data reflects prior discrimination
- Model overfitting to spurious correlations
- Changed business logic affecting model inputs
- Insufficient fairness validation in model development
- Fairness constraints not properly implemented in training

**Immediate Response (First 1 hour):**
1. **Confirm Disparity:** Validate alert is actual fairness issue; verify metrics calculations
2. **Document Evidence:** Capture data showing disparity; disaggregated metrics by group
3. **Assess Materiality:** Is disparity statistically significant? Practically material?
4. **Scope Impact:** How many decisions affected? Which groups? Time window?
5. **Notify Stakeholders:** Inform Compliance Officer, Risk Officer, Legal of potential issue

**Containment (1 - 4 hours):**
- [ ] **Apply Fairness Constraint:** If disparity material, retrain model with fairness loss term
- [ ] **Increase Human Oversight:** Implement manual review of decisions for affected group
- [ ] **Adjust Decision Threshold:** Use different threshold for affected group (if permitted by policy)
- [ ] **Exclude Protected Attribute:** Retrain model explicitly excluding protected attribute
- [ ] **Pause Affected Decisions:** If disparity severe, pause model decisions for affected group; use alternative

**Investigation:**
- Data Analysis: Compare training data demographics to deployment; identify shift
- Feature Analysis: Which features driving disparities? Are proxies for protected attribute?
- Historical Analysis: Was disparity present in prior model versions?
- Policy Review: Are fairness constraints properly defined? Were trade-offs considered?
- External Factors: Did business/operational changes introduce disparities?

**Recovery:**
- Model Remediation: Retrain with fairness constraints; test on diverse holdout sets
- Documentation: Update fairness assessment with findings and remediation
- Monitoring: Implement ongoing fairness monitoring per plan; disaggregated metrics
- Communication: Assess external communication need (regulatory requirement? Customer impact?)
- Governance: Update fairness policy/constraints based on learnings

**Escalation Path:** Confirmed fairness disparity → Notify Compliance Officer and Chief Risk Officer immediately → Escalate to Legal if regulatory violation risk → Potential customer notification if systemic unfairness and customer trust impact

---

### 3.5 Privacy Breach

*Instructions: Unauthorized access or disclosure of personally identifiable information or sensitive data.*

**Characteristics:**
- Unauthorized access to customer data / PII
- Data exfiltration or copying by unauthorized party
- Data exposure (e.g., publicly accessible database, email with PII)
- Suspected membership inference attack (attacker determines if specific person in training data)
- Privacy-preserving mechanism failure
- Data leak via model outputs (e.g., model explanations revealing training data)

**Detection Signals:**
- Unauthorized access attempts detected and logged
- Unusual data access patterns (bulk data export, access outside business hours)
- Alerts from data loss prevention (DLP) tools
- Member inference attack detection
- Data leakage signals (private info in model outputs)
- External notification (third-party reports data exposure)
- Audit logs show unauthorized or anomalous access

**Common Root Causes:**
- Compromised credentials / unauthorized access
- Misconfigured access controls (overly permissive)
- Insider threat (employee or contractor unauthorized access)
- Third-party vendor compromise
- Unencrypted data in transit or at rest
- Failure of privacy-preserving mechanisms (differential privacy, anonymization)
- API/application vulnerability allowing data extraction

**Immediate Response (First 30 minutes):**
1. **Confirm Breach:** Verify unauthorized access/disclosure occurred
2. **Stop Ongoing Exposure:** Block access immediately; remove exposed data if possible
3. **Preserve Evidence:** Capture access logs, timestamps, data accessed, breach scope
4. **Contain Blast Radius:** Limit who has access to findings during investigation
5. **Notify Leadership:** Immediate notification to CISO, Privacy Officer, Legal

**Containment (30 min - 2 hours):**
- [ ] **Revoke Access:** Invalidate compromised credentials; remove unauthorized access
- [ ] **Isolate System:** Take affected system offline if necessary to prevent further data exfiltration
- [ ] **Data Protection:** Encrypt sensitive data in transit and at rest
- [ ] **Access Controls:** Implement least-privilege access; remove unnecessary data access
- [ ] **Monitoring:** Deploy additional data access monitoring; alerts for suspicious patterns
- [ ] **Communication Prep:** Prepare external notification if required (regulatory deadline typically 30-60 days)

**Investigation:**
- Scope: How much PII accessed/exposed? Which individuals? What data types?
- Timeline: When did breach start? When discovered? Duration of exposure?
- Root Cause: How was access obtained? Weak credentials? Misconfiguration? Vulnerability?
- Impact Assessment: Risk of identity theft, financial loss, reputation damage?
- Third-party Impact: Were any third parties affected? Do they need notification?

**Recovery:**
- Forensic Analysis: Determine exactly what occurred; preserve evidence for potential prosecution
- Notification: If required by regulation, prepare and send notifications to affected individuals
- Credit Monitoring: If financial data affected, offer credit monitoring services
- Root Cause Remediation: Implement controls preventing similar breach
- Documentation: Log incident in MEMORY.md; update risk register

**Escalation Path:** Privacy breach confirmed → Immediate escalation to Chief Information Security Officer and Chief Privacy Officer → Notify Legal for regulatory compliance assessment → Consider Law Enforcement notification if criminal activity → Customer notification per GDPR/CCPA requirements

---

### 3.6 Model Theft / Extraction Attempt

*Instructions: Attempts to reverse-engineer, copy, or steal model weights, architecture, or intellectual property.*

**Characteristics:**
- Systematic queries designed to learn model behavior
- Unusual access patterns or bulk API calls
- Attempts to download model files or weights
- Suspicious access to model configuration or training code
- Evidence of model cloning (competitor releases similar model)
- Intellectual property theft

**Detection Signals:**
- Security monitoring detects extraction attack patterns (structured queries, boundary testing)
- Model extraction detector alerts (e.g., MUNGE attack detection)
- Anomalous query volume from single source
- Attempts to access model repository or configuration
- Suspicious API key activity or unauthorized access
- Third-party reports suspicious similar model

**Common Root Causes:**
- Compromised API credentials or authentication tokens
- Weak API authentication mechanisms
- Overly permissive model access controls
- Insider threat / malicious employee
- Third-party vendor compromise
- Public model repository with insufficient access controls
- Model deployed on public-facing infrastructure without restrictions

**Immediate Response (First 15 minutes):**
1. **Confirm Attack:** Verify extraction attempt is active/ongoing
2. **Block Source:** Immediately firewall-block attacking IP/source
3. **Preserve Evidence:** Capture query logs, patterns, extracted data (if any)
4. **Assess Compromise:** How much information could attacker extract? Is model confidentiality compromised?
5. **Notify Security:** Activate security incident team

**Containment (15 min - 1 hour):**
- [ ] **Firewall Block:** Block attacking IP/network at firewall
- [ ] **Rate Limiting:** Implement aggressive rate limiting to prevent queries
- [ ] **Authentication:** Require strong authentication (multi-factor) for API access
- [ ] **Model Obfuscation:** Consider deploying obfuscated model (reduced output detail) while investigating
- [ ] **Access Revocation:** Revoke all potentially compromised API keys; reissue to legitimate users
- [ ] **Legal Hold:** Preserve all evidence for potential legal action

**Investigation:**
- Extraction Scope: How many queries? What patterns? What did attacker learn?
- Source: Who is attacking? Is it competitor? Nation-state? Insider?
- Model Impact: Is model now considered stolen/compromised? Viability of continued use?
- IP Risk: What proprietary information is at risk? Trade secret exposure?
- Competitor Impact: Did attacker succeed in cloning model? Are they using stolen IP?

**Recovery:**
- Model Replacement: If model confidentiality severely compromised, consider deploying new version
- IP Protection: Consider legal action (CFAA, trade secret laws); coordinate with Legal
- Architecture Hardening: Implement model extraction defenses (uncertainty quantification, robustness to queries)
- Access Controls: Implement comprehensive authentication and authorization
- Monitoring: Deploy advanced query analysis to detect future extraction attempts

**Escalation Path:** Model extraction attempt confirmed → Page security on-call → Notify Chief Information Security Officer and Legal immediately → Consider Law Enforcement notification → Assess IP strategy and potential legal action

---

### 3.7 Unexpected Model Behavior / Hallucination

*Instructions: Model produces unexplained, inappropriate, or contradictory outputs not seen during validation.*

**Characteristics:**
- Model outputs that don't make logical sense
- Contradictory outputs for similar inputs
- Offensive, harmful, or inappropriate text (for generative models)
- Outputs referencing non-existent data or sources (hallucinations)
- Outputs revealing training data or confidential information
- Model behavior inconsistent with training and testing

**Detection Signals:**
- User complaints of unusual model outputs
- Monitoring detects anomalous output patterns
- Explanation inconsistency: different explanations for similar inputs
- Output validation fails (format errors, impossible values)
- User reviews of model decisions flag illogical outputs
- Audit of model explanations reveals implausible reasoning

**Common Root Causes:**
- Model overfitting to training data edge cases
- Insufficient test coverage; behavior not validated
- Prompt injection (for LLM-based systems)
- Out-of-distribution inputs triggering unpredictable behavior
- Data contamination in training set (biased or nonsensical training data)
- Model architecture misalignment with intended behavior
- Configuration error causing unintended behavior

**Immediate Response (First 30 minutes):**
1. **Reproduce Issue:** Collect example inputs; reproduce unexpected output
2. **Document Behavior:** Screenshot/log the unexpected output with context
3. **Assess Impact:** How many users affected? What's the impact of behavior?
4. **Pause if Critical:** If output is harmful (e.g., generating offensive text), consider pausing model
5. **Investigate:** Understand why model produced unexpected output

**Containment (30 min - 2 hours):**
- [ ] **Pause Model:** If outputs harmful or misleading, take model offline
- [ ] **Activate Fallback:** Use rule-based or prior model while investigating
- [ ] **Add Output Validation:** Implement checks to catch similar behavior going forward
- [ ] **User Notification:** If outputs already served, notify affected users
- [ ] **Manual Review:** Implement human review of model outputs until issue resolved

**Investigation:**
- Root Cause Analysis: Why did model produce this output? Feature issue? Data issue?
- Training Data Review: Was this behavior present in training data? Bias?
- Test Coverage: Should this output have been caught during testing?
- Configuration: Are model parameters correct? Did something change?
- External Factors: Did input format/type differ from training? Out-of-distribution?

**Recovery:**
- Model Retraining: If behavior systematic, retrain with improved data/regularization
- Test Expansion: Add test cases covering edge cases that produced unexpected behavior
- Monitoring: Deploy output quality checks to catch similar issues
- Documentation: Update model card with known limitations and unexpected behaviors
- Communication: Document incident in MEMORY.md; update stakeholders on findings

**Escalation Path:** Confirmed harmful model behavior → Notify system owner and product team → If outputs to customers, assess communication needs → Escalate if reputational risk or user harm → Legal notification if potential liability

---

## 4. Incident Response Team

*Instructions: Define roles and responsibilities. Clear team structure enables rapid, coordinated response.*

### 4.1 Core Response Roles

| Role | Name | Title | Primary Responsibility | Backup | On-Call Schedule |
|------|------|-------|----------------------|--------|-----------------|
| **Incident Commander** | [Name] | [Title] | Coordinate incident response; make decisions; manage escalation | [Backup Name] | [24/7 rotation] |
| **Technical Lead** | [Name] | [Title] | Root cause analysis; technical remediation; validate fixes | [Backup Name] | [24/7 rotation] |
| **Data Science Lead** | [Name] | [Title] | Model-specific diagnostics; data analysis; retraining decisions | [Backup Name] | [Business hours + on-call] |
| **Operations Lead** | [Name] | [Title] | Infrastructure issues; deployment; rollback execution | [Backup Name] | [24/7 rotation] |
| **Security Lead** | [Name] | [Title] | Security incident response; breach assessment; forensics | [Backup Name] | [24/7 rotation] |
| **Communications Lead** | [Name] | [Title] | Internal/external communications; status updates; customer/media | [Backup Name] | [24/7 rotation] |
| **Documentation Lead** | [Name] | [Title] | Record incident timeline; document actions; update MEMORY.md | [Backup Name] | [During incident] |

### 4.2 Escalation Authority Chain

**Escalation Path:** Issue Detected → Incident Commander → Team Lead → Director → VP/Executive → External (Legal/Comms)

| Escalation Level | Authority | Contact | Decision Authority | Escalation Trigger |
|---|---|---|---|---|
| **L1 - On-Call Team** | Incident Commander | [Phone/Slack] | Tactical decisions; resource allocation | Any incident |
| **L2 - Team Leadership** | Team Lead / Manager | [Phone/Slack] | Strategic decisions; major system changes | High severity or unresolved in 1 hour |
| **L3 - Director** | Director / VP Engineering | [Phone] | Deployment authorization; major business decisions | Critical severity or >4 hour duration |
| **L4 - Executive** | VP / Chief Officer | [Phone] | Executive-level decision; customer notification; external comms | Critical severity + customer impact or regulatory |
| **L5 - External** | Legal / Communications / Law Enforcement | [Phone] | Regulatory notification; customer communication; legal action | Privacy breach or security crime |

### 4.3 Incident Response Team Contact & Rotation

**On-Call Rotation:**
- [Rotation management tool/system, e.g., PagerDuty, Opsgenie]
- [Link to on-call schedule]
- [Escalation policy for unresponsiveness]

**Primary On-Call Contact:**
- **Current IC:** [Name] — [Phone: ###-###-####] — [Available until: Date/Time]
- **Backup IC:** [Name] — [Phone: ###-###-####]

**War Room Setup (if activated):**
- Slack Channel: [#incident-[system-name]]
- Video Bridge: [Zoom link or conference details]
- Phone Bridge: [Conference line]

---

## 5. Response Procedures

*Instructions: Step-by-step procedures for incident detection, containment, investigation, and recovery. Clear procedures reduce response time.*

### 5.1 Detection & Identification

*Instructions: How incidents are initially detected and triaged.*

**Detection Sources:**
- [ ] Automated Monitoring: Alerts from monitoring system (primary source)
- [ ] User Reports: Customers or internal users report issues
- [ ] Security Alert: Security tools (IDS, WAF, SIEM) detect suspicious activity
- [ ] Third-Party Notification: External party reports issue (competitor, researcher, customer)
- [ ] Audit Discovery: Internal audit or compliance review discovers issue
- [ ] System Logs: Engineer reviews logs and discovers issue

**Triage Procedure:**
1. **Initial Alert Received:**
   - Who: On-call engineer or monitoring system
   - What: Alert details, alert ID, metrics
   - When: Alert timestamp; actual issue start time (may differ)
   - Where: System/component affected

2. **Confirm Alert:**
   - Is alert valid, or false positive?
   - Can issue be reproduced?
   - What is current status? (ongoing, resolved, intermittent)

3. **Determine Severity:**
   - Use severity matrix (Section 2.2)
   - Err on side of higher severity if uncertain (escalate conservative)

4. **Initial Response:**
   - Page on-call team based on severity
   - Open incident ticket with all known information
   - Post to incident channel
   - Start incident commander bridge/war room (if Critical or High with impact)

**Incident Ticket Template:**
```
Incident ID: [Auto-generated]
Severity: [1-4]
Detected: [Timestamp]
Title: [Brief description]
Description: [Detailed description; what, when, where, impact]
Affected System(s): [System names]
Alerts/Evidence: [Links to alerts, logs, metrics]
Initial Assessment: [Root cause hypothesis if known]
Actions Taken: [What has been done so far]
Status: [Open / Investigating / Contained / Resolved]
Owner: [Incident Commander name]
```

### 5.2 Containment

*Instructions: Immediate actions to limit impact and prevent escalation.*

**Containment Goal:** Stop active incident; limit damage; prevent worsening

**General Containment Approach:**
1. **Stop Active Harm:**
   - Block attacking IP (if security incident)
   - Pause model if producing harmful outputs
   - Halt data pipeline if data corrupted
   - Isolate affected systems

2. **Preserve Evidence:**
   - Capture logs, metrics, evidence before making changes
   - Take screenshots of current state
   - Save alerts, queries, relevant context
   - Document what was observed

3. **Implement Workaround:**
   - Activate fallback decision process if model offline
   - Use prior model version (if available and validated)
   - Implement manual decision process (temporary)
   - Route affected requests to alternative service if available

4. **Communicate Status:**
   - Notify stakeholders of known issue
   - Provide status every 30-60 minutes
   - Set expectations for timeline
   - Escalate if resolution uncertain

**Containment by Incident Type:** [Reference Section 3 for type-specific containment procedures]

### 5.3 Eradication

*Instructions: Identify and fix the root cause. Ensures incident doesn't recur.*

**Root Cause Analysis Steps:**
1. **Information Gathering:**
   - Collect all logs, metrics, events related to incident
   - Interview affected users / stakeholders
   - Review recent changes (deployments, config, data)
   - Examine system state at incident start time

2. **Hypothesis Formation:**
   - Generate 3-5 hypotheses about what caused incident
   - Prioritize by likelihood and severity
   - Plan tests to validate/disprove hypotheses

3. **Testing & Analysis:**
   - Review logs for error messages / anomalies
   - Analyze metrics for correlation with incident start
   - Compare current state to baseline/prior states
   - Reproduce issue in controlled environment if possible

4. **Root Cause Confirmation:**
   - Identify most likely root cause
   - Confirm hypothesis with evidence
   - Document findings and supporting evidence

5. **Remediation Planning:**
   - For confirmed root cause, develop fix
   - Assess fix impact and side effects
   - Plan validation approach
   - Determine implementation timeline

6. **Fix Implementation:**
   - Implement root cause fix (code change, config update, data correction)
   - Validate fix resolves issue
   - Test fix doesn't introduce new issues

7. **Validation:**
   - Confirm fix in controlled environment
   - Test with realistic workload
   - Compare metrics to baseline
   - Validate no regression

### 5.4 Recovery

*Instructions: Restore service to normal operations and validate stability.*

**Recovery Steps:**
1. **Validate Fix:**
   - Confirm root cause is fixed
   - Verify workarounds can be removed
   - Test full normal operation

2. **Deployment (if code change):**
   - Deploy fix via standard change control
   - Use staged deployment (canary, blue-green) if possible
   - Monitor closely during and after deployment

3. **Service Restoration:**
   - Remove fallback / manual process
   - Restore normal operation
   - Validate customer-facing systems working normally

4. **Stability Monitoring:**
   - Continue intensive monitoring for 24-72 hours post-recovery
   - Watch for recurrence indicators
   - Watch for side effects from fix

5. **Cleanup:**
   - Document all changes made during incident
   - Remove any temporary workarounds or monitoring
   - Close incident ticket with final status

### 5.5 Lessons Learned

*Instructions: Post-incident review to capture learnings and prevent recurrence.*

**Post-Incident Review (PIR) Meeting:**
- **When:** Within 48 hours of incident resolution
- **Who:** Incident responders, relevant stakeholders, incident commander
- **Duration:** 30-60 minutes
- **Goal:** Understand what happened and how to prevent recurrence

**PIR Agenda:**
1. **Timeline:** Chronological sequence of events
   - When was issue first detected?
   - What actions were taken and when?
   - What were decision points?
   - When was issue resolved?

2. **What Went Well:**
   - Aspects of response that worked effectively
   - Team members who contributed significantly
   - Systems/processes that performed well

3. **What Could Improve:**
   - Gaps in detection, response, or recovery
   - Process improvements needed
   - Training gaps
   - Monitoring / alerting gaps

4. **Root Cause:**
   - Technical root cause (why did issue occur)
   - Systemic root cause (why wasn't it caught earlier)

5. **Action Items:**
   - Specific preventive measures (monitoring, code fixes, process changes)
   - Owner for each action item
   - Target completion date
   - Priority level

6. **MEMORY.md Update:**
   - Document incident summary, root cause, actions
   - Update system architecture / operations documentation if needed
   - Update playbooks based on learnings

**Action Item Tracking:**
- All action items tracked in issue tracker
- Monthly review to ensure completion
- If action overdue, escalate to team lead
- Actions closed only when validated to be complete

---

## 6. Communication Plan

*Instructions: Define what to communicate, to whom, and when. Manages expectations and maintains trust during incident.*

### 6.1 Internal Communications

*Instructions: Communication with internal teams during incident.*

**Immediate Notification (First 15 minutes):**
- On-call team members paged via PagerDuty
- Incident channel opened: [#incident-[system-name]]
- Initial status posted: what is known, what unknown, next steps
- Escalation authority notified if severity High or Critical

**Ongoing Updates During Incident:**
- Every 30 minutes (if High severity) or 60 minutes (if Medium)
- Status update: current status, progress, ETA if known
- Actions taken since last update
- Current work in progress
- Escalation status if needed

**Incident Resolution Communication:**
- Final status posted to incident channel
- Incident marked resolved
- Summary of: what happened, duration, impact, root cause (if known)
- Preliminary action items

**Post-Incident Communication:**
- Full incident summary shared with stakeholders
- PIR findings and action items communicated
- MEMORY.md link shared
- Timeline for action item completion provided

**Communication Channels:**
| Channel | Purpose | Audience | Frequency |
|---------|---------|----------|-----------|
| [Slack #incident-channel] | Real-time incident updates | Incident team + stakeholders | Continuous during incident |
| [War room bridge] | Synchronous discussion | Incident team | Active during investigation |
| [Email escalation] | Executive notification | Leadership | Once for Critical incidents |
| [Incident ticket] | Formal record | Audit trail | As events occur |

### 6.2 External Communications

*Instructions: Communication with customers, regulators, and external parties.*

**Customer Communication Policy:**
- **Timing:** Notified within 30 minutes of confirmed impact to customers
- **Channel:** Appropriate channel (email, status page, in-app notification)
- **Content:** What happened (brief), impact on them, estimated resolution time, what they should do
- **Updates:** Every 1-2 hours during ongoing incident
- **Resolution Notice:** Within 30 min of service restoration

**Status Page:**
- Public status page updated with major incidents
- Start with incident reported; update every hour
- Post resolution notice when issue fixed
- Incident summary posted 24 hours later

**Regulatory Communication:**
- **Privacy Breach:** Must notify regulators within 30-60 days per GDPR/CCPA; Legal to coordinate
- **Security Incident:** May need to notify if regulatory systems affected; Compliance to assess
- **Service Disruption:** May need notification for critical infrastructure; Compliance to assess

**Sample External Communication:**

```
Subject: [System Name] Incident - We're Investigating

We've detected an issue with [System Name] affecting [brief description].
Our team is actively investigating and working to restore service.

What's impacted: [Who and what are affected]
Current status: [In progress / Contained / Being fixed]
Estimated restoration: [Time estimate]
What you can do: [Any workarounds or instructions]

We'll provide updates every [1 hour / 2 hours].
Please monitor [status page] for latest updates.

We apologize for the disruption and appreciate your patience.
```

### 6.3 Post-Incident Communication

**Internal Debrief:**
- PIR findings shared with team
- Key learnings highlighted
- Action items assigned and tracked
- Incident incident marked resolved in tracking system

**External Follow-Up (24 hours post-resolution):**
- Root cause summary shared with customers (if appropriate)
- Preventive measures being implemented
- Timeline for improvements
- Commitment to prevent recurrence

---

## 7. Playbook References

*Instructions: Reference playbooks and procedures for common incident types. Playbooks enable faster, more consistent response.*

### 7.1 Incident Type Playbooks

| Incident Type | Playbook ID | Location | Last Updated | Tested |
|---|---|---|---|---|
| **Model Failure / Degradation** | PB-MOD-001 | [Wiki/Repo link] | [Date] | [Test date] |
| **Adversarial Attack** | PB-SEC-001 | [Link] | [Date] | [Date] |
| **Data Integrity Compromise** | PB-DATA-001 | [Link] | [Date] | [Date] |
| **Bias / Fairness Incident** | PB-FAIR-001 | [Link] | [Date] | [Date] |
| **Privacy Breach** | PB-PRIV-001 | [Link] | [Date] | [Date] |
| **Model Theft** | PB-SEC-002 | [Link] | [Date] | [Date] |
| **Unexpected Behavior** | PB-MOD-002 | [Link] | [Date] | [Date] |
| **System Outage** | PB-OPS-001 | [Link] | [Date] | [Date] |
| **Feature Pipeline Failure** | PB-DATA-002 | [Link] | [Date] | [Date] |

### 7.2 Playbook Update Process

- Playbooks reviewed quarterly by incident response team
- Updated after each major incident with new learnings
- Tested annually via tabletop or simulation exercises
- Feedback from responders incorporated for clarity/effectiveness

---

## 8. Testing & Exercises

*Instructions: Regular testing ensures team is prepared and procedures are effective.*

### 8.1 Tabletop Exercise Schedule

| Exercise | Frequency | Incident Scenario | Participants | Objectives |
|----------|-----------|---------|---|---|
| **Model Failure Tabletop** | Q2 (Spring) | AUC-ROC drops 15%; unclear cause | Incident team + Data Science | Validate detection; decision-making process |
| **Security Incident Tabletop** | Q3 (Summer) | Suspected model extraction attack | Incident team + Security | Security response procedures; escalation |
| **Data Incident Tabletop** | Q4 (Fall) | Data corruption discovered | Incident team + Data Engineering | Data recovery procedures; forensics |
| **Full Response Drill** | Q1 (Winter) | Simulated production incident | All stakeholders | Full incident response process |

### 8.2 Simulation Exercise

**Annual Full-Scale Simulation:**
- Simulate realistic incident scenario
- Test all aspects: detection, containment, recovery, communication
- Include external parties (if applicable)
- Measure response times; identify gaps
- Document findings and improvements

### 8.3 Exercise Evaluation

**Metrics to Track:**
- Time to detect incident
- Time to escalate
- Time to implement containment
- Time to restore service
- Communication effectiveness
- Decision quality

**Post-Exercise Assessment:**
- Team debriefs on effectiveness
- Identify process improvements
- Update playbooks based on findings
- Track improvements over time

---

## 9. Plan Maintenance

*Instructions: Define how the incident response plan itself is kept current.*

### 9.1 Plan Review & Update Schedule

| Review Type | Frequency | Scope | Owner |
|---|---|---|---|
| **Playbook Updates** | Quarterly | Specific playbooks; incorporate learnings from incidents | Incident Response Lead |
| **Roster Updates** | Monthly | Verify on-call personnel; contact info current | HR / Team Lead |
| **Procedure Validation** | Semi-Annual | Tabletop exercises; identify procedure gaps | IR Coordinator |
| **Full Plan Review** | Annual | Comprehensive review; test full response cycle | IR Coordinator + Leadership |

### 9.2 Plan Version Control

[Plan stored in version control with change history]

- **Repository:** [GitHub/GitLab/internal system]
- **Change Tracking:** [Via pull requests / change log]
- **Distribution:** [All team members have access to latest version]

### 9.3 Plan Communication

- **New Hires:** Incident response plan reviewed during onboarding
- **Role Changes:** Plan reviewed when assigned incident response roles
- **Major Updates:** Team notified of significant changes
- **Annual Refresh:** All team members briefed on plan annually

---

## Revision History

| Version | Date | Author/Agent | Change Summary | Status |
|---------|------|--------------|-----------------|--------|
| 1.0 | [YYYY-MM-DD] | [Name] | Initial incident response plan | Approved |
| [Additional versions as updated] |

---

## Approvals

*Instructions: Obtain sign-off from decision authorities.*

| Role | Name | Title | Signature / Approval | Date | Comments |
|------|------|-------|---------------------|------|----------|
| **IR Coordinator** | [Name] | [Title] | [Approval] | [YYYY-MM-DD] | [Comments] |
| **Security Lead** | [Name] | [Title] | [Approval] | [YYYY-MM-DD] | [Comments] |
| **System Owner** | [Name] | [Title] | [Approval] | [YYYY-MM-DD] | [Comments] |
| **Compliance Officer** | [Name] | [Title] | [Approval] | [YYYY-MM-DD] | [Comments] |
| **Executive Sponsor** | [Name] | [Title] | [Approval] | [YYYY-MM-DD] | [Comments] |

---

## Standards Alignment Reference

- **NIST SP 800-53 IR-1 through IR-10:** Incident Response planning, detection, analysis, containment, eradication, recovery, and post-incident activities
- **NIST AI RMF MANAGE-4:** Continuous monitoring and response to manage ongoing AI system security and operational risks
- **ISO 42001 A.16:** Incident management and response procedures for AI management system

---

## Appendices

### A. Contact Information & Escalation

[Full contact list with phone numbers, emails, backup contacts]

### B. Incident Response Team Roles

[Detailed role descriptions and decision-making authority]

### C. System-Specific Incident Procedures

[Procedures specific to each system if applicable]

### D. Glossary

[Terms and definitions related to incident response]

### E. References

[Links to related policies, procedures, tools]

**End of Document**

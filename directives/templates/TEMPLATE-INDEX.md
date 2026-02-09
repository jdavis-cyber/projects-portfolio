# AI PM Builder's Template — Governance & Evidence Template Index

**Version**: 1.0
**Author**: Jerome Davis
**Last Updated**: 2026-02-09
**Purpose**: Master index of all governance and evidence generation templates for the Enterprise AI Governance & Lifecycle Management Framework.

---

## Usage

All templates in this directory are designed for AI agent population during project execution. Each template contains:

- **Metadata headers** with Document ID, Version, Status, Phase, and Applicable Standards
- **Instructional placeholders** in `[brackets]` for agent or human population
- **Standards cross-references** at each section level
- **Revision History** and **Approvals** sections for audit traceability

Agents should reference this index to identify the correct template for their current phase and deliverable requirement. The Program Analyst enforces template usage at phase gates.

---

## Template Inventory

### Phase I — Business Understanding

| Template | File | CSRMC Element | Primary Standards |
|----------|------|---------------|-------------------|
| Mission Risk Profile (MRP) | `mission-risk-profile.md` | MRP | CSRMC, NIST AI RMF GOVERN-1, ISO 42001 Clause 6.1 |
| Governance Scope Statement | `governance-scope-statement.md` | — | ISO 42001 Clause 4.3/5.1, NIST AI RMF GOVERN-2 |
| Statement of Applicability (SoA) | `statement-of-applicability.md` | — | ISO 42001 Clause 6.1.3, NIST SP 800-53 CA-2 |

### Phase II — Data Understanding

| Template | File | CSRMC Element | Primary Standards |
|----------|------|---------------|-------------------|
| Telemetry Configuration | `telemetry-configuration.md` | Telemetry | CSRMC, NIST AI RMF MEASURE-2, ISO 42001 A.7 |
| Reciprocity & Inheritance Register | `reciprocity-inheritance-register.md` | Reciprocity | CSRMC, NIST SP 800-53 CA-2, ISO 42001 Clause 8.1 |
| Data Governance Documentation | `data-governance-documentation.md` | — | ISO 42001 A.4, NIST AI RMF MAP-2, NIST SP 1270 |

### Phase III — Data Preparation

| Template | File | CSRMC Element | Primary Standards |
|----------|------|---------------|-------------------|
| Automated Evidence Package (AEP) | `automated-evidence-package.md` | AEP | CSRMC, ISO 42001 Clause 7.5, NIST AI RMF cross-cutting |
| Data Lineage Record | `data-lineage-record.md` | — | ISO 42001 A.4, NIST AI RMF MAP-2.3 |

### Phase IV — Model Development

| Template | File | CSRMC Element | Primary Standards |
|----------|------|---------------|-------------------|
| Cyber Resilience Posture Report (CRPR) | `cyber-resilience-posture-report.md` | CRPR | CSRMC, NIST AI RMF MANAGE-2, NIST SP 800-53 CA-7, ISO 42001 A.6 |
| Automated Control Validation Ruleset (ACVR) | `automated-control-validation-ruleset.md` | ACVR | CSRMC, NIST SP 800-53 CA-2/CA-7 |
| Threat Model | `threat-model.md` | — | NIST AI RMF MAP-5, NIST AI 100-1, ISO 42001 A.6 |
| Bias Assessment | `bias-assessment.md` | — | NIST SP 1270, NIST AI RMF MEASURE-2.6, ISO 42001 A.10 |
| Architecture Decision Record (ADR) | `architecture-decision-record.md` | — | ISO 42001 Clause 7.5, NIST AI RMF GOVERN-1.2 |

### Phase V — Model Evaluation

| Template | File | CSRMC Element | Primary Standards |
|----------|------|---------------|-------------------|
| CCV Report | `ccv-report.md` | CCV | CSRMC, NIST SP 800-53 CA-7, ISO 42001 Clause 9.1 |
| Go/No-Go Recommendation | `go-no-go-recommendation.md` | — | CPMAI Phase V Gate, NIST AI RMF MANAGE-1, ISO 42001 Clause 8.1 |
| Model Evaluation Report | `model-evaluation-report.md` | — | NIST AI RMF MEASURE-1 through MEASURE-4, ISO 42001 A.8/A.9/A.10 |

### Phase VI — Operationalization

| Template | File | CSRMC Element | Primary Standards |
|----------|------|---------------|-------------------|
| Operational Monitoring Plan | `operational-monitoring-plan.md` | Telemetry | CSRMC, NIST AI RMF MANAGE-4, ISO 42001 A.7/Clause 10.1 |
| Incident Response Plan | `incident-response-plan.md` | Resilience | NIST SP 800-53 IR-1 through IR-10, NIST AI RMF MANAGE-4, ISO 42001 A.16 |

### Cross-Cutting (All Phases)

| Template | File | CSRMC Element | Primary Standards |
|----------|------|---------------|-------------------|
| Phase Gate Review | `phase-gate-review.md` | — | CPMAI Phase Gates, ISO 42001 Clause 9.3 |
| Risk Register | `risk-register.md` | — | ISO 42001 Clause 6.1, NIST AI RMF GOVERN-5/MANAGE-2, NIST SP 800-53 RA-3 |
| Evidence Index | `evidence-index.md` | AEP | ISO 42001 Clause 7.5, CSRMC AEP, NIST SP 800-53 AU-1 |
| Governance Review Template | `governance-review-template.md` | — | ISO 42001 Clause 9.3, NIST AI RMF GOVERN-1.5 |
| Standards Crosswalk Matrix | `standards-crosswalk-matrix.md` | — | ISO 42001 Clause 6.1.3, NIST AI RMF cross-cutting |
| Corrective Action Register | `corrective-action-register.md` | — | ISO 42001 Clause 10.2, NIST SP 800-53 CA-5 |

---

## CSRMC Element Coverage

| CSRMC Element | Template(s) | Phase(s) |
|---------------|-------------|----------|
| Mission Risk Profile (MRP) | `mission-risk-profile.md` | I, updates II-VI |
| Critical Controls Identification | `statement-of-applicability.md`, `standards-crosswalk-matrix.md` | I-II |
| Telemetry Configuration | `telemetry-configuration.md`, `operational-monitoring-plan.md` | II-III, VI |
| Reciprocity & Inheritance Register | `reciprocity-inheritance-register.md` | II, updates III-VI |
| Cyber Resilience Posture Report (CRPR) | `cyber-resilience-posture-report.md` | IV-V, updates VI |
| Automated Evidence Package (AEP) | `automated-evidence-package.md`, `evidence-index.md` | III-VI |
| Continuous Compliance Validation (CCV) | `ccv-report.md` | V-VI |
| Automated Control Validation Ruleset (ACVR) | `automated-control-validation-ruleset.md` | IV-V |

---

## Standards Coverage Summary

| Standard | Templates Addressing |
|----------|---------------------|
| CPMAI v7 | All (lifecycle structure) |
| ISO/IEC 42001 | 20 of 22 templates |
| NIST AI RMF 1.0 | 18 of 22 templates |
| NIST SP 800-53 Rev 5 | 14 of 22 templates |
| DoD CSRMC | 10 of 22 templates (all 8 elements covered) |
| NIST SP 1270 | 3 templates (bias/fairness focused) |
| NIST AI 100-1 | 2 templates (security focused) |
| OMB M-24-10 | 2 templates (governance focused) |

---

## Phase Gate Deliverable Mapping

| Phase Gate | Required Templates |
|------------|-------------------|
| Gate 1 — Business Understanding | `phase-gate-review.md`, `mission-risk-profile.md`, `governance-scope-statement.md`, `statement-of-applicability.md`, `risk-register.md` |
| Gate 2 — Data Understanding | `phase-gate-review.md`, `telemetry-configuration.md`, `reciprocity-inheritance-register.md`, `data-governance-documentation.md`, `risk-register.md` |
| Gate 3 — Data Preparation | `phase-gate-review.md`, `automated-evidence-package.md`, `data-lineage-record.md`, `risk-register.md` |
| Gate 4 — Model Development | `phase-gate-review.md`, `cyber-resilience-posture-report.md`, `automated-control-validation-ruleset.md`, `threat-model.md`, `bias-assessment.md`, `architecture-decision-record.md`, `risk-register.md` |
| Gate 5 — Model Evaluation | `phase-gate-review.md`, `ccv-report.md`, `go-no-go-recommendation.md`, `model-evaluation-report.md`, `automated-evidence-package.md`, `risk-register.md` |
| Gate 6 — Operationalization | `phase-gate-review.md`, `operational-monitoring-plan.md`, `incident-response-plan.md`, `risk-register.md` |

---

## Agent Quick Reference

When you need to produce a governance artifact:

1. Check this index for the correct template
2. Copy the template to the appropriate evidence repository folder (see `ai-governance-framework.md` Evidence Repository Structure)
3. Populate all instructional placeholders with project-specific content
4. Update the metadata header (Document ID, Version, Date, Author/Agent, Status)
5. Submit for review per the Human Reporting Protocol
6. Update the Evidence Index (`evidence-index.md`) with the new artifact

---

*Maintained By*: Program Analyst
*Applies To*: All agents in the workspace
*Source*: Enterprise AI Governance & Lifecycle Management Framework v1.1.1

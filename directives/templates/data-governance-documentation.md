# Data Governance Documentation

## Metadata Header

| Field | Value |
|-------|-------|
| Document ID | DGD-2026-001 |
| Version | 1.0 |
| Date Created | [Enter date] |
| Last Modified | [Enter date] |
| Author/Agent | [Enter responsible AI agent or team name] |
| Review Status | [Draft/In Review/Approved] |
| Current Phase | Phase II - Data Understanding / Phase III - Data Preparation |
| Applicable Standards | ISO 42001 Section A.4 (Data Resources), NIST AI RMF MAP-2 (Measure Data Quality & Usability), NIST SP 1270 (Guidance for AI Risk Management), GDPR, CCPA |

---

## 1. Data Inventory

*Instructions: Catalog all datasets used for model development, training, validation, and production inference. For each dataset, document source, format, size, classification, and ownership. This inventory is foundational to all downstream governance.*

| Dataset ID | Dataset Name | Data Source | Format | Size (Records / GB) | Classification | Owner | Steward | Access Controls | Creation Date | Last Updated | Notes |
|------------|-------------|-----------|--------|-------------------|-----------------|-------|---------|-----------------|--------------|--------------|-------|
| DS-001 | [e.g., Customer Transaction History] | [e.g., Production database; Oracle ERP] | [e.g., Structured; CSV/Parquet] | [e.g., 500M records / 450 GB] | [e.g., Confidential] | [e.g., CFO / Finance Director] | [e.g., Data Steward - Finance] | [e.g., RBAC: Finance team + Data Science read-only] | [Date] | [Date] | [e.g., PII present: customer names, IDs, payment info; GDPR Subject] |
| DS-002 | [e.g., Product Catalog] | [e.g., Marketing database; Salesforce] | [e.g., Structured; JSON] | [e.g., 2M records / 5 GB] | [e.g., Internal] | [e.g., VP Marketing] | [e.g., Data Steward - Marketing] | [e.g., RBAC: Marketing + Data Science read-only] | [Date] | [Date] | [e.g., No PII; updates daily] |
| DS-003 | [e.g., Third-party Demographic Data] | [e.g., DataCorp Inc. / commercial data provider] | [e.g., Structured; CSV] | [e.g., 50M records / 20 GB] | [e.g., Confidential - Third-party] | [e.g., Chief Data Officer] | [e.g., Data Steward - External Data] | [e.g., RBAC: Executive approval req'd; Data Science read-only after approval] | [Date] | [Date] | [e.g., Licensed from DataCorp; license expires 2026-12-31; geographic/use restrictions apply] |
| DS-004 | [e.g., Historical Model Predictions] | [e.g., Model inference logs from production] | [e.g., Semi-structured; JSON Lines] | [e.g., 100M records / 50 GB] | [e.g., Internal] | [e.g., Chief AI Officer] | [e.g., AI Engineering Lead] | [e.g., RBAC: Data Science + Analytics read-only] | [Date] | [Date] | [e.g., Inference data for model performance tracking; 2 years retention] |
| DS-005 | [e.g., External Market Data] | [e.g., Bloomberg, Reuters feeds] | [e.g., Semi-structured; JSON] | [e.g., Real-time streaming; ~10 TB/month] | [e.g., Internal] | [e.g., CIO / Chief Economist] | [e.g., Data Steward - Market Data] | [e.g., RBAC: Analytics + Risk teams] | [Date] | [Date] | [e.g., Real-time market data; licensed subscription; no retention beyond 90 days] |

---

## 2. Data Quality Assessment

*Instructions: Evaluate each dataset's quality across dimensions: completeness, accuracy, consistency, timeliness. Calculate overall quality scores and identify remediation needs.*

### 2.1 Data Quality Metrics Definition

- **Completeness**: Percentage of non-null values across all fields; target ≥99%
- **Accuracy**: Percentage of values conforming to expected format/range; validated via spot-checking against source systems
- **Consistency**: Values match across related tables/systems; checked via referential integrity and statistical comparison
- **Timeliness**: Data freshness; time between transaction and availability in warehouse
- **Uniqueness**: No duplicate records (where uniqueness is expected); checked via primary key analysis

### 2.2 Data Quality Assessment Results

| Dataset ID | Dataset Name | Completeness (%) | Accuracy (%) | Consistency (%) | Timeliness (hours) | Quality Score | Issues Identified | Severity | Remediation Plan | Target Completion | Owner |
|------------|-------------|-----------------|--------------|-----------------|-------------------|---------------|------------------|----------|-----------------|-----------------|-------|
| DS-001 | Customer Transaction History | 99.8% | 98.5% | 97.2% | 2 | 98.4 / 100 | (1) 0.2% null values in optional fields; (2) 1.5% records fail validation rules; (3) 2.8% inconsistency with GL system | Low-Medium | (1) Review null handling in ETL; (2) Add validation rule documentation; (3) Reconciliation process with GL team | [Target date] | Finance Steward |
| DS-002 | Product Catalog | 100% | 99.8% | 99.9% | <1 | 99.9 / 100 | (1) Rare format inconsistencies in product descriptions (0.2%) | Low | (1) Add string normalization in Salesforce | [Target date] | Marketing Steward |
| DS-003 | Third-party Demographic Data | 98.2% | 94.3% | 91.5% | 24 | 93.3 / 100 | (1) 1.8% missing values (sparse geographic coverage); (2) 5.7% accuracy issues (old data, deceased records); (3) Regional inconsistencies (8.5%) | Medium-High | (1) Request updated data from DataCorp; (2) Implement data freshness check (max 6 months old); (3) Regional validation logic | [Target date] | External Data Steward |
| DS-004 | Historical Model Predictions | 99.9% | 99.5% | 99.7% | <1 | 99.7 / 100 | (1) Occasional missing feature values (0.1% of records) during inference errors | Very Low | (1) Improve error handling in inference pipeline to log all features even on failure | [Target date] | AI Engineering Lead |
| DS-005 | External Market Data | 99.5% | 99.2% | 98.8% | 1 (streaming) | 99.2 / 100 | (1) Occasional data feed outages (0.5%); (2) Edge cases in currency conversion (0.8%) | Low | (1) Implement fallback data source; (2) Improve FX handling with redundant source | [Target date] | Market Data Steward |

### 2.3 Quality Gate Enforcement

- **Training Data Quality Gate**: Minimum overall quality score of 95 required before model training begins; remediation plan must be approved by data governance committee
- **Production Inference Quality Gate**: Minimum completeness 98% and accuracy 97% required to serve predictions; continuous monitoring per telemetry-configuration.md Section 5
- **Escalation**: Quality scores below 90 require immediate escalation to Chief Data Officer

---

## 3. Data Lineage & Provenance

*Instructions: For each dataset, document its origin, transformations, versions, and chain of custody. This enables full traceability and impact analysis.*

### 3.1 Data Lineage - Customer Transaction History (DS-001)

**Dataset ID**: DS-001
**Dataset Name**: Customer Transaction History
**Current Version**: 3.2
**Last Updated**: [Date]

#### Origin & Source

- **Primary Source**: Production Oracle ERP database (ERP-001)
- **Source System Owner**: [Finance Director name]
- **Data Collection Method**: [Nightly batch extract from ERP; SQL query: SELECT * FROM transactions WHERE date >= TRUNC(SYSDATE) - 1]
- **Collection Frequency**: Daily at 2:00 AM UTC
- **Acquisition Date**: Historical data from 2015 onwards; ongoing updates daily
- **Legal Basis for Use**: (GDPR-compliant) Legitimate business interest (operational reporting); Customer consent for certain fields (payment method)
- **Contracts/Licensing**: [Internal data; no external licensing]

#### Transformation Pipeline

| Step # | Transformation Type | Description | Tool/Technology | Input Dataset | Output Dataset | Validation Check | Executed By | Date Executed |
|--------|-------------------|-------------|-----------------|---------------|----------------|-----------------|------------|--------------|
| 1 | Data Extraction | Extract transaction records from ERP for last 24 hours | Oracle SQL*Plus + shell script | ERP production DB | Raw transaction file (CSV) | Row count matches ERP count; sampling validation | ETL Agent | [Daily] |
| 2 | Data Cleaning | Remove duplicates, validate format, handle null values | Python (Pandas) | Raw transaction file | Cleaned transaction file | Null rate <0.2%; duplicate check passes | Data Quality Agent | [Daily] |
| 3 | Data Enrichment | Join with customer master; add country, region, segment | SQL (Snowflake) | Cleaned + Customer Master DB | Enriched transaction table | 99.5% join success rate; no orphaned records | ETL Agent | [Daily] |
| 4 | PII Pseudonymization | Hash customer names & emails; keep numeric IDs | Python (cryptography library) | Enriched transaction table | Pseudonymized transaction table | 100% of PII fields hashed; no plain text remaining | Privacy Agent | [Daily] |
| 5 | Schema Validation | Validate against target schema; coerce data types | Dbt (data build tool) | Pseudonymized transaction table | Production transaction table (Snowflake) | Schema validation passes; 100% type coercion success | Data Quality Agent | [Daily] |
| 6 | Aggregation (Optional) | Aggregate to hourly/daily summaries for analytics | SQL (Snowflake) | Production transaction table | Aggregated summary table | Aggregation completeness check; hourly sums verified | Analytics Agent | [Daily] |

#### Version History

| Version | Date Released | Changes Made | Changed By | Reason | Validation Result | Notes |
|---------|--------------|--------------|-----------|--------|------------------|-------|
| 1.0 | 2023-01-15 | Initial dataset creation | [Data Engineer A] | Project inception | Passed QA | Historic data loaded from ERP archive |
| 2.0 | 2023-06-01 | Added customer segment field; refactored transformations | [Data Engineer B] | Business requirement for segmentation analytics | Passed QA | Backfilled historical segments; recalculated 2023 data |
| 2.1 | 2023-08-15 | Fixed currency conversion bug; improved PII hashing | [Data Engineer A] | Bug fix; GDPR compliance enhancement | Passed QA | Reprocessed 2023 data with corrected currency; added AES-256 for PII |
| 3.0 | 2024-01-10 | Migrated from Oracle to Snowflake; added geo-enrichment | [Data Engineer C] | Infrastructure modernization | Passed QA + User Acceptance Test | New Snowflake pipeline deployed; all transformations validated |
| 3.1 | 2024-06-01 | Added real-time streaming mode (in addition to batch) | [Data Engineer C] | Business requirement for lower-latency analytics | Passed QA; latency test (p95 < 1 min) | Streaming via Kafka; backward compatibility maintained |
| 3.2 | 2025-01-05 | Improved data freshness SLA (now 2 hours instead of 24 hours) | [Data Engineer B] | Performance requirement for model inference | Passed QA + performance testing | Implemented incremental updates instead of full replacement |

#### Chain of Custody

| Event | Action | Date | Actor | Evidence | Notes |
|-------|--------|------|-------|----------|-------|
| DS-001 Creation | Dataset created | 2023-01-15 | Data Engineer A | Initial load log | Version 1.0 released |
| DS-001 v1.0 → v2.0 | Schema modified; transformations refactored | 2023-06-01 | Data Engineer B | Code commit: hash abc123def | Segment field added per business request |
| DS-001 v2.0 Validation | QA testing completed | 2023-06-15 | QA Analyst | QA sign-off document | All test cases passed |
| DS-001 v2.0 → v2.1 | Bug fix deployed (currency conversion) | 2023-08-15 | Data Engineer A | Code commit: hash xyz789 | Historical data reprocessed |
| DS-001 v2.1 Validation | QA + user acceptance test | 2023-09-01 | QA + Business Analyst | UAT sign-off | Approved for production use |
| DS-001 v3.0 Migration | Snowflake migration | 2024-01-10 | Data Engineer C | Migration logs; data reconciliation report | 100% data match verified; zero loss |
| DS-001 v3.2 Optimization | Incremental update optimization | 2025-01-05 | Data Engineer B | Performance baseline + test results | Freshness improved 12x; processing time reduced 80% |

#### Data Quality Gates in Pipeline

1. **Input Validation**: [Stage 1] Verify ERP extract row count matches expected; alert if >2% variance
2. **Transformation Validation**: [Stage 2-4] Null rate checks; format validation; referential integrity checks
3. **Schema Validation**: [Stage 5] Dbt tests: not_null on key fields, unique on transaction_id, relationships checks
4. **Output Quality Gate**: [Final] Compare daily counts to previous 30-day average; alert if >5% deviation

#### Known Limitations & Caveats

1. **Historic Data Accuracy**: Pre-2017 data may have data quality issues; recommend validating any analysis using pre-2017 data
2. **Geographic Coverage**: Transaction data includes only domestic (US) transactions; international operations are in separate dataset (DS-006)
3. **PII Retention**: Original customer names/emails are not retained post-pseudonymization; cannot reverse hash if needed for customer follow-up
4. **Currency**: All amounts converted to USD; original currency not stored (consider for future version)
5. **Business Rules**: Certain transaction types excluded (e.g., refunds >$1000 require manual review; may not appear immediately in dataset)

---

### 3.2 Data Lineage - Product Catalog (DS-002)

[Similar structure as 3.1, with section for each major dataset]

**Dataset ID**: DS-002
**Dataset Name**: Product Catalog

[Include origin, transformations, version history, chain of custody, limitations for this dataset]

---

## 4. Bias & Representativeness Assessment

*Instructions: Analyze datasets for potential sources of bias, underrepresentation, and demographic imbalances. Document mitigation measures.*

### 4.1 Demographic Analysis

#### Customer Transaction History (DS-001)

| Demographic Attribute | Category | Record Count | Percentage | Expected Population % | Representation Gap | Bias Concern | Mitigation Measure |
|----------------------|----------|--------------|-----------|----------------------|-------------------|-------------|-------------------|
| **Gender** | Male | 3,200,000 | 64% | 50% | -14% | Underrepresentation of females may bias model predictions for female customers | Stratified sampling; fairness metrics in training |
| | Female | 1,600,000 | 32% | 50% | +18% | | |
| | Non-binary | 200,000 | 4% | 5% | -1% | | |
| **Age Group** | 18-25 | 500,000 | 10% | 12% | -2% | Younger customers underrepresented; may affect recommendations | Weighted loss function in training; fairness monitoring |
| | 26-40 | 2,000,000 | 40% | 38% | +2% | | |
| | 41-60 | 1,500,000 | 30% | 30% | 0% | | |
| | 60+ | 500,000 | 10% | 20% | -10% | Seniors significantly underrepresented; risk of age bias | Oversampling or synthesis of senior customer transactions |
| **Geographic Region** | Urban | 3,500,000 | 70% | 80% | -10% | Rural customers underrepresented | Expand rural customer acquisition; oversample in training |
| | Rural | 1,500,000 | 30% | 20% | +10% | | |
| **Income Level** | Low (<$30K) | 500,000 | 10% | 25% | -15% | Low-income customers significantly underrepresented; risk of bias | Targeted data collection; fairness constraints in model |
| | Medium ($30K-$75K) | 2,000,000 | 40% | 40% | 0% | | |
| | High (>$75K) | 1,800,000 | 36% | 25% | +11% | High-income customers overrepresented | Reweight in training; fairness metrics |
| | Unknown / Declined | 200,000 | 4% | 10% | -6% | Significant income data missing | Imputation strategy; impact analysis on fairness |

### 4.2 Representativeness Assessment Summary

- **Overall Representativeness Score**: 78 / 100 (Moderate)
  - Strengths: Good geographic coverage in urban areas; gender distribution reasonable
  - Weaknesses: Age and income biases present; underrepresentation of low-income, senior, and rural customers

- **Key Bias Risks**:
  1. **Age Bias**: Customers 60+ are 50% underrepresented compared to census data
  2. **Income Bias**: Low-income customers are 60% underrepresented
  3. **Geographic Bias**: Rural customers underrepresented by 25% relative to population

### 4.3 Mitigation Measures

| Bias Type | Mitigation Approach | Implementation | Owner | Timeline |
|-----------|-------------------|----------------|-------|----------|
| Age Bias | (1) Oversample senior customer transactions (x1.5 weight); (2) Fairness metrics for demographic parity across age groups; (3) Separate model variant for 60+ segment if fairness gap >5% | Modify training data weighting; add age-stratified fairness metrics to telemetry-configuration.md | Data Science Lead | Q1 2025 |
| Income Bias | (1) Address missing income data via imputation or weighted handling; (2) Fairness constraints for income level parity; (3) Fairness monitoring with disparate impact analysis | Implement KNN-based income imputation; add income-stratified fairness metrics | Data Science Lead | Q1 2025 |
| Geographic Bias | (1) Targeted data acquisition for rural customers; (2) Fairness metrics for rural parity; (3) Optional: geographic-specific model if rural-specific patterns exist | Geographic stratification in fairness metrics; rural customer acquisition plan | Product & Data Science | Q2 2025 |

---

## 5. Privacy Impact Assessment (PIA)

*Instructions: Document PII inventory, legal basis for processing, consent mechanisms, and data protection measures. Fulfills GDPR Article 35 DPIA requirements.*

### 5.1 PII Inventory

| PII Category | Data Elements | Sensitivity | Location(s) | Retention Period | Legal Basis |
|--------------|---------------|-------------|------------|-----------------|------------|
| **Identity Information** | Customer name, customer ID, email address, phone number | High | DS-001, DS-007 (Customer Master), Production DB | 7 years (per tax requirement) + 2 additional years for dispute resolution | Legitimate business interest; Customer consent for marketing |
| **Financial Information** | Account numbers, transaction amounts, payment method, credit card (last 4 only; full card not stored) | High | DS-001, Payment Processing System | Transaction history: 7 years; Payment methods: 3 years or until account closure | Legitimate business interest (payment processing); Legal obligation (tax, anti-fraud) |
| **Behavioral/Transaction Data** | Purchase history, browsing history, product preferences, interaction timestamps | Medium | DS-001, DS-004, Analytics DB | 3 years for active customer; 2 years post-account closure | Legitimate business interest (analytics, personalization); Customer consent for personalization |
| **Demographic Information** | Age, gender, income level, family status, geographic location | Medium | DS-001, DS-003 (Third-party), Customer Profile DB | 3 years (or until customer revokes consent) | Legitimate business interest (customer segmentation); Customer consent for profiling |
| **Communication Preferences** | Email frequency, channel preference, opt-in/out status | Medium | Customer Preference DB | Duration of customer relationship + 1 year | Legitimate business interest; Customer consent (explicit) |

### 5.2 Legal Basis for Processing (GDPR)

| Data Processing Activity | Data Categories | Legal Basis | Justification | Consent Required? |
|--------------------------|-----------------|------------|---------------|-----------------|
| Transaction Processing | Identity, Financial | Contractual Necessity | Required to fulfill customer purchase & payment obligations | No (contractual) |
| Regulatory Compliance (Tax, Anti-Fraud) | Identity, Financial | Legal Obligation | Required by tax law, anti-money laundering, fraud prevention | No (legal obligation) |
| Analytics & Model Training (Product Recommendations) | Behavioral, Demographic | Legitimate Business Interest | Improve customer experience; no significant rights impact with appropriate safeguards | Consent (for profiling per GDPR Art. 22) |
| Marketing Communications | Identity, Communication Preferences | Legitimate Business Interest + Consent | Promote products to existing customers; explicit opt-in required per CAN-SPAM | Yes (explicit consent) |
| AI Model Development (Fair Lending, Anti-Discrimination) | Demographic, Financial, Behavioral | Legitimate Business Interest | Ensure model fairness; prevent discriminatory outcomes | Consent (for automated decision-making per GDPR Art. 22) |

### 5.3 Consent Mechanisms

| Data Processing | Consent Type | Consent Mechanism | Withdrawal Mechanism | Documentation |
|-----------------|-------------|-------------------|-------------------|----|
| Marketing Email Communications | Explicit Opt-in | Checkbox during account creation; email with confirmation link | One-click unsubscribe in every email; account preference center | Consent timestamp logged; audit trail maintained |
| Behavioral Profiling for Recommendations | Explicit Opt-in | Separate consent screen during onboarding; in-account privacy settings | Account preference center; email support; DSAR process | Timestamp, opt-in status versioned |
| Third-party Data Sharing (Analytics Partners) | Explicit Opt-in | Separate consent screen; annual re-consent | Account preference center; email to support | Consent records retained per data retention policy |

### 5.4 Anonymization & Pseudonymization Techniques

| PII Data Element | Current Technique | Technique Type | Reversibility | Compliance Level | When Applied |
|-----------------|------------------|-----------------|---------------|-----------------|-------------|
| Customer Name | Cryptographic hashing (SHA-256 with salt) | Pseudonymization | Irreversible (one-way hash) | GDPR pseudonymization requirement | Before loading to data warehouse |
| Customer Email | Hashing (SHA-256 with salt); domain removed | Pseudonymization | Irreversible | GDPR pseudonymization requirement | Before loading to data warehouse |
| Phone Number | Truncation (keep only area code + first digit) | Anonymization | Irreversible | Strong anonymization (re-identification unlikely) | For geographic analysis only |
| Credit Card Number | Tokenization (store only last 4 digits; payment gateway holds full) | Tokenization | Irreversible | PCI DSS compliant | At all times (full card never stored) |
| Birthdate | Age bucketing (18-25, 26-40, 41-60, 60+) | Generalization | Irreversible (cannot recover exact date) | Anonymization for age-based analytics | Only for fairness analysis (not stored per-record) |
| IP Address | Hashing; last octet removed | Pseudonymization | Irreversible | GDPR pseudonymization | Web analytics only |
| Location Data | Aggregation to city/county level (not street address) | Aggregation/Generalization | Irreversible (cannot recover exact address) | Anonymization for geographic analytics | Geographic analysis only |

### 5.5 Data Protection Measures

| Protection Measure | Implementation | Scope | Owner | Verification |
|-------------------|----------------|-------|-------|--------------|
| **Encryption in Transit** | TLS 1.3 for all network transfers | All data movement between systems | Security Engineering | Monthly cipher suite audit; TLS version verification |
| **Encryption at Rest** | AES-256 encryption; keys managed via AWS KMS | Data warehouse, backups, archives | Security Engineering | Quarterly key management audit |
| **Access Controls** | RBAC; principle of least privilege; approval for data access | All data warehouses and databases | IAM Team | Quarterly access review; role re-certification |
| **Data Minimization** | Collect only necessary fields; delete non-essential PII post-retention period | All data ingestion & retention | Data Steward | Annual retention policy review |
| **Audit Logging** | Log all access to PII data; forward logs to SIEM | PII databases, data warehouse | Logging & SIEM | Real-time log monitoring; monthly access review |
| **Database Activity Monitoring (DAM)** | SQL query auditing; alert on unusual access patterns | All PII databases | Security Operations | Real-time monitoring; quarterly report |

### 5.6 Data Subject Rights (GDPR)

| Right | Implementation | Process | SLA | Owner |
|------|----------------|---------|-----|-------|
| **Right of Access (Art. 15)** | Customer can request copy of their data | Submit request via privacy portal or email; response includes all personal data | 30 days | Privacy Officer |
| **Right to Rectification (Art. 16)** | Customer can request correction of inaccurate data | Submit correction request; verified by customer service; updated in all systems | 30 days | Data Steward + Customer Service |
| **Right to Erasure (Art. 17)** | Customer can request deletion ("right to be forgotten") | Submit deletion request; assess legal retention obligations; delete from operational systems; log deletion | 30 days | Privacy Officer + Data Steward |
| **Right to Restrict Processing (Art. 18)** | Customer can restrict use of their data (e.g., for marketing) | Submit restriction request; flag account; pause marketing; continue operational processing | 15 days | Privacy Officer + Marketing |
| **Right to Data Portability (Art. 20)** | Customer can request export of their data in machine-readable format | Generate structured export (CSV/JSON); verify identity; deliver securely | 30 days | Privacy Officer |
| **Right to Object (Art. 21)** | Customer can object to processing (e.g., profiling, direct marketing) | Submit objection; flag account; cease objective processing; document objection | 15 days | Privacy Officer + Business Unit |

### 5.7 Data Breach Notification Procedure

- **Detection**: Automated alerts on unauthorized access attempts; breach detection monitoring
- **Assessment**: Immediate assessment of breach scope, data affected, likelihood of harm
- **Notification to DPA**: Notify supervisory authority within 72 hours (per GDPR Art. 33) if breach affects rights & freedoms
- **Notification to Data Subjects**: Notify affected individuals without undue delay (per GDPR Art. 34) if high risk
- **Documentation**: Record all breaches, communications, remedial actions in breach register
- **Retention**: Breach records retained for 3 years minimum

---

## 6. Data Access Controls

*Instructions: Define role-based access matrix specifying who can access which datasets, for what purposes, under what conditions.*

### 6.1 Roles & Access Levels

| Role | Department | Data Access Level | Datasets Accessible | Conditions / Restrictions | Approval Required |
|------|-----------|------------------|------------------|---------------------------|------------------|
| **Data Engineer** | Data & Analytics | Full (read/write) | DS-001, DS-002, DS-005 (production) | Must operate within established data pipelines; no ad-hoc SQL on production DBs | Manager |
| **Data Scientist** | ML & AI | Read (analytical) | DS-001, DS-002, DS-003, DS-004 (with pseudonymized PII) | For model development/training only; cannot export raw data; limited to pre-approved subsets | Manager |
| **Business Analyst** | Business Operations | Read (aggregated) | DS-002, Aggregated views of DS-001 | Only aggregated/summarized data (no individual records); cannot see PII | No approval |
| **Data Steward** | Data & Analytics | Full (management) | All datasets they steward | Can modify metadata, retention policies, access grants | Chief Data Officer |
| **Compliance Officer** | Compliance & Risk | Read (audit) | All datasets (audit logs + data samples) | For audit & compliance verification only; cannot access raw data for analytics | Chief Compliance Officer |
| **CISO / Security Officer** | Information Security | Full (security audit) | All datasets + security logs | For security incident investigation only; must log access; quarterly review | Chief Information Security Officer |
| **Customer Service Rep** | Customer Service | Read (specific customer) | Customer Master (DS-007) only; filtered to customers they support | Can look up customer info to handle support cases; cannot export data | Manager |
| **Executive / Board Member** | Executive | Read (dashboards) | Executive Dashboards only; aggregated KPIs | Dashboards automatically updated; no ad-hoc data access | Chief Data Officer |
| **AI Ethics Officer** | Risk & Governance | Read (fairness analysis) | DS-001, DS-002, DS-004; fairness metrics | For fairness audits and bias assessment; can request data extracts with approval | Chief Compliance Officer |

### 6.2 Encryption & Security Requirements by Data Classification

| Classification | Encryption in Transit | Encryption at Rest | Access Control | Audit Logging | Approval for Access |
|----------------|----------------------|-------------------|----------------|----------------|------------------|
| **Public** | HTTPS recommended | None required | Open | Optional | None |
| **Internal** | TLS 1.2+ required | Not required | IP whitelist; basic auth | Required | Manager |
| **Confidential** | TLS 1.2+ required; mutual TLS for APIs | AES-256 required | RBAC; VPN/IP whitelist; MFA | Real-time monitoring | Manager + Data Steward |
| **Restricted** | TLS 1.2+ required; VPN required | AES-256 required; separate key per environment | Explicit approval per user; MFA required | Real-time logging + monthly review | Chief Data Officer + Data Steward |

### 6.3 Audit Logging & Access Monitoring

- **What is logged**: All data access attempts (success & failure); query history for databases; file access for data lakes
- **Log retention**: 2 years hot; 7 years cold archive
- **Real-time monitoring**: Alerts on failed authentication attempts; alerts on bulk data exports
- **Monthly access review**: Access control audits to ensure least privilege is maintained
- **Quarterly access recertification**: Managers recertify that reports still need assigned access levels

---

## 7. Data Retention & Disposal

*Instructions: Define how long each dataset is retained and how it is disposed of securely when no longer needed.*

### 7.1 Retention Schedule

| Dataset ID | Dataset Name | Retention Period | Legal/Regulatory Basis | Disposal Method | Archive Strategy | Owner |
|------------|-------------|-----------------|-------------------|----|--|-----|
| DS-001 | Customer Transaction History | 7 years (operational) | Tax law (IRS 7-year requirement) | Cryptographic erasure; shred magnetic media | 1 year hot (Snowflake); 6 years cold archive (S3 Glacier) | Finance Steward |
| DS-002 | Product Catalog | 3 years (current + 2 years historical) | Business continuity; model versioning | Cryptographic erasure | 3 years (snowflake); after 3 years, delete | Marketing Steward |
| DS-003 | Third-party Demographic Data | Duration of license + 1 year | License agreement with DataCorp; compliance buffer | Cryptographic erasure; purge with DataCorp | 1 year hot; after 1 year, securely delete | Chief Data Officer |
| DS-004 | Historical Model Predictions | 2 years (operational); 3 years total | Model versioning; incident investigation | Deletion after retention | 2 years hot (production); 1 year cold archive; then delete | AI Engineering Lead |
| DS-005 | External Market Data | 90 days (license agreement limit) | License agreement; regulatory requirement | Secure deletion per contract | No archival; delete after 90 days | Market Data Steward |

### 7.2 Disposal Procedures

- **Operational Data Deletion**: Data reaching end of retention period is automatically deleted from production systems via scheduled jobs
- **Cold Archive Deletion**: Archives are securely deleted after extended retention; deletion verified via hash/integrity check
- **Cryptographic Erasure**: Keys used to encrypt data are destroyed; data becomes unrecoverable without re-encryption
- **Media Destruction**: Any physical media (disks, backups) containing sensitive data are degaussed or shredded per NIST guidelines
- **Verification**: Deletion is logged and auditable; sample verification of deletions conducted quarterly
- **Exceptions**: Legal holds may extend retention if litigation is pending; legal counsel notified before deletion

---

## 8. Ethical Data Use Statement

*Instructions: Define ethical principles governing how data is used, prohibited applications, and restrictions on model usage.*

### 8.1 Ethical Data Use Principles

We commit to the following principles in the use of customer data for AI model development and deployment:

1. **Human Dignity**: Data use respects individual privacy and dignity; we do not use data in ways that dehumanize or reduce individuals to scores or categories without their knowledge or meaningful consent.

2. **Fairness & Non-Discrimination**: AI models derived from this data will not be used to discriminate against individuals based on protected characteristics (race, gender, age, disability, national origin, religion, sexual orientation) without explicit, documented business justification and robust fairness testing.

3. **Transparency**: We disclose to customers when AI models are used to make decisions affecting them; we provide explanations of model decisions upon request.

4. **Accountability**: We are accountable for decisions made by AI models; a human maintains final decision-making authority for high-stakes decisions (credit, employment, legal).

5. **Beneficial Purpose**: We use data to create positive value for customers and society; we do not use data for surveillance, manipulation, or harm.

6. **Consent & Control**: Customers retain control over their data; they may withdraw consent, request deletion, or object to specific uses.

### 8.2 Restricted Use Cases

The following applications are explicitly PROHIBITED without additional executive and ethics committee approval:

| Prohibited Use | Reason | Required Approval |
|---|---|---|
| Predictive policing or criminal risk scoring | High risk of bias and discriminatory outcomes; insufficient human oversight in law enforcement | CEO + Board |
| Employment discrimination (hiring, firing, promotion decisions based on protected characteristics) | Violates employment law; high fairness risk; insufficient individual due process | Chief Legal Officer + Board |
| Loan denial based solely on algorithmic score (without human review) | Violates fair lending laws; disproportionate impact on minorities | Chief Risk Officer + Chief Compliance Officer |
| Pricing discrimination based on customer demographic characteristics or "willingness to pay" inferred from demographics | Potential antitrust violation; fairness concern; customer trust impact | Chief Legal Officer + CEO |
| Manipulation or deception (e.g., manipulative product recommendations designed to exploit customer vulnerabilities) | Unethical; customer harm; brand risk | Chief Ethics Officer + CEO |
| Sale of personal data to third parties without explicit customer consent | Privacy violation; customer trust breach; potential legal violation | Chief Privacy Officer + CEO |
| Real-time facial recognition for mass surveillance | Privacy violation; freedom concerns; inadequate regulatory framework | Chief Privacy Officer + Board |

### 8.3 Use Case Approval Workflow

For use cases involving sensitive data or high-risk decisions:

1. **Documentation**: Data scientist documents proposed use case, data elements required, model approach, fairness impact
2. **Ethics Review**: AI Ethics Officer reviews for bias risk, transparency, consent alignment
3. **Legal Review**: Chief Legal Officer reviews for regulatory compliance
4. **Data Steward Approval**: Data Steward (or Data Governance Committee) approves data access for specific use case
5. **Monitoring Plan**: If approved, monitoring plan is established per telemetry-configuration.md; fairness alerts configured
6. **Ongoing Oversight**: Quarterly ethics audit of approved use cases; fairness metrics reviewed; adverse outcomes investigated

---

## 9. Revision History

| Version | Date | Changes Made | Changed By | Reason | Approval Status |
|---------|------|--------------|-----------|--------|-----------------|
| 1.0 | [Date] | Initial template creation | [Agent/Team] | Framework establishment | [Pending] |
| [Version] | [Date] | [Changes] | [Author] | [Reason] | [Status] |

---

## 10. Approvals

This Data Governance Documentation establishes the framework for responsible management of data used in AI systems. Approval by all parties below indicates agreement with data quality standards, privacy protections, ethical use principles, and governance procedures.

| Role | Name | Signature | Date | Notes |
|------|------|-----------|------|-------|
| Chief Data Officer | [Name] | ________________ | ____/____/____ | Confirms data quality standards and governance |
| Chief Privacy Officer | [Name] | ________________ | ____/____/____ | Confirms GDPR/CCPA compliance and PII handling |
| Chief AI Officer | [Name] | ________________ | ____/____/____ | Confirms fairness and ethical use principles |
| AI Ethics Officer | [Name] | ________________ | ____/____/____ | Confirms bias assessment and mitigation measures |
| Chief Compliance Officer | [Name] | ________________ | ____/____/____ | Confirms regulatory compliance (GDPR, CCPA, Fair Lending, etc.) |
| General Counsel | [Name] | ________________ | ____/____/____ | Confirms legal basis for data processing |

---

**Document Classification**: [Confidential / Internal Use / Public]

**Next Review Date**: [e.g., 90 days from approval]

**Related Documents**:
- Data Lineage Record (data-lineage-record.md)
- Telemetry Configuration (telemetry-configuration.md)
- Automated Evidence Package (automated-evidence-package.md)
- AI Governance Framework (ai-governance-framework.md)
- Privacy Impact Assessment (separate DPIA document if required)

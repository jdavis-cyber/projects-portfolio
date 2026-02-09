# Data Lineage Record

## Metadata Header

| Field | Value |
|-------|-------|
| Document ID | DLR-2026-001 |
| Version | 1.0 |
| Date Created | [Enter date] |
| Last Modified | [Enter date] |
| Author/Agent | [Enter responsible AI agent or data engineering team name] |
| Review Status | [Draft/In Review/Approved] |
| Current Phase | Phase III - Data Preparation |
| Dataset ID | [Enter dataset ID from data-governance-documentation.md Section 1] |
| Applicable Standards | ISO 42001 Section A.4 (Data Resources), NIST AI RMF MAP-2.3 (Data Provenance & Lineage), NIST SP 1270 (AI RMF) |

---

## 1. Dataset Identification

*Instructions: Provide unique identification and basic characteristics of the dataset documented in this lineage record. Link to the data inventory in data-governance-documentation.md.*

### 1.1 Dataset Basic Information

| Field | Value |
|-------|-------|
| **Dataset ID** | [e.g., DS-001] |
| **Dataset Name** | [Enter full, descriptive name of dataset] |
| **Current Version** | [e.g., 3.2] |
| **Version Release Date** | [Date of current version release] |
| **Data Classification** | [Public / Internal / Confidential / Restricted] |
| **Custodian/Owner** | [Department or individual responsible for dataset] |
| **Data Steward** | [Name, role, contact] |
| **Primary Use Case(s)** | [e.g., Model training for customer lifetime value prediction; ongoing inference scoring] |
| **Geographic Scope** | [e.g., US only; GDPR-applicable (EU); Global] |
| **Data Sensitivity** | [High/Medium/Low - re-identify risk assessment] |

### 1.2 Dataset Size & Scope

| Metric | Value |
|--------|-------|
| **Record Count (Current)** | [e.g., 5 million customer records] |
| **Historical Record Count Range** | [e.g., From 100K (2015) to 5M (2025)] |
| **Data Volume (GB)** | [e.g., 450 GB] |
| **Field/Column Count** | [e.g., 127 columns] |
| **Time Period Covered** | [e.g., January 2015 - December 2024] |
| **Update Frequency** | [e.g., Daily; incremental updates each morning at 2 AM UTC] |
| **Retention Period** | [e.g., 7 years operational; 2 years archival] |

---

## 2. Source Documentation

*Instructions: Document where the dataset originates, how it's acquired, and the legal basis for processing. Provide chain-of-custody from source to current state.*

### 2.1 Primary Data Source

| Field | Value |
|--------|-------|
| **Source Name** | [e.g., Production Customer Database (Oracle ERP)] |
| **Source Type** | [Operational system / Data warehouse / Third-party provider / Sensor data / User-generated / Synthesized] |
| **Source System Owner** | [Department or organization responsible for source system] |
| **Data Acquisition Method** | [e.g., Nightly batch extract via SQL; real-time streaming via Kafka; API polling; manual export] |
| **Acquisition Frequency** | [e.g., Daily at 2:00 AM UTC; real-time (sub-second latency); weekly; on-demand] |
| **Acquisition Date (Earliest)** | [When dataset first acquired] |
| **Acquisition Date (Latest)** | [When last data was pulled/loaded] |

### 2.2 Source System Characteristics

- **Source System**: [System name, version, location]
- **Database Technology**: [e.g., Oracle 19c; PostgreSQL 13; Snowflake]
- **Data Format in Source**: [e.g., Relational tables; JSON documents; flat files; binary format]
- **Data Quality in Source**: [Known issues with source data, e.g., "2-3% null values in customer_email; duplicates cleaned before load"]
- **Source System SLA**: [Data availability/freshness guarantee from source system owner]

### 2.3 Data Acquisition Technical Details

**SQL Extract Query** (if applicable):
```sql
[Example:
SELECT
  customer_id,
  customer_name,
  email_address,
  transaction_date,
  transaction_amount,
  product_category
FROM transactions_table
WHERE transaction_date >= TRUNC(SYSDATE) - 1
  AND transaction_status = 'COMPLETED'
ORDER BY transaction_date DESC
]
```

**Extraction Code/Script**:
- Language: [e.g., Python, Bash, SQL]
- Location: [e.g., Git repo: `/etl-scripts/customer-transactions-extract.py`]
- Version Control: [Branch, commit hash]
- Last Updated: [Date]
- Maintenance Owner: [Name]

### 2.4 Legal Basis for Data Collection & Processing

| Basis | Description | Applicable Regulations | Consent Required |
|-------|-----------|----------------------|-----------------|
| **[e.g., Contractual Necessity]** | [e.g., Transaction data collected to fulfill customer purchase and payment obligations] | [e.g., GDPR Lawful Basis Article 6(1)(b)] | No (contractual basis) |
| **[e.g., Legitimate Business Interest]** | [e.g., Customer segmentation data for analytics and personalization] | [e.g., GDPR Article 6(1)(f); CCPA Consumer Right to Know] | Opt-out provided |
| **[e.g., Legal Obligation]** | [e.g., Financial transaction data for tax reporting and anti-fraud compliance] | [e.g., IRS regulations; FinCEN AML requirements] | No (legal obligation) |

---

## 3. Transformation Pipeline

*Instructions: Document every step of data processing from raw source to final dataset. This is the most critical section for reproducibility and impact analysis.*

### 3.1 Pipeline Overview

[Enter high-level description of the data pipeline]

Example: "This dataset is produced by an automated daily ETL process that extracts transaction records from the production Oracle ERP database, cleans and validates the data against business rules, enriches with customer master data, pseudonymizes PII, applies schema validation, and finally aggregates into a production data warehouse table in Snowflake."

### 3.2 Detailed Transformation Steps

*For each major transformation step, provide this level of detail:*

| Step # | Step Name | Transformation Type | Detailed Description | Input Dataset(s) | Output Dataset(s) | Tool/Technology | Code/Script Location | Validation Check | Date First Executed | Last Executed | Executed By (Role) | Owner | Notes |
|--------|-----------|-------------------|----------------------|-----------------|-----------------|-----------------|--------------------|--------------------|-------------------|-----------------|------------------|-------|-------|
| **1** | Data Extraction | Extract | Query production ERP database for all transactions from previous 24 hours; filter for completed transactions only; no PII redaction yet | Oracle ERP `transactions_table` | Raw transaction extract (CSV file, ~500K rows) | Oracle SQL*Plus + Bash script | `/etl-scripts/extract-transactions.sh` | Row count matches expected; sampling validation of 100 random rows | 2023-01-15 | [Daily] | Data Engineer (automated) | Data Engineering Team | Runs at 2:00 AM UTC; error handling with email alerts on failure |
| **2** | Data Cleaning | Transform | Remove duplicate records (check on transaction_id); validate data types; handle null values in optional fields; flag invalid email addresses | Raw transaction extract | Cleaned transaction file | Python (Pandas) | `/etl-scripts/data_cleaning.py` | Duplicate count == 0; null rate < 0.2%; invalid email count logged; sampling validation | 2023-01-15 | [Daily] | Data Engineer (automated) | Data Engineering Team | Duplicates removed using transaction_id as key; nulls in optional_comment field allowed; invalid emails quarantined for manual review |
| **3** | Customer Enrichment | Transform/Enrich | Join with Customer Master table to add customer segment, geography, lifecycle stage; left outer join (preserve all transactions even if customer not in master) | Cleaned transaction file + Customer Master DB | Enriched transaction table | SQL (Snowflake) | `/etl-scripts/customer-enrichment.sql` | Join success rate ≥ 99.5%; null rate in new fields < 1%; compare enriched row count to input (should match) | 2023-01-15 | [Daily] | Data Engineer (automated) | Data Engineering Team | Join on customer_id; right table refreshed nightly; customer_segment may be null for new customers (acceptable) |
| **4** | PII Pseudonymization | Encrypt/Mask | Hash customer name and email address using SHA-256 with salt; remove intermediate identifiers; keep numeric customer_id for joining | Enriched transaction table | Pseudonymized transaction table | Python (cryptography lib) + Snowflake UDF | `/etl-scripts/pii-pseudonymization.py` | 100% of PII fields hashed; no plain-text names/emails remain; spot-check hashes are deterministic (same input = same hash) | 2023-06-01 | [Daily] | Data Engineer (automated) | Data Engineering Team | Salt generated per dataset; key stored in AWS KMS; hashing is one-way (irreversible); GDPR pseudonymization requirement satisfied |
| **5** | Schema Validation | Validate | Validate data against target Snowflake schema; coerce column types; check NOT NULL constraints on required fields; data type conversion | Pseudonymized transaction table | Type-validated transaction table | Dbt (data build tool) | `/transform/models/transactions.yml` + `/transform/models/transactions.sql` | Schema validation passes; 100% type coercion success; NOT NULL violations == 0; data type mismatches logged | 2023-01-15 | [Daily] | Data Engineer (automated) | Data Engineering Team | Dbt version 1.5; tests defined in `transactions.yml`; failures block pipeline advancement |
| **6** | Business Rules Validation | Validate | Apply business rules: transaction amount > 0, transaction_date <= today, product_category in approved list, customer_country in approved markets | Type-validated transaction table | Rules-validated transaction table | SQL (Snowflake) | `/etl-scripts/business-rules-validation.sql` | Invalid records == 0; violations logged to quarantine table for investigation; invalid rate < 0.1% | 2023-01-15 | [Daily] | Data Engineer (automated) | Data Engineering Team | Rules updated 2024-06-15 to add new product categories; all historical data validated against current rules; 0.05% violations found and quarantined |
| **7** | Aggregation (Optional) | Aggregate | Sum transaction amounts by customer, date, category to create daily customer spend summary; used for dashboard and reporting | Rules-validated transaction table | Aggregated daily customer spend (flat table, ~50K rows/day) | SQL (Snowflake) | `/transform/models/customer-daily-spend.sql` | Aggregation completeness check: sum of aggregated == sum of detail; hourly sums verified; no null keys | 2024-01-10 | [Daily] | Data Engineer (automated) | Data Engineering Team | Optional for reporting; not used in ML training; aggregated table refreshed daily; historical data re-aggregated on rule changes |
| **8** | Data Quality Scoring | Validate | Calculate quality metrics (completeness %, accuracy %, consistency %); compare to thresholds; flag if below acceptable range | Rules-validated transaction table | Quality metrics log | Python | `/etl-scripts/data-quality-scoring.py` | Quality score ≥ 95; if below, pipeline pauses and alerts; manual review required before approval | 2023-01-15 | [Daily] | Data Quality Agent | Data Quality Team | Added 2024-03-01; metrics defined in telemetry-configuration.md Section 2; alerts sent to Slack + email |

### 3.3 Data Quality Gates in Pipeline

| Gate # | Gate Name | Location (Step #) | Quality Criteria | Validation Method | Action on Failure | Owner |
|--------|-----------|------------------|-----------------|------------------|-----------------|-------|
| **Gate-A** | Input Completeness | After Step 1 (Extraction) | Row count variance < 2% from expected; no zero-byte files | Compare daily row count to 30-day average | Alert and quarantine batch; retry extraction | Data Engineering |
| **Gate-B** | Data Cleaning Quality | After Step 2 (Cleaning) | Null rate < 0.2%; duplicate rate = 0%; invalid format count = 0 | Automated validation checks | Quarantine and alert; investigate; manual remediation if needed | Data Quality Team |
| **Gate-C** | Join Completeness | After Step 3 (Enrichment) | Join success rate ≥ 99.5%; no unexpected nulls in key fields | Join verification query; sample audit | Alert; assess impact; may proceed with < 99.5% if risk accepted | Data Engineering |
| **Gate-D** | PII Compliance | After Step 4 (Pseudonymization) | 100% of PII fields are hashed; no plain-text PII present; spot-check hashes | Automated PII detection scan; manual sampling | Halt pipeline; mandatory review by Privacy Officer | Data Engineering + Privacy |
| **Gate-E** | Schema Compliance | After Step 5 (Schema Validation) | Schema matches target; 100% type coercion success; zero NOT NULL violations | Dbt tests; schema comparison | Halt pipeline; resolve schema mismatch; rerun validation | Data Engineering |
| **Gate-F** | Business Rules Compliance | After Step 6 (Rules Validation) | Business rule violations ≤ 0.1%; no transactions in invalid category list | Rule violation count from quarantine table | Alert; assess impact; remediate rules or data; approve manually if necessary | Product + Data Engineering |
| **Gate-G** | Overall Quality Gate | After all transformations | Quality score ≥ 95; all sub-gates passed or approved exceptions documented | Quality scoring algorithm; gate sign-off | Prevent loading to production; escalate to Data Steward | Data Governance |

---

## 4. Version History

*Instructions: Track all versions of this dataset. For each version, document what changed, why, and who made the change. This enables impact analysis (e.g., "which predictions were made with dataset version 2.0 vs. 2.1?").*

| Version | Release Date | Version Status | Changes Made | Reason for Change | Changed By | Validation Status | Historical Data Reprocessed? | Impact / Notes |
|---------|------------|-----------------|--------------|-----------------|-----------|------------------|------------------------------|-----------------|
| **1.0** | 2023-01-15 | Archived | Initial dataset creation; populated with historical data from ERP (2015-2022); daily updates from that date forward | Project inception; baseline establishment | Data Engineer A | Passed QA | No (historical data loaded once) | Initial dataset; used for model v1.0 development |
| **2.0** | 2023-06-01 | Archived | Added customer_segment field (derived from customer master); refactored ETL script to use new source (upgraded ERP version) | Business requirement for segmentation analytics; infrastructure upgrade | Data Engineer B | Passed QA | Yes (all historical data re-loaded with segment) | Segment field added; enables segmentation-based insights; ~500K additional records in segment lookup |
| **2.1** | 2023-08-15 | Archived | Fixed currency conversion bug (EUR/GBP exchange rate was 1-day stale); improved PII hashing (upgraded from MD5 to SHA-256) | Bug fix (currency inaccuracy identified in audit); GDPR compliance enhancement | Data Engineer A | Passed QA | Yes (2023 data re-processed with corrected rates) | ~1.2% of 2023 transactions had currency error (now fixed); PII hash now GDPR pseudonymization-compliant |
| **3.0** | 2024-01-10 | Archived | Major infrastructure migration: Oracle ERP → Snowflake data warehouse; replaced batch ETL with hybrid batch+streaming pipeline; added real-time enrichment | Modernization effort; improve latency for real-time analytics | Data Engineer C | Passed QA + UAT | Yes (2023 data re-loaded to Snowflake for consistency) | New Snowflake-based pipeline; backward compatibility maintained; historical data available in both systems for transition period (90 days) |
| **3.1** | 2024-06-01 | Archived | Added real-time streaming mode (Kafka-based) in parallel with batch; incremental updates instead of daily full replacement; improved freshness from 24 hours to 2 hours | Performance requirement for lower-latency inference; cost optimization (incremental vs. full reload) | Data Engineer C | Passed QA; latency test (p95 < 1 min) | Partial (recent data re-processed; historical unchanged) | Streaming enables near-real-time model scoring; batch pipeline still available as fallback; dual-write for 30-day transition |
| **3.2** | 2025-01-05 | Current | Improved ETL efficiency: incremental updates, better partitioning strategy, faster join operations; added data quality SLA monitoring | Performance optimization; operational efficiency; data governance improvement | Data Engineer B | Passed QA; performance testing | Partial (optimized partitioning; historical data reorganized) | Reduced processing time 80%; improved data freshness SLA (now 2 hours vs. 24 hours); partitioned by customer_id + date for faster queries |

### 4.1 Version Lineage Diagram

```
v1.0 (2023-01-15) — Initial dataset created
  ↓
v2.0 (2023-06-01) — Added customer_segment field
  ↓
v2.1 (2023-08-15) — Fixed bugs; improved PII hashing
  ↓
v3.0 (2024-01-10) — Infrastructure migration (Oracle → Snowflake)
  ↓
v3.1 (2024-06-01) — Added real-time streaming
  ↓
v3.2 (2025-01-05) — Current version; performance optimization
```

---

## 5. Quality Gates & Checkpoints

*Instructions: Define where data quality is validated in the pipeline. Describe checkpoint validation logic and what happens if data fails.*

### 5.1 Quality Checkpoint Matrix

| Checkpoint | Location in Pipeline | Quality Dimension | Metric | Acceptable Threshold | Check Frequency | Failure Action |
|-----------|---------------------|------------------|--------|---------------------|-----------------|-----------------|
| **Input Freshness** | Post-Extraction (Step 1) | Timeliness | Data lag from source to warehouse | ≤ 2 hours | Every 6 hours | Alert; if > 4 hours, escalate to engineering |
| **Completeness** | Post-Extraction (Step 1) | Completeness | % of non-null values across all fields | ≥ 99% | Daily | Investigate null source; may proceed with waiver if < 99% |
| **Duplicate Detection** | Post-Cleaning (Step 2) | Uniqueness | No duplicate transaction_id | 0 duplicates | Daily | Quarantine duplicates; investigate source; prevent load |
| **Format Validation** | Post-Cleaning (Step 2) | Accuracy | All fields match expected format (regex, type, range) | 100% compliant | Daily | Quarantine invalid records; alert; manual review |
| **Referential Integrity** | Post-Enrichment (Step 3) | Consistency | Customer_id in transactions joins to customer_master | 99.5% join success | Daily | Alert; assess impact; document orphan count |
| **PII Compliance** | Post-Pseudonymization (Step 4) | Privacy | 0 plain-text PII; 100% hashed | 0 violations | Daily | Halt load; mandatory Privacy Officer review |
| **Schema Compliance** | Post-Schema-Validation (Step 5) | Consistency | Column types, NOT NULL constraints match target schema | 100% compliant | Daily | Halt load; resolve schema mismatch |
| **Business Rules** | Post-Rules-Validation (Step 6) | Accuracy | Transaction amounts > 0; dates valid; categories in approved list | < 0.1% violations | Daily | Quarantine violations; alert; remediate |
| **Aggregation Accuracy** | Post-Aggregation (Step 7, optional) | Accuracy | Sum of daily aggregates = sum of detail transactions | 100% match | Daily | Alert; investigate; recalculate |
| **Quality Score** | Pre-Load to Production (Step 8) | Overall Quality | Weighted quality score (completeness, accuracy, consistency, timeliness) | ≥ 95 / 100 | Daily | Prevent load; escalate to Data Steward for approval |

### 5.2 Quality Gate Sign-off Process

When a quality gate fails:
1. **Automatic Alert**: Alert sent to Data Engineering team via Slack + email
2. **Investigation**: Data engineer investigates root cause (data source issue, ETL bug, environmental problem)
3. **Decision**:
   - **Fix & Retry**: If fixable (e.g., retry extraction, fix bug), resolve and re-run pipeline
   - **Accept Risk**: If impact is small (e.g., < 0.05% records), may request waiver from Data Steward
   - **Escalate**: If critical (e.g., PII compliance, schema mismatch), escalate to Data Governance + Security
4. **Approval**: Data Steward or Data Governance Committee approves proceeding or requests remediation
5. **Documentation**: Gate failure, investigation, decision, and approval logged in pipeline audit trail

---

## 6. Annotations & Labels

*Instructions: If the dataset includes labels (e.g., for supervised learning), document the labeling methodology, annotators, quality, and inter-annotator agreement.*

### 6.1 Label Definition (if applicable)

**Labeling Target**: [e.g., "Customer will churn within 90 days (binary: Yes/No)"]

| Label | Definition | Value | Examples |
|-------|-----------|-------|----------|
| **Churn** | Customer account closed or inactivity for 90+ days after last transaction | 1 | Customer did not log in for 90+ days; account suspended for non-payment |
| **No Churn** | Customer active within last 90 days | 0 | Customer made purchase in last 90 days; logged in and browsed catalog |

### 6.2 Labeling Methodology

- **Labeling Source**: [e.g., "Automated rule-based labeling from account activity data"]
- **Labeling Process**: [e.g., "Each transaction record checked for account_last_activity_date; if > 90 days ago, labeled as churn = 1; else churn = 0"]
- **Manual Review**: [e.g., "100 random records per month sampled and manually verified by Customer Success team; accuracy > 99%"]

### 6.3 Labeling Quality Metrics (if manually annotated)

| Metric | Value | Method |
|--------|-------|--------|
| **Inter-Annotator Agreement (Cohen's Kappa)** | [e.g., 0.87] | Two annotators independently labeled 500 records; kappa calculated |
| **Label Completeness** | [e.g., 99.8%] | % of records with assigned label (vs. missing labels) |
| **Annotator Bias** | [e.g., None detected] | Compare label distributions across annotators; statistical test for bias |
| **Label Uncertainty** | [e.g., 2.1%] | % of records flagged as ambiguous or unclear by annotator |

### 6.4 Label Distribution

| Label | Count | Percentage | Imbalance Ratio | Notes |
|-------|-------|-----------|-----------------|-------|
| **Churn = 1** | [e.g., 127,500] | [e.g., 2.55%] | [e.g., 1:38.2 (imbalanced)] | Class imbalance handled in training via weighted loss function; oversampling/undersampling considered |
| **Churn = 0** | [e.g., 4,872,500] | [e.g., 97.45%] | | Majority class represents no-churn customers |

---

## 7. Known Limitations & Caveats

*Instructions: Document data quality issues, biases, representativeness limitations, and temporal constraints. This enables informed use of the data.*

### 7.1 Data Quality Issues

| Issue | Severity | Description | Impact | Mitigation | Status |
|-------|----------|-------------|--------|-----------|--------|
| **Historic Data Accuracy (Pre-2017)** | Medium | Pre-2017 ERP data quality is lower; known data entry errors, system migration artifacts | Models using pre-2017 data may have reduced accuracy; avoid using solely for recent performance assessment | Document data quality concerns per version; recommend validation before using pre-2017 data for decision-making | Ongoing; cannot be retroactively fixed |
| **Missing Geographic Data (International)** | Medium | Dataset includes US transactions only; international operations in separate dataset (DS-006) | Models trained on US data only; predictions may not apply to international customers | Document geographic scope clearly; consider separate model for international data | Permanent limitation; requires separate dataset |
| **PII Pseudonymization is Irreversible** | Low | Customer names/emails hashed (one-way); cannot reverse to contact customer directly | Cannot link churn predictions back to individual customer names for outreach (but can use numeric customer_id) | Use customer_id for personalized outreach; join with customer master separately | By design (GDPR requirement) |
| **Currency Conversion Lag (v2.0-v2.1)** | Medium | In v2.0, exchange rates were 1 day stale (historical issue, fixed in v2.1) | ~1.2% of 2023 transactions had currency inaccuracy; financial reporting affected | All production use is v3.2+; historical analysis should use v2.1+ | Fixed in v2.1 (2023-08-15) |
| **Business Rules Changes** | Low | Product categories added (2024-06-15); old data may not include new categories | Historical data cannot be broken down by newly-added categories | Document rule changes per version; be aware when comparing across versions | Ongoing; accept as normal business evolution |

### 7.2 Representativeness & Bias

| Bias Type | Description | Evidence | Impact | Mitigation | Status |
|-----------|-------------|----------|--------|-----------|--------|
| **Geographic Bias** | Dataset US-only; no international transactions | [See Data Governance Documentation Section 4.1] | Models trained on US customer behavior; may not generalize internationally | Document geographic scope; consider separate models per region | Permanent limitation; mitigated by separate dataset DS-006 |
| **Age Bias** | Customers 60+ underrepresented by 50% vs. census | [See Data Governance Documentation Section 4.1] | Models may underpredict behavior for senior customers | Fairness metrics monitored; oversampling applied in training | Mitigation in place; ongoing monitoring |
| **Income Bias** | Low-income customers underrepresented | [See Data Governance Documentation Section 4.1] | Models may have lower accuracy for low-income segment | Weighted loss function; fairness constraints | Mitigation in place; monitored |
| **Survivorship Bias** | Churned customers removed from dataset after account closure | Churn label is historical; recent churners not yet reflected | Churn models may have lag; may not capture customers who recently churned | Acknowledge lag; consider real-time monitoring complementary | Inherent limitation of labeled dataset approach |

### 7.3 Temporal Limitations

| Limitation | Description | Impact | Mitigation |
|-----------|-----------|--------|-----------|
| **Data Recency** | Dataset refreshed daily; up to 24 hours of lag (in v3.1) or 2 hours (in v3.2) | Real-time decisions may use 2-hour-old data | Acceptable for batch scoring; streaming model used for real-time if needed |
| **Historical Data Coverage** | Data available from 2015 onwards; earlier data not available | Cannot analyze trends before 2015 | Document coverage; use available history; acknowledge limitations for long-term trend analysis |
| **Seasonal Patterns** | Dataset includes 10 years of history; seasonal patterns well-represented | Models can capture seasonality | Leverage multi-year history for seasonal decomposition |
| **COVID-19 Impact** | 2020-2021 data contains COVID disruption; not representative of "normal" commerce | Anomalous period in data; may skew trends | Consider excluding or separately analyzing 2020-2021; document anomaly |

### 7.4 Regulatory & Compliance Limitations

| Limitation | Description | Implication | Handling |
|-----------|-----------|-----------|----------|
| **GDPR Right to Erasure** | Customer can request deletion; historical customer data may be deleted mid-stream | Incomplete historical dataset if customer requests deletion | Document deletion; update lineage; may introduce gaps in time-series analysis |
| **Data Retention Policy** | 7-year retention for operational use; older data archived (cold storage) | Queries over 7 years require archive restoration (slower) | Acknowledge latency for historical queries; plan for archival access |

---

## 8. Reproducibility & Recoverability

*Instructions: Document how the dataset can be recreated from source, and how previous versions can be recovered if needed.*

### 8.1 Reproducibility Information

**To Recreate This Dataset from Source**:

1. **Access Requirements**:
   - Access to source systems: [Oracle ERP credentials; Snowflake read access]
   - Git repository access: [/data-engineering/etl-scripts]
   - Required software: [Python 3.9+, Snowflake connector, Pandas, cryptography library]

2. **Step-by-Step Reproduction**:
   - Clone repository: `git clone https://repo.company.com/etl-scripts.git`
   - Checkout version tag: `git checkout ds-001-v3.2`
   - Execute extraction script: `./extract-transactions.sh [date-range]`
   - Execute transformation pipeline: `python data_cleaning.py && dbt run --models transactions`
   - Execute quality checks: `python data-quality-scoring.py`
   - Load to warehouse: `snowsql -c prod -f customer-enrichment.sql`
   - Reproducibility check: Compare row counts and hash samples to expected values

3. **Expected Output**:
   - Raw transaction file (500K+ rows/day depending on date range)
   - Cleaned transaction table with 0 duplicates, < 0.2% nulls
   - Enriched with customer master (99.5%+ join success)
   - PII pseudonymized (100% hashed)
   - Final table in Snowflake: `PROD.TRANSACTIONS.CUSTOMER_TRANSACTIONS_DAILY`

### 8.2 Version Recovery

**To Access Previous Versions**:

- **Version 3.0-3.2**: Available in Snowflake cold storage (S3 Glacier)
  - Access: Request from Data Steward; 24-hour restoration time
  - Cost: ~$50 per restore + storage costs

- **Version 2.x-3.0**: Available in Data Warehouse Archive (legacy Oracle)
  - Access: DBA restore; 48-hour turnaround
  - Cost: ~$200 per restore + DBA labor

- **Version 1.0**: Original archive available; requires manual retrieval
  - Access: Contact Data Governance; > 2-week turnaround
  - Cost: Archive restoration labor

### 8.3 Disaster Recovery

**Backup & Recovery SLA**:
- **Backup Frequency**: Daily (incremental); full backup weekly
- **Backup Location**: AWS S3 (primary) + on-premises archive (secondary)
- **Recovery Time Objective (RTO)**: < 4 hours for full dataset recovery
- **Recovery Point Objective (RPO)**: < 24 hours (maximum data loss = 1 day)

**Recovery Procedure**:
1. Detect data loss / corruption incident
2. Notify Data Engineering Lead and Data Steward
3. Identify latest clean backup (via hash verification)
4. Restore from backup to staging environment
5. Validate restored data (row counts, key metrics)
6. Cutover to restored version (contingent on approvals)
7. Update version history with recovery incident
8. Post-incident review within 7 days

---

## 9. Related Datasets & Dependencies

*Instructions: Document relationships between this dataset and other datasets. Useful for impact analysis (e.g., "if customer master changes, what datasets are affected?").*

### 9.1 Upstream Dependencies

| Upstream Dataset | Relationship | Criticality | Impact if Unavailable | Monitoring |
|-----------------|-------------|------------|----------------------|-----------|
| **Customer Master DB** | Joined with this dataset in Step 3 (Enrichment) to add segment, geography | High | If customer master unavailable, enrichment fails; pipeline halts | Daily join health check; alert if < 99.5% join success |
| **Product Catalog (DS-002)** | Used to validate product_category values in Step 6 (Business Rules) | Medium | If invalid categories appear, business rules gate may fail; quarantine records | Weekly catalog update check; alert if new categories not in rules |
| **ERP Transaction Source (Oracle) | Primary data source (Step 1 - Extraction) | Critical | If ERP unavailable, extraction fails; no new data | ERP availability monitoring; SLA is 99.9% uptime |

### 9.2 Downstream Dependencies

| Downstream Dataset / System | Relationship | Criticality | Impact if This Dataset Changes |
|----------------------------|-------------|-----------|-------------------------------|
| **Customer Lifetime Value Model (v2.0)** | Uses transactions data for feature engineering (recency, frequency, monetary) | Critical | Model retraining required if dataset structure changes significantly; model bias may shift if data distribution changes |
| **Churn Prediction Model (v3.1)** | Uses transaction history to predict churn; fairness metrics depend on demographic balance | Critical | If demographic bias introduced, fairness metrics degrade; model predictions may become unfair |
| **Revenue Forecasting (Finance)** | Aggregate transaction data feeds into monthly revenue projection | High | If data quality degrades, revenue forecasts become inaccurate |
| **Executive Dashboard** | Daily transaction volumes displayed for executive visibility | Medium | If daily aggregation breaks, dashboard metrics unavailable |

### 9.3 Cross-Dataset Impact Matrix

[Use this to assess blast radius of data quality issues]

| Event | This Dataset Impact | Downstream Impact | Estimated Severity |
|-------|-------------------|------------------|-------------------|
| **Customer Master update (new field added)** | Schema change; may affect join logic | Models may retrain; fairness metrics may shift | Medium |
| **Product Catalog adds new category** | Business rules gate must be updated | Revenue forecasting may show new category | Low (manageable) |
| **ERP system outage (24 hours)** | 1 day of data missing | Fairness monitoring may skip a day; models see data gap | Medium (alerts + manual intervention) |
| **PII re-hashing (algorithm change)** | Hashes change; customer_id still links correctly | No downstream impact (hashes not used in models) | Low |

---

## 10. Data Access & Distribution

*Instructions: Document who can access this dataset, for what purposes, and under what conditions.*

### 10.1 Access Permissions

| Role | Access Level | Purpose | Conditions | Approval Authority |
|------|-------------|---------|-----------|------------------|
| **Data Engineer** | Full (read/write) | Pipeline maintenance; debugging; optimization | Must operate within established ETL framework; no ad-hoc modifications | Data Engineering Manager |
| **Data Scientist** | Read (analytical) | Model training; feature engineering | Cannot export raw data; must use pre-approved subsets; analysis logged | Data Science Lead |
| **Analytics Team** | Read (aggregated) | Dashboards; reporting | Only aggregated/summarized data; no individual customer records | Analytics Manager |
| **Compliance Officer** | Read (audit) | Compliance verification; audits | For compliance purposes only; audit trail maintained | Chief Compliance Officer |
| **External Partners** | [Case-by-case] | [Specify per partner agreement] | [Partner data use agreement required] | Chief Data Officer |

### 10.2 Data Distribution

- **Internal Use**: Shared within organization via Snowflake; access controlled via RBAC
- **External Use**: Only via formal data sharing agreement; data subset may be anonymized
- **Regulatory Disclosure**: Available for regulatory audits (e.g., tax, GDPR DSAR); subset disclosed per request

---

## 11. Governance & Ownership

*Instructions: Define who is responsible for this dataset's management, quality, and evolution.*

| Role | Name | Title | Contact | Responsibilities |
|------|------|-------|---------|-----------------|
| **Data Owner** | [Name] | [Title, e.g., Finance Director] | [Email] | Business ownership; use case definition; retention policy approval; access approval |
| **Data Steward** | [Name] | [Title, e.g., Data Steward - Finance] | [Email] | Day-to-day management; quality monitoring; issue resolution; documentation maintenance |
| **Data Engineering Owner** | [Name] | [Title, e.g., Data Engineering Manager] | [Email] | Pipeline maintenance; technical quality; SLA compliance; tooling/infrastructure |
| **Data Governance Officer** | [Name] | [Title, e.g., Chief Data Officer] | [Email] | Governance oversight; policy compliance; strategic decisions; escalation authority |

---

## 12. Revision History

| Version | Date | Changes Made | Changed By | Reason | Approval Status |
|---------|------|--------------|-----------|--------|-----------------|
| 1.0 | [Date] | Initial lineage record creation | [Data Steward] | Dataset documentation for governance framework | [Pending] |
| [Version] | [Date] | [Changes] | [Author] | [Reason] | [Status] |

---

## 13. Approvals

This Data Lineage Record documents the complete provenance, transformations, and governance of [Dataset Name]. Approval by all parties below indicates agreement with the documentation and confirmation that the dataset is properly managed and fit for its intended uses.

| Role | Name | Signature | Date | Notes |
|------|------|-----------|------|-------|
| Data Owner | [Name] | ________________ | ____/____/____ | Confirms business ownership and use cases |
| Data Steward | [Name] | ________________ | ____/____/____ | Confirms quality and governance status |
| Chief Data Officer | [Name] | ________________ | ____/____/____ | Confirms compliance with data governance policies |
| Privacy Officer (if PII present) | [Name] | ________________ | ____/____/____ | Confirms PII handling and GDPR compliance |

---

**Document Classification**: [Internal / Confidential]

**Next Review Date**: [e.g., Quarterly or upon dataset version change]

**Storage Location**: [e.g., Git repo: `/data-governance/lineage-records/`; Wiki: `Data Lineage Registry`]

**Related Documents**:
- Data Governance Documentation (data-governance-documentation.md)
- Telemetry Configuration (telemetry-configuration.md)
- Automated Evidence Package (automated-evidence-package.md)

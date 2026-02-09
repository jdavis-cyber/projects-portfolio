# Bias Assessment Report

## Metadata Header

| Field | Value |
|-------|-------|
| Document ID | BA-[PROJECT_ID]-[YYYY-MM-DD] |
| Version | [X.Y] |
| Date Created | [YYYY-MM-DD] |
| Last Updated | [YYYY-MM-DD] |
| Assessor | [Name/Agent ID] |
| Assessment Date | [YYYY-MM-DD] |
| Approver | [Authorized Role] |
| Status | [Draft/Under Review/Approved/Active] |
| Phase | Phase IV — Model Development |
| Classification | [Internal/Confidential/Restricted] |
| Applicable Standards | NIST SP 1270, NIST AI RMF MEASURE-2.6, ISO 42001 A.10 |
| Scope | [System/model name, scope of assessment] |
| Review Frequency | [Before deployment, annually] |
| Next Assessment Date | [YYYY-MM-DD] |

---

## 1. Assessment Overview

*[Instructions: Provide context for the bias assessment including the system being evaluated, scope, methodology, and key definitions of fairness and bias for this specific system.]*

### 1.1 System Identification
**System/Model Name:** [Enter system name]

**System Description:** [Brief description of what the system does, its purpose, and primary users]

**Model Type:** [Classification / Regression / Ranking / NLP / Computer Vision / Other]

**Use Case:** [Primary use case and decision context—e.g., "Hiring recommendation system", "Credit risk assessment", "Medical diagnosis support"]

**Sensitive Use Case:** [Yes/No - Does system make consequential decisions affecting individuals?]

### 1.2 Assessment Scope

**Scope In:**
- [Model training process]
- [Model performance evaluation]
- [Inference/deployment phase]
- [Protected attributes: Age, Gender, Race, Ethnicity, Religion, National Origin, etc.]
- [Geographic coverage]
- [User populations covered]

**Scope Out:**
- [Components not assessed]
- [Protected attributes not covered]
- [Limitations]

### 1.3 Assessment Date & Assessor
**Assessment Conducted:** [YYYY-MM-DD]

**Assessor Name:** [Name of person/agent conducting assessment]

**Assessor Qualifications:** [Relevant experience, certifications, expertise in AI fairness]

**Reviewed By:** [Name of secondary reviewer, if applicable]

### 1.4 Assessment Methodology

**Framework Used:** [NIST AI RMF / AIARC Framework / Fairness toolkit reference / Custom]

**Tools Used:** [fairlearn, AI Fairness 360, InterpretML, Custom tools]

**Data Sources:**
- Training data: [Source, version date]
- Test data: [Source, version date]
- Validation data: [Source, version date]
- Production data (if available): [Source, date range]

**Assessment Timeline:** [From date to date, X hours spent]

### 1.5 Key Definitions

**Bias:** [For this system] Systematic error or prejudice that advantages or disadvantages certain individuals or groups

**Fairness:** [For this system] The system should treat individuals and groups equitably, with decisions made primarily on relevant, valid factors rather than protected attributes

**Protected Attributes:** [List of attributes considered protected in jurisdiction and business context]
- [Attribute 1: Definition]
- [Attribute 2: Definition]

**Algorithmic Bias:** Systematic error in the model's decision-making logic that disproportionately affects groups

**Representativeness:** The degree to which protected groups are represented in training data relative to their prevalence in target population

---

## 2. Data Bias Evaluation

*[Instructions: Analyze biases in training and test data, including representation of protected groups, historical bias, measurement bias, and sampling bias.]*

### 2.1 Protected Attributes Analysis

*[Instructions: Identify protected attributes in the dataset and analyze their representation.]*

#### 2.1.1 Protected Attributes Inventory

| Attribute | Data Type | Source | Availability in Dataset | Completeness | Sensitivity |
|-----------|-----------|--------|------------------------|--------------|-------------|
| [Attribute 1: e.g., Gender] | [Categorical/Ordinal] | [How coded] | [% of records] | [Missing %] | [High/Medium/Low] |
| [Attribute 2: e.g., Race] | [Categorical] | [How coded] | [% of records] | [Missing %] | [High/Medium/Low] |
| [Attribute 3: e.g., Age] | [Continuous/Binned] | [How coded] | [% of records] | [Missing %] | [High/Medium/Low] |

#### 2.1.2 Data Representation Analysis

| Protected Attribute | Group | Training Data Representation | General Population Representation | Gap | Oversampled/Undersampled | Notes |
|-------------------|-------|------------------------------|----------------------------------|-----|--------------------------|-------|
| [Attribute] | [Group 1] | [%] | [%] | [+/- %] | [Yes/No] | [Analysis] |
| [Attribute] | [Group 2] | [%] | [%] | [+/- %] | [Yes/No] | [Analysis] |
| [Attribute] | [Group 3] | [%] | [%] | [+/- %] | [Yes/No] | [Analysis] |

#### 2.1.3 Representation Gap Analysis

**Finding 1: [Attribute name]**
- **Representation Gap:** [Group X is underrepresented by X% in training data]
- **Population Baseline:** [In general population, group comprises X%]
- **Potential Impact:** [Underrepresentation may lead to worse model performance for this group]
- **Root Cause:** [Why is this group underrepresented?]
  - [Data collection bias]
  - [Historical exclusion]
  - [Data availability limitations]
  - [Self-selection bias]
- **Recommendation:** [Increase representation, stratified sampling, synthetic data, etc.]

### 2.2 Historical Bias Analysis

*[Instructions: Analyze whether training data encodes historical societal biases or discrimination.]*

#### 2.2.1 Historical Bias in Source Data

**Bias 1: [Description]**
- **Source:** [What in the data reveals this bias]
- **Example:** [Specific example from data showing the bias]
- **Known Historical Context:** [Is this a known historical bias in the domain?]
- **Manifestation in Data:**
  - [Manifestation 1]
  - [Manifestation 2]
- **Impact on Model:** [How will model learn this bias?]

**Bias 2: [Societal/Historical bias]**
[Similar analysis]

#### 2.2.2 Historical Bias Timeline

[If applicable, document how bias has evolved over time in source data]

### 2.3 Measurement Bias Analysis

*[Instructions: Analyze how the process of collecting, measuring, or labeling data might introduce bias.]*

#### 2.3.1 Data Collection Method Biases

**Collection Bias 1: [Description]**
- **Collection Method:** [How data was collected—e.g., voluntary survey, administrative records, user-generated content]
- **Bias Mechanism:** [How this method could bias data]
  - [Mechanism 1: e.g., "Voluntary participation leads to non-response bias"]
  - [Mechanism 2: e.g., "Users of certain groups less likely to participate"]
- **Groups Affected:** [Which groups are more affected by this bias?]
- **Mitigation in Current Data:** [Has this been addressed? How?]
- **Residual Bias:** [How much bias remains?]

#### 2.3.2 Labeling/Annotation Biases

**Annotation Bias 1: [Description]**
- **Labeling Process:** [Who labeled data, instructions given, criteria used]
- **Annotator Characteristics:** [Demographic info about annotators, if relevant]
- **Potential Annotator Bias:** [How annotators might introduce bias]
  - [Pattern 1: Annotators of certain demographics label certain groups differently]
  - [Pattern 2: Instructions contain subjective criteria vulnerable to bias]
  - [Pattern 3: Annotators have implicit biases affecting labels]
- **Evidence:** [Is there evidence of this in the data?]
- **Impact:** [How does this affect model training?]
- **Mitigation:** [Are there safeguards? Inter-annotator agreement checks?]

#### 2.3.3 Feature Measurement Biases

**Feature 1: [Feature name]**
- **How Measured:** [Method for collecting/computing this feature]
- **Bias Risk:** [Is measurement biased toward certain groups?]
  - [Risk 1]
  - [Risk 2]
- **Evidence of Bias:** [Examples or data showing bias in measurement]
- **Mitigation:** [Current safeguards]

### 2.4 Sampling Bias Analysis

*[Instructions: Analyze whether the training data represents the target population and deployment context.]*

#### 2.4.1 Sampling Methodology

**Sampling Method:** [Random / Stratified / Convenience / Administrative records / Other]

**Target Population:** [The population the model should serve]

**Training Sample:** [The population actually represented in training data]

**Representativeness:** [How well does training sample match target population?]

#### 2.4.2 Sampling Disparities by Protected Attribute

| Protected Attribute | Target Population % | Training Sample % | Disparity | Impact Assessment |
|-------------------|-------------------|------------------|-----------|------------------|
| [Attribute] | [%] | [%] | [Absolute difference] | [Potential impact on model performance] |

#### 2.4.3 Sampling Bias Analysis

**Sampling Bias 1: Underrepresentation**
- **Affected Group:** [Group name]
- **Degree of Underrepresentation:** [Group is X% in population but only Y% in training]
- **Root Cause:** [Why this group underrepresented in sample?]
  - [Data source limitation]
  - [Access/inclusion criteria]
  - [Historical exclusion]
- **Expected Model Impact:** [Model likely to perform worse for this group]
- **Mitigation Strategy:** [Reweighting, resampling, synthetic data generation, etc.]

**Sampling Bias 2: [Other sampling issue]**
[Similar analysis]

#### 2.4.4 Deployment vs. Training Distribution Mismatch

**Finding:** [If model will be used in deployment context different from training]
- **Training Distribution:** [Demographic characteristics of training data]
- **Expected Deployment Distribution:** [Expected demographics of users/subjects]
- **Mismatch:** [Where they differ]
- **Risk:** [Performance may degrade for underrepresented groups in deployment context]

---

## 3. Algorithmic Bias Evaluation

*[Instructions: Analyze biases in the model itself—how the algorithm makes different decisions for different groups regardless of data bias.]*

### 3.1 Fairness Metrics Selection

*[Instructions: Define the fairness metrics that are appropriate for this system and use case. Include justification for why these metrics were chosen.]*

#### 3.1.1 Fairness Metrics Framework

**Fairness Definitions Used:** [Which fairness principles apply to this system]
- [Fairness Definition 1: e.g., "Demographic Parity"]
- [Fairness Definition 2: e.g., "Equalized Odds"]
- [Fairness Definition 3: e.g., "Calibration"]

**Justification:** [Why these metrics chosen for this use case?]
[Explain the business and ethical rationale for selected fairness metrics]

#### 3.1.2 Fairness Metric Definitions

| Metric Name | Definition | Ideal Value | Acceptable Threshold | Interpretation |
|-----------|-----------|-----------|-------------------|-----------------|
| Demographic Parity | Positive prediction rate should be equal across groups | 1.0 (equal rates) | [0.X-1.Y] | If below threshold, model makes more positive predictions for one group |
| Equalized Odds | False Positive Rate and True Positive Rate equal across groups | 1.0 | [0.X-1.Y] | If below threshold, error rates differ by group |
| Predictive Parity | Positive Predictive Value (precision) equal across groups | 1.0 | [0.X-1.Y] | If below threshold, accuracy of positive predictions differs |
| Calibration | Predicted probability matches actual outcome rate across groups | 1.0 | [0.X-1.Y] | If below threshold, predictions systematically over/under-confident for some groups |
| Individual Fairness | Similar individuals are treated similarly | 1.0 | [0.X-1.Y] | Harder to measure; requires defining "similar" |

**Why These Metrics:**
[For each metric selected, explain why it's relevant to the use case]

#### 3.1.3 Metric Selection Trade-offs

**Trade-off Analysis:**
[Note: different fairness metrics can be in tension. Selecting one may prevent achieving another.]

- **Metric 1 vs. Metric 2:** [These metrics can conflict because...]
  - [Choosing to optimize for Metric 1 may harm Metric 2]
  - [Recommended balance: Metric 1 preferred because...]

- **Fairness vs. Accuracy:** [Does requiring fairness constraints reduce overall model accuracy?]
  - [Estimated accuracy loss: X% for Y fairness gain]
  - [Acceptable trade-off: Yes/No, because...]

### 3.2 Fairness Metric Results

*[Instructions: Report measured fairness metrics broken down by protected attributes and groups.]*

#### 3.2.1 Fairness Metric Measurements

| Metric | Overall | Group A | Group B | Group C | Gap (Max - Min) | Pass/Fail | Threshold |
|--------|---------|---------|---------|---------|-----------------|-----------|-----------|
| Demographic Parity | [Value] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] | [0.X-1.Y] |
| Equalized Odds (FPR) | [Value] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] | [0.X-1.Y] |
| Equalized Odds (TPR) | [Value] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] | [0.X-1.Y] |
| Predictive Parity | [Value] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] | [0.X-1.Y] |
| Calibration | [Value] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] | [0.X-1.Y] |

#### 3.2.2 Metric Results Analysis

**Demographic Parity Results:**
- **Overall Positive Prediction Rate:** [X%]
- **By Group:**
  - [Group A: X% positive predictions]
  - [Group B: Y% positive predictions]
  - [Group C: Z% positive predictions]
- **Disparity Ratio:** [Lowest rate / Highest rate = X ratio]
  - [Ratio interpretation: If <0.8, suggests potential disparate impact]
- **Pass Criteria:** [Model passes / fails demographic parity]
- **Assessment:** [Is the disparity acceptable for this use case?]

**Equalized Odds Results:**
- **False Positive Rate (Type I Error):**
  - [Group A: X%]
  - [Group B: Y%]
  - [Group C: Z%]
  - [Disparity: Maximum difference between groups]
- **True Positive Rate (Sensitivity/Recall):**
  - [Group A: X%]
  - [Group B: Y%]
  - [Group C: Z%]
  - [Disparity: Maximum difference between groups]
- **Assessment:** [Which group has higher error rates? Is this acceptable?]

**Predictive Parity (Precision) Results:**
- **By Group:**
  - [Group A: X% precision]
  - [Group B: Y% precision]
  - [Group C: Z% precision]
- **Interpretation:** [For positive predictions, accuracy differs by X% across groups]
- **Risk:** [If precision lower for Group X, more false positives for that group]

**Calibration Results:**
- **Calibration Curves:** [Predicted probability vs. actual outcome rate by group]
- **Assessment:**
  - [Group A: Well-calibrated / Under-confident / Over-confident]
  - [Group B: Well-calibrated / Under-confident / Over-confident]
  - [Group C: Well-calibrated / Under-confident / Over-confident]

### 3.3 Intersectional Bias Analysis

*[Instructions: Analyze bias across combinations of protected attributes (intersectionality). Individuals may face compounded discrimination at the intersection of multiple attributes.]*

#### 3.3.1 Intersectional Groups Analyzed

[Provide performance metrics broken down by combinations of protected attributes]

| Group | Size | Demographic Parity | Equalized Odds (TPR) | Equalized Odds (FPR) | Predictive Parity | Assessment |
|-------|------|-------------------|-------------------|-------------------|------------------|-----------|
| [Attribute 1 = A, Attribute 2 = X] | [N] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] |
| [Attribute 1 = A, Attribute 2 = Y] | [N] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] |
| [Attribute 1 = B, Attribute 2 = X] | [N] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] |
| [Attribute 1 = B, Attribute 2 = Y] | [N] | [Value] | [Value] | [Value] | [Value] | [Pass/Fail] |

#### 3.3.2 Intersectional Findings

**Finding 1: [Intersection description]**
- **Groups Affected:** [E.g., Women of color, younger individuals in region X]
- **Performance Disparity:** [Model performs X% worse for this intersection]
- **Potential Cause:** [Underrepresentation / Feature bias / Interaction effects]
- **Severity:** [Low/Medium/High]
- **Mitigation:** [Specific action to address this intersection]

### 3.4 Performance Disparity Analysis

*[Instructions: Analyze model performance (accuracy, precision, recall, F1) broken down by protected groups. Where performance differs, investigate why.]*

#### 3.4.1 Performance by Protected Group

| Group | Count | Accuracy | Precision | Recall | F1 Score | Performance Gap |
|-------|-------|----------|-----------|--------|----------|-----------------|
| [Group A] | [N] | [%] | [%] | [%] | [Value] | [Compared to baseline] |
| [Group B] | [N] | [%] | [%] | [%] | [Value] | [Compared to baseline] |
| [Group C] | [N] | [%] | [%] | [%] | [Value] | [Compared to baseline] |
| Overall | [N] | [%] | [%] | [%] | [Value] | [Baseline] |

#### 3.4.2 Performance Disparity Analysis

**Group [A] Performance Analysis:**
- **Overall Accuracy:** [X%] (vs. overall [Y%])
- **Recall:** [X%] - Model captures [X%] of positive cases in this group
- **Precision:** [X%] - [X%] of positive predictions are correct for this group
- **Performance Gap:** [X percentage points below average]
- **Impact:** [Model less effective for this group—consequences?]
- **Root Causes:** [Why does model perform worse for this group?]
  - [Cause 1: Underrepresentation in training data]
  - [Cause 2: Feature imbalance—features predictive for other groups less predictive for this group]
  - [Cause 3: Label noise disproportionately affects this group]

**Group [B] Performance Analysis:**
[Similar structure]

#### 3.4.3 Performance Disparity - Root Cause Analysis

**Analysis Method:** [Feature importance analysis, SHAP values, model behavior investigation]

**Finding 1: Feature Importance Differs by Group**
- **Group A:** Top 3 important features are [Feature 1, Feature 2, Feature 3]
- **Group B:** Top 3 important features are [Feature A, Feature B, Feature C]
- **Implication:** Model relies on different reasoning for different groups
- **Risk:** Model may be making decisions based on proxy variables for protected attributes

**Finding 2: Prediction Confidence Differs by Group**
- **Group A:** Average prediction confidence [X%]
- **Group B:** Average prediction confidence [Y%]
- **Implication:** Model less confident for one group
- **Risk:** Less confident predictions may be less reliable

---

## 4. Human Bias Evaluation

*[Instructions: Analyze biases introduced through human decision-making and interaction with the AI system.]*

### 4.1 Automation Bias Risk

*[Instructions: Assess likelihood that users will over-rely on AI outputs without critical evaluation.]*

#### 4.1.1 Automation Bias Mechanisms

**Mechanism 1: Over-Reliance on Model Predictions**
- **Risk:** Users accept model predictions without adequate human review
- **System Design Factors Contributing to Risk:**
  - [Factor 1: Model accuracy is high (users perceive as reliable)]
  - [Factor 2: Model presented as authoritative]
  - [Factor 3: Users under time/cognitive pressure]
  - [Factor 4: Alternative information sources unavailable]
- **Evidence of Over-Reliance:** [Any observed cases or surveys?]
- **Mitigation Design Features:**
  - [Uncertainty quantification—model communicates uncertainty]
  - [Mandatory human review workflow]
  - [Explanation of model reasoning provided to user]
  - [Confidence scores visible to user]

**Mechanism 2: Failure to Catch Model Errors**
- **Risk:** Users miss cases where model makes systematic errors
- **Contributing Factors:**
  - [Factor 1: No feedback loop showing model mistakes]
  - [Factor 2: Errors concentrated in underrepresented groups, less visible]
  - [Factor 3: Users not trained on model limitations]
- **Mitigation:**
  - [User training on model limitations]
  - [Dashboard showing model performance by group]
  - [Incident reporting for model errors]

#### 4.1.2 Automation Bias Mitigation Design

**User Interface Design:**
- [UI Element 1: Confidence scores displayed prominently]
- [UI Element 2: Uncertainty ranges provided]
- [UI Element 3: Model explanation provided]
- [UI Element 4: Alternative data points presented for user consideration]

**Workflow Design:**
- [Workflow Element 1: Mandatory human review for consequential decisions]
- [Workflow Element 2: Easy override mechanism for users]
- [Workflow Element 3: Escalation path if user disagrees with model]

**Training & Communication:**
- [Training 1: Users trained on model limitations]
- [Training 2: Documentation of error patterns provided]
- [Training 3: Regular briefings on model performance]

### 4.2 Confirmation Bias Risk

*[Instructions: Assess risk that system design reinforces existing user biases.]*

#### 4.2.1 Confirmation Bias Mechanisms

**Mechanism 1: Interface Presents Information Supporting User's Views**
- **Risk:** System design emphasizes information confirming user's existing beliefs
- **Examples:**
  - [Example 1: Highlighting model agreement with user's intuition]
  - [Example 2: Deemphasizing model explanations that contradict user expectation]
  - [Example 3: Filtering or ordering information in biased way]
- **Mitigation Design Features:**
  - [Feature 1: Balanced presentation of supporting and contradicting evidence]
  - [Feature 2: Explicit flagging of surprising or counter-intuitive findings]
  - [Feature 3: Facilitation of critical examination of model outputs]

**Mechanism 2: Model Inherits User Biases Through Feedback Loop**
- **Risk:** If users provide biased feedback on model predictions, model learns their biases
- **Example:** [Users from majority group accept model's predictions; minority group questions them, leading to more labeling data from majority group]
- **Mitigation:**
  - [Monitor feedback patterns for bias]
  - [Weight feedback to balance group representation]
  - [Separate feedback mechanism for each group]

### 4.3 Design Choices Affecting Bias

*[Instructions: Document design decisions made for the system and their potential bias implications.]*

#### 4.3.1 Interface Design Choices

**Design Choice 1: [Design decision]**
- **Decision:** [What was decided]
- **Rationale:** [Why this choice made]
- **Potential Bias Impact:** [How could this introduce or amplify bias?]
  - [Impact 1]
  - [Impact 2]
- **Mitigation:** [How is the bias risk addressed?]

**Design Choice 2: Output Presentation**
- **Decision:** [How model outputs are presented to users—e.g., scores, rankings, explanations]
- **Potential Bias Impact:**
  - [Ranking presentation may emphasize gender representation in top results]
  - [Score visualization may suggest unwarranted precision]
  - [Explanations may be less clear for underrepresented groups]
- **Mitigation:** [How addressed?]

#### 4.3.2 Feature Engineering Decisions

**Feature 1: [Feature name]**
- **Definition:** [How feature is calculated]
- **Bias Consideration:** [Could this feature encode bias or be proxy for protected attribute?]
- **Evidence:** [Correlation with protected attributes?]
- **Mitigation:** [How is bias risk managed?]

#### 4.3.3 Model Selection Decisions

**Model Choice: [Type of model used]**
- **Why This Model:** [Rationale for choice]
- **Bias Considerations:**
  - [Interpretability—can model behavior be explained to users?]
  - [Flexibility—can fairness constraints be applied?]
  - [Training stability—is model sensitive to data composition?]
- **Trade-offs Accepted:** [What fairness/accuracy trade-offs were accepted in choosing this model?]

---

## 5. Bias Mitigation Measures

*[Instructions: Document actions taken or planned to mitigate identified biases. Track implementation status and effectiveness.]*

### 5.1 Data-Level Mitigations

*[Instructions: Document modifications to training data to reduce bias.]*

#### 5.1.1 Data Rebalancing

**Mitigation: Resampling/Reweighting**
- **Bias Type Addressed:** [Underrepresentation of Group X]
- **Approach:** [Oversample underrepresented groups / Undersample overrepresented groups / Reweight samples in training]
- **Implementation Details:**
  - [Resampling method: Oversample with replacement / SMOTE / Other]
  - [Reweighting formula: Sample weight = 1 / (group proportion)]
  - [Target distribution: Equal representation / Proportional to population / Custom]
- **Implementation Status:** [Implemented / Planned / Not applicable]
- **Effectiveness Assessment:**
  - [Before mitigation: Demographic parity gap = X%]
  - [After mitigation: Demographic parity gap = Y%]
  - [Improvement: X-Y percentage points]
  - [Trade-offs: Accuracy loss = [X%], Increased variance = [X], etc.]
- **Residual Bias:** [Remaining disparity after mitigation]

**Mitigation: Stratified Sampling**
- **Description:** Ensure training sample has proportional representation of protected groups
- **Implementation Status:** [Implemented / Planned]
- **Effectiveness:** [Assessment]

#### 5.1.2 Data Augmentation

**Mitigation: Synthetic Data Generation**
- **Bias Type Addressed:** [Underrepresentation of Group X]
- **Approach:** [Generate synthetic examples for underrepresented group]
- **Method:** [GAN / Oversampling with perturbation / Domain-knowledge-based generation / Other]
- **Validation:** [Are synthetic examples realistic? Do they improve model performance for target group?]
- **Implementation Status:** [Implemented / Planned]
- **Risks:** [Synthetic data may not capture true group characteristics, creating additional bias]

#### 5.1.3 Data Cleaning & Feature Engineering

**Mitigation: Label Noise Correction**
- **Issue:** [Labels biased for certain groups]
- **Approach:** [Manual review and correction of potentially mislabeled instances]
- **Scope:** [Focus on underrepresented groups]
- **Implementation Status:** [Implemented / Planned]
- **Results:** [Number of labels corrected, impact on fairness metrics]

**Mitigation: Feature Engineering to Remove Proxy Variables**
- **Issue:** [Features correlate with protected attributes]
- **Approach:** [Remove / Transform / Decorrelate features]
- **Features Affected:**
  - [Feature 1: Correlated with Gender]
  - [Feature 2: Proxy for Race]
- **Implementation Status:** [Implemented / Planned]
- **Impact on Model:** [Accuracy change, fairness metric change]

### 5.2 Algorithm-Level Mitigations

*[Instructions: Document model modifications to improve fairness.]*

#### 5.2.1 Fair Learning Algorithms

**Mitigation: Fairness Constraint in Training**
- **Bias Type Addressed:** [Disparate impact / Disparate treatment]
- **Approach:** [Add fairness term to loss function / Post-processing fairness constraints / Pre-processing + standard training]
- **Constraint Type:** [Demographic parity / Equalized odds / Predictive parity / Other]
- **Implementation Details:**
  - [Fairness term weight: λ = [value]]
  - [Target fairness metric: [Metric with target value]]
  - [Trade-off: Fairness vs. accuracy]
- **Implementation Status:** [Implemented / Planned]
- **Effectiveness:**
  - [Fairness metric improvement: From X to Y]
  - [Accuracy impact: [X%] loss in overall accuracy]
  - [Performance impact by group: [Changes for each group]]
- **Residual Bias:** [Remaining disparity]

**Mitigation: Balanced Error Rates (Equalized Odds)**
- **Description:** Constrain model to have equal False Positive Rate and True Positive Rate across groups
- **Mathematical Formulation:** [FPR(Group A) ≈ FPR(Group B), TPR(Group A) ≈ TPR(Group B)]
- **Implementation:** [Method used to enforce constraint]
- **Results:** [Effectiveness in achieving goal]

#### 5.2.2 Model Architecture Changes

**Mitigation: Fairness-Aware Model Architecture**
- **Change:** [Modified model architecture to improve fairness]
- **Rationale:** [How does architectural change help fairness?]
- **Implementation Status:** [Implemented / Planned]
- **Performance Impact:** [Accuracy, latency, other metrics]

#### 5.2.3 Ensemble & Debiasing Methods

**Mitigation: Ensemble of Fair Models**
- **Description:** Train multiple models with different fairness constraints, combine predictions
- **Benefit:** Diverse perspectives on fairness-accuracy trade-off
- **Implementation Status:** [Implemented / Planned]
- **Computational Cost:** [Inference time increase]

### 5.3 Post-Processing Mitigations

*[Instructions: Document modifications to model outputs to improve fairness after training.]*

#### 5.3.1 Threshold Optimization

**Mitigation: Group-Specific Decision Thresholds**
- **Description:** Use different classification thresholds for different groups
- **Rationale:** [Allows equalizing error rates across groups]
- **Implementation Details:**
  - [Group A threshold: 0.5]
  - [Group B threshold: 0.45]
  - [Justification for different thresholds]
- **Fairness Metric Achieved:** [Which fairness metric does this optimize?]
- **Trade-off:** [Predictive parity may worsen, FPR more equal, etc.]
- **Implementation Status:** [Implemented / Planned]
- **Regulatory Compliance:** [Is this legally permissible in jurisdiction?]

#### 5.3.2 Output Adjustment

**Mitigation: Prediction Adjustment to Equalize Odds**
- **Description:** Adjust predicted probabilities post-training
- **Method:** [Platt scaling / Matrix calibration / Other]
- **Implementation Status:** [Implemented / Planned]
- **Effectiveness:** [Fairness metric improvement]

### 5.4 Mitigation Effectiveness Summary

| Mitigation ID | Bias Type | Implementation Status | Fairness Metric Improvement | Accuracy Impact | Residual Bias | Recommendation |
|---|---|---|---|---|---|---|
| M-001 | [Bias type] | [Status] | [Metric improved from X to Y] | [+/- X%] | [Remaining disparity] | [Continue / Modify / Retire] |

---

## 6. Ongoing Monitoring Plan

*[Instructions: Define how bias will be monitored after deployment to detect bias drift or new issues.]*

### 6.1 Bias Monitoring Strategy

**Monitoring Objectives:**
- [Objective 1: Detect performance drift by protected group]
- [Objective 2: Monitor fairness metrics over time]
- [Objective 3: Identify new biases emerging in deployment]
- [Objective 4: Track effectiveness of mitigations]

**Monitoring Frequency:**
- [Real-time / Daily / Weekly / Monthly / Quarterly monitoring]
- [Deeper quarterly analysis / Annual full bias assessment]

### 6.2 Monitoring Metrics & Data Collection

#### 6.2.1 Production Performance Metrics by Group

| Metric | Group A | Group B | Group C | Alert Threshold | Monitoring Frequency |
|--------|---------|---------|---------|-----------------|----------------------|
| Accuracy | [Baseline %] | [Baseline %] | [Baseline %] | [Deviation > X%] | [Frequency] |
| Precision | [Baseline %] | [Baseline %] | [Baseline %] | [Deviation > X%] | [Frequency] |
| Recall | [Baseline %] | [Baseline %] | [Baseline %] | [Deviation > X%] | [Frequency] |
| Positive Rate | [Baseline %] | [Baseline %] | [Baseline %] | [Deviation > X%] | [Frequency] |

#### 6.2.2 Fairness Metrics Monitoring

| Fairness Metric | Baseline | Alert Threshold | Monitoring Frequency | Action if Threshold Exceeded |
|---|---|---|---|---|
| Demographic Parity | [Baseline value] | [Threshold] | [Frequency] | [Review model, investigate cause, plan remediation] |
| Equalized Odds | [Baseline value] | [Threshold] | [Frequency] | [Review model, investigate cause, plan remediation] |
| Predictive Parity | [Baseline value] | [Threshold] | [Frequency] | [Review model, investigate cause, plan remediation] |

#### 6.2.3 Data Collection for Monitoring

**Data to Collect:**
- [Protected attributes for all users/subjects]
- [Model predictions and actual outcomes]
- [User feedback on model predictions]
- [Demographic information of users]

**Data Retention & Privacy:**
- [How long monitoring data is retained]
- [Privacy protections for demographic data]
- [Access controls on sensitive monitoring data]
- [Aggregation level for reporting (avoid individual-level tracking)]

### 6.3 Bias Drift Detection

**Monitoring Method:** [Automated alerts / Manual review / Combination]

**Trigger Conditions:**
- [Trigger 1: Performance for Group X drops by >X%]
- [Trigger 2: Fairness metric breaches threshold]
- [Trigger 3: Positive prediction rate changes by >X% for any group]
- [Trigger 4: User complaints about bias reach threshold]

**Alert Response Process:**
1. [Alert generated and assigned to bias monitoring team]
2. [Initial investigation: Is change real or statistical artifact?]
3. [Root cause analysis: Why did bias metrics change?]
4. [Mitigation planning: What action to take?]
5. [Implementation & monitoring: Track remediation]

### 6.4 User Feedback Integration

**Feedback Mechanism:**
- [How users report bias/fairness concerns]
- [Feedback collection: Form / Email / Chat / Other]

**Feedback Analysis:**
- [Categorization of feedback by type]
- [Aggregation to identify patterns]
- [Incorporation into bias monitoring]

**Response Process:**
- [Acknowledgment to user]
- [Investigation of concern]
- [Communication of findings]
- [System improvement if warranted]

### 6.5 Periodic Reassessment

**Reassessment Schedule:**
- [Annual full bias assessment (at minimum)]
- [Quarterly bias trend analysis]
- [Major version release: Full assessment]
- [Triggered reassessment: When bias alerts exceed threshold]

**Reassessment Scope:**
- [Update with latest production data]
- [Recalculate fairness metrics]
- [Investigate any changes in fairness]
- [Update mitigation strategies as needed]

---

## 7. Limitations of Assessment

*[Instructions: Document limitations and assumptions of this bias assessment.]*

### 7.1 Assessment Scope Limitations

**Limitation 1: Protected Attributes**
- **Limitation:** [Only assessed for [Attributes assessed]. Did not assess for [Attributes not assessed]]
- **Reason:** [Limited data availability / Not legally protected attributes in jurisdiction / Out of scope for use case / Other]
- **Risk:** [Biases in non-assessed attributes may exist undetected]

**Limitation 2: Data Limitations**
- **Limitation:** [Training data from [Region/Time period/Source]. May not represent [Other populations]]
- **Impact:** [Findings may not generalize to other populations/contexts]

### 7.2 Assessment Methodology Limitations

**Limitation 1: Fairness Metric Selection**
- **Limitation:** [Selected fairness metrics may not be optimal for this use case]
- **Rationale:** [Trade-offs between fairness metrics; impossible to optimize all simultaneously]
- **Risk:** [Optimizing for selected metrics may not prevent all harmful biases]

**Limitation 2: Data Bias vs. Algorithmic Bias**
- **Limitation:** [This assessment focused more on data bias / algorithmic bias / Both equally]
- **Gap:** [Limited analysis of [other component]]

### 7.3 Assumptions

- [Assumption 1: [e.g., "Protected attributes accurately captured in data"]]
- [Assumption 2: [e.g., "Labels are accurate ground truth"]]
- [Assumption 3: [e.g., "Deployment context similar to training context"]]

### 7.4 Known Unknowns

**Unknown 1: True Causality**
- **Issue:** [This assessment correlations but limited ability to establish causality]
- **Impact:** [Root causes of observed biases may not be fully understood]

**Unknown 2: Long-term Impacts**
- **Issue:** [Cannot predict all long-term societal impacts of system deployment]
- **Risk:** [Unforeseen harms may emerge post-deployment]

### 7.5 Recommendations for Addressing Limitations

- [Recommendation 1: Expand assessment to cover additional protected attributes in future]
- [Recommendation 2: Conduct user studies to validate fairness metrics appropriateness]
- [Recommendation 3: Implement strong monitoring to catch post-deployment issues]
- [Recommendation 4: Plan for regular reassessment as deployment context evolves]

---

## 8. Approvals & Sign-Off

| Role | Name | Title | Signature | Date | Notes |
|------|------|-------|-----------|------|-------|
| Assessor | [Name] | [Title] | [Signature] | [Date] | [Notes] |
| Reviewed By | [Name] | [Title] | [Signature] | [Date] | [Notes] |
| Approved By | [Name] | Chief AI Officer/Ethics Lead | [Signature] | [Date] | [Notes] |
| Business Owner | [Name] | [Title] | [Signature] | [Date] | [Notes] |

---

## 9. Revision History

| Version | Date | Assessor | Changes | Status |
|---------|------|----------|---------|--------|
| 1.0 | [YYYY-MM-DD] | [Name/Agent] | Initial bias assessment | Approved |

---

## Appendices

### Appendix A: Fairness Metrics Definitions
[Link to technical definitions of fairness metrics used]

### Appendix B: Data Visualizations
- [Chart 1: Group representation in training data]
- [Chart 2: Model performance by protected attribute]
- [Chart 3: Fairness metric trends over time]

### Appendix C: Statistical Tests
[Documentation of statistical tests conducted to assess significance of observed disparities]

### Appendix D: Case Examples
[Specific examples of model behavior by protected group—with PII removed]

### Appendix E: Literature References
[Academic citations on bias, fairness, and algorithmic discrimination]

### Appendix F: Glossary

- **Bias:** [Definition for this assessment]
- **Fairness:** [Definition for this assessment]
- **Disparate Impact:** [Definition]
- **Protected Attribute:** [Definition]
- **Equalized Odds:** [Definition]
- **Demographic Parity:** [Definition]

---

**Document Classification:** [Internal/Confidential/Restricted]

**For Questions or Updates:** Contact [Bias Assessment Owner] at [Contact Information]

**Next Assessment Date:** [YYYY-MM-DD]

**Last Review Date:** [YYYY-MM-DD]

# Churn Risk Scoring Logic

---

## Why Rule-Based Risk Scoring?

This project uses a **rule-based churn risk model** instead of machine learning to ensure:
- Full transparency
- Business interpretability
- Clear linkage between customer behavior and churn risk

This approach mirrors how many organizations implement early-stage churn risk frameworks before introducing predictive models.

---

## Risk Factors Used

The churn risk score is calculated using the following drivers:

### 1. Contract Type
- Month-to-month contracts are strongly associated with higher churn
- Assigned the highest risk weight

### 2. Customer Tenure
- Customers with tenure less than 12 months are more likely to churn
- Early lifecycle churn is common in telecom industries

### 3. Monthly Charges
- Customers with above-average monthly charges are more sensitive to price changes
- Higher bills increase churn likelihood

### 4. Service Engagement
- Customers subscribed to fewer services show lower engagement
- Low engagement correlates with higher churn risk

---

## Risk Scoring Framework

Each customer receives points based on the above factors.
The total score determines their churn risk category:

| Risk Category | Description |
|--------------|------------|
| Low Risk | Stable customers with strong retention indicators |
| Medium Risk | Customers showing early warning signs |
| High Risk | Customers with multiple churn risk drivers |

---

## Purpose of Segmentation

Risk segmentation enables:
- Targeted retention strategies
- Efficient allocation of retention budgets
- Prioritization of high-risk, high-value customers

This risk framework is designed to support **actionable business decisions**, not just prediction.

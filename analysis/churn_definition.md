# Churn Definition & Measurement Logic

---

## What is Churn in this Project?

In this analysis, **customer churn** is defined as customers who have explicitly discontinued their telecom service, as indicated by the `churn = 'Yes'` flag in the dataset.

This represents **voluntary churn**, where customers choose to leave rather than being removed due to administrative or technical reasons.

---

## Customer Churn vs Revenue Churn

Two different churn perspectives are used:

### 1. Customer Churn
- Measures **how many customers** leave
- Calculated as:
  
  churned customers / total customers

This metric shows **behavioral churn** but does not reflect financial impact.

---

### 2. Revenue Churn
- Measures **how much revenue** is lost due to churn
- Calculated using monthly charges of churned customers

This distinction is important because:
- Losing fewer customers can still cause large revenue loss
- High-value customers disproportionately impact business performance

In this dataset, **revenue churn exceeds customer churn**, highlighting the importance of value-weighted churn analysis.

---

## Why Revenue-Weighted Churn Matters

Focusing only on customer counts can lead to misleading conclusions.
By incorporating revenue churn:
- Retention strategies can prioritize **high-value customers**
- Business decisions become financially driven rather than volume-driven

This project intentionally emphasizes **revenue impact** alongside customer churn.

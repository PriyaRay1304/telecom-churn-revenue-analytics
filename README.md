#Telecom Churn & Revenue Risk Analytics
---
***Customer churn, revenue impact, and risk segmentation***

---

##Problem Statement
Telecom companies face significant revenue loss due to customer churn, especially when **high-value customers leave early** in their lifecycle.  
This project analyzes customer churn patterns, quantifies **revenue impact**, and segments customers into **churn risk categories** to help prioritize retention efforts.

---

##Dataset Overview
- **Source:** IBM Telco Customer Churn Dataset  
- **Records:** ~7,000 customers  
- **Key Attributes:**
  - Contract type
  - Tenure
  - Monthly & total charges
  - Service subscriptions
  - Churn status

---

##Tools & Technologies
- **PostgreSQL** – Data cleaning, feature engineering, analytics
- **SQL** – Aggregations, conditional logic, churn & revenue analysis
- **Power BI** – Interactive dashboard & business storytelling

---

##Data Preparation & Modeling
- Built a **raw → processed** data pipeline in PostgreSQL
- Cleaned and standardized billing fields (`total_charges`)
- Engineered analytical features:
  - Tenure buckets
  - Service count
- Designed a **rule-based churn risk model**:
  - Low Risk
  - Medium Risk
  - High Risk

---

##Key Analysis Performed
- Overall **customer churn rate**
- **Revenue churn** vs customer churn comparison
- Churn analysis by:
  - Contract type
  - Tenure bucket
- Revenue at risk by:
  - Tenure
  - Churn risk category

---

##Key Insights
- **Month-to-month contracts** show the highest churn rate (~43%)
- **Early-tenure customers (0–1 year)** contribute the most to revenue churn
- **Revenue churn (~30%) exceeds customer churn (~26%)**, highlighting value-weighted risk
- **High-risk customers**, though fewer in number, drive a disproportionate share of revenue at risk

---

##Dashboard Preview

###Full Dashboard Overview  
[View Screenshot](powerbi/dashboard_screenshot/dashboard.png)

---

##Business Impact
This analysis enables telecom decision-makers to:
- Identify **where churn is happening**
- Understand **when churn hurts revenue the most**
- Prioritize **high-risk, high-value customers** for targeted retention strategies  
Ultimately, this approach supports more effective contract, pricing, and onboarding interventions.



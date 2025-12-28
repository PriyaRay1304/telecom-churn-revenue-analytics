-- 03_revenue_at_risk.sql
-- Purpose: Quantify revenue impact of churn and identify high-value churn risk

-- -Revenue at risk (monthly)
SELECT
    ROUND(SUM(monthly_charges), 2) AS total_monthly_revenue,
    ROUND(
        SUM(monthly_charges) FILTER (WHERE churn = 'Yes'),
        2
    ) AS current_churned_revenue,
    ROUND(
        SUM(monthly_charges) FILTER (WHERE churn = 'No'),
        2
    ) AS retained_revenue
FROM processed.telco_churn_clean;


-- -Identify high-value customers
SELECT
    percentile_cont(0.75) WITHIN GROUP (ORDER BY monthly_charges) AS high_value_threshold
FROM processed.telco_churn_clean;
-- This gives -
-- The 75th percentile of monthly charges
-- Anyone above this is high-value


-- -High-value customers who churned
SELECT
    COUNT(*) AS high_value_churned_customers,
    ROUND(SUM(monthly_charges), 2) AS high_value_churned_revenue
FROM processed.telco_churn_clean
WHERE churn = 'Yes'
  AND monthly_charges >= (
      SELECT percentile_cont(0.75)
      WITHIN GROUP (ORDER BY monthly_charges)
      FROM processed.telco_churn_clean
  );


-- -Revenue at risk by contract type
SELECT
    contract,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        SUM(monthly_charges) FILTER (WHERE churn = 'Yes'),
        2
    ) AS churned_monthly_revenue
FROM processed.telco_churn_clean
GROUP BY contract
ORDER BY churned_monthly_revenue DESC;


-- -Revenue at risk by tenure bucket
SELECT
    tenure_bucket,
    ROUND(
        SUM(monthly_charges) FILTER (WHERE churn = 'Yes'),
        2
    ) AS churned_monthly_revenue
FROM processed.telco_churn_clean
GROUP BY tenure_bucket
ORDER BY churned_monthly_revenue DESC;



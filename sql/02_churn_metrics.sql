-- 02_churn_metrics.sql
-- Purpose: Calculate core churn KPIs for telecom customers
-- Metrics include:


-- - Overall churn rate
SELECT
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percent
FROM processed.telco_churn_clean;


-- - Churn by contract type
SELECT
    contract,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percent
FROM processed.telco_churn_clean
GROUP BY contract
ORDER BY churn_rate_percent DESC;


-- - Churn by tenure bucket
SELECT
    tenure_bucket,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percent
FROM processed.telco_churn_clean
GROUP BY tenure_bucket
ORDER BY tenure_bucket;


-- - Revenue churn
SELECT
    ROUND(SUM(monthly_charges), 2) AS total_monthly_revenue,
    ROUND(
        SUM(monthly_charges) FILTER (WHERE churn = 'Yes'),
        2
    ) AS churned_monthly_revenue,
    ROUND(
        SUM(monthly_charges) FILTER (WHERE churn = 'Yes')
        * 100.0 / SUM(monthly_charges),
        2
    ) AS revenue_churn_percent
FROM processed.telco_churn_clean;


-- -Churn by tenure + revenue impact
SELECT
    tenure_bucket,
    COUNT(*) AS churned_customers,
    ROUND(SUM(monthly_charges), 2) AS churned_monthly_revenue
FROM processed.telco_churn_clean
WHERE churn = 'Yes'
GROUP BY tenure_bucket
ORDER BY churned_monthly_revenue DESC;


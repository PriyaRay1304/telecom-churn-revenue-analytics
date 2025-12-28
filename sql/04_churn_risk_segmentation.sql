-- 04_churn_risk_segmentation.sql
-- Purpose: Segment customers into churn risk levels
-- Risk logic based on:
-- - Contract type
-- - Tenure
-- - Monthly charges
-- - Service engagement


CREATE OR REPLACE VIEW processed.telco_churn_risk AS
SELECT
    *,
    
    /* ---- Risk Score Calculation ---- */
    (
        CASE WHEN contract = 'Month-to-month' THEN 3 ELSE 0 END +
        CASE WHEN tenure < 12 THEN 2 ELSE 0 END +
        CASE 
            WHEN monthly_charges >
                (SELECT AVG(monthly_charges) FROM processed.telco_churn_clean)
            THEN 2 ELSE 0
        END +
        CASE WHEN service_count <= 2 THEN 1 ELSE 0 END
    ) AS churn_risk_score,

    /* ---- Risk Category ---- */
    CASE
        WHEN
            (
                CASE WHEN contract = 'Month-to-month' THEN 3 ELSE 0 END +
                CASE WHEN tenure < 12 THEN 2 ELSE 0 END +
                CASE 
                    WHEN monthly_charges >
                        (SELECT AVG(monthly_charges) FROM processed.telco_churn_clean)
                    THEN 2 ELSE 0
                END +
                CASE WHEN service_count <= 2 THEN 1 ELSE 0 END
            ) >= 6 THEN 'High Risk'

        WHEN
            (
                CASE WHEN contract = 'Month-to-month' THEN 3 ELSE 0 END +
                CASE WHEN tenure < 12 THEN 2 ELSE 0 END +
                CASE 
                    WHEN monthly_charges >
                        (SELECT AVG(monthly_charges) FROM processed.telco_churn_clean)
                    THEN 2 ELSE 0
                END +
                CASE WHEN service_count <= 2 THEN 1 ELSE 0 END
            ) BETWEEN 3 AND 5 THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS churn_risk_category

FROM processed.telco_churn_clean;


-- Actual churn rate by risk group
SELECT
    churn_risk_category,
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS churned_customers,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percent
FROM processed.telco_churn_risk
GROUP BY churn_risk_category
ORDER BY churn_rate_percent DESC;


-- Revenue at risk by risk category
SELECT
    churn_risk_category,
    ROUND(SUM(monthly_charges), 2) AS total_monthly_revenue,
    ROUND(
        SUM(monthly_charges) FILTER (WHERE churn = 'Yes'),
        2
    ) AS churned_monthly_revenue
FROM processed.telco_churn_risk
GROUP BY churn_risk_category
ORDER BY churned_monthly_revenue DESC;




-- 01_data_cleaning.sql
-- Purpose: Clean raw telco churn data and create analytics-ready processed table
-- Includes:
-- - Cleaning total_charges
-- - Tenure bucketing
-- - Service count feature engineering


CREATE TABLE processed.telco_churn_clean AS
SELECT
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    tenure,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract,
    paperless_billing,
    payment_method,
    monthly_charges,

    CAST(NULLIF(TRIM(total_charges), '') AS NUMERIC(12,2)) AS total_charges,

    churn,

    CASE
        WHEN tenure < 12 THEN '0-1 year'
        WHEN tenure BETWEEN 12 AND 24 THEN '1-2 years'
        WHEN tenure BETWEEN 25 AND 48 THEN '2-4 years'
        ELSE '4+ years'
    END AS tenure_bucket,

    (
        (phone_service = 'Yes')::INT +
        (online_security = 'Yes')::INT +
        (online_backup = 'Yes')::INT +
        (device_protection = 'Yes')::INT +
        (tech_support = 'Yes')::INT +
        (streaming_tv = 'Yes')::INT +
        (streaming_movies = 'Yes')::INT
    ) AS service_count

FROM raw.telco_customer_churn;

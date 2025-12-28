CREATE SCHEMA raw;

CREATE TABLE raw.telco_customer_churn (
    customer_id        VARCHAR(50),
    gender             VARCHAR(10),
    senior_citizen     INT,
    partner            VARCHAR(5),
    dependents         VARCHAR(5),
    tenure             INT,
    phone_service      VARCHAR(5),
    multiple_lines     VARCHAR(50),
    internet_service   VARCHAR(50),
    online_security    VARCHAR(50),
    online_backup      VARCHAR(50),
    device_protection  VARCHAR(50),
    tech_support       VARCHAR(50),
    streaming_tv       VARCHAR(50),
    streaming_movies   VARCHAR(50),
    contract           VARCHAR(50),
    paperless_billing  VARCHAR(5),
    payment_method     VARCHAR(100),
    monthly_charges    NUMERIC(10,2),
    total_charges      NUMERIC(12,2),
    churn              VARCHAR(5)
);

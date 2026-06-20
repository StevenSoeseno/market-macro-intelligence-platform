CREATE OR REPLACE TABLE
market_macro_dw.macro_summary AS

SELECT
    indicator,
    MIN(date) AS first_date,
    MAX(date) AS last_date,
    AVG(value) AS avg_value,
    MIN(value) AS min_value,
    MAX(value) AS max_value
FROM market_macro_dw.macro_indicators
GROUP BY indicator;
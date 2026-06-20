CREATE OR REPLACE TABLE
market_macro_dw.latest_macro_snapshot AS
WITH ranked AS (
SELECT
    indicator,
    date,
    value,
    ROW_NUMBER() OVER (
        PARTITION BY indicator
        ORDER BY date DESC
    ) AS rn
FROM market_macro_dw.macro_indicators
)

SELECT
    indicator,
    date,
    value
FROM ranked
WHERE rn = 1;
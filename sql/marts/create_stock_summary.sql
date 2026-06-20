CREATE OR REPLACE TABLE
market_macro_dw.stock_summary AS

SELECT
    ticker,
    COUNT(*) AS trading_days,
    MIN(Date) AS first_date,
    MAX(Date) AS last_date,
    AVG(Close) AS avg_close,
    MIN(Close) AS min_close,
    MAX(Close) AS max_close,
    STDDEV(Close) AS volatility
FROM market_macro_dw.stock_prices
GROUP BY ticker;
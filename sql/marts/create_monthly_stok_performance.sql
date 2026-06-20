CREATE OR REPLACE TABLE
market_macro_dw.monthly_stock_performance AS

SELECT
    ticker,
    DATE_TRUNC(Date, MONTH) AS month,
    AVG(Close) AS avg_close,
    MIN(Close) AS min_close,
    MAX(Close) AS max_close,
    AVG(Volume) AS avg_volume
FROM market_macro_dw.stock_prices
GROUP BY
    ticker, month;
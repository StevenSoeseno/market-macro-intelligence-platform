SELECT
    ticker,
    MIN(Date) AS first_date,
    MAX(Date) AS last_date,
    COUNT(*) AS row_count
FROM market_macro_dw.stock_prices
GROUP BY ticker
ORDER BY ticker;
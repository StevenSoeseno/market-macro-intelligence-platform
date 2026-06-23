CREATE OR REPLACE TABLE market_macro_dw.analytics_stock_metrics AS

SELECT
    ticker,

    MAX(Close) AS all_time_high,
    MIN(Close) AS all_time_low,

    MAX(
        CASE
            WHEN DATE(Date) >= DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)
            THEN Close
        END
    ) AS high_52w,

    MIN(
        CASE
            WHEN DATE(Date) >= DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)
            THEN Close
        END
    ) AS low_52w,

    AVG(Close) AS avg_close,

    STDDEV(Close) AS volatility

FROM market_macro_dw.stock_prices

GROUP BY ticker;
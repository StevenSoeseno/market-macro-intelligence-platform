CREATE OR REPLACE TABLE market_macro_dw.analytics_daily_returns AS

SELECT
    Date,
    ticker,
    Close,

    ROUND(
        (
            Close
            - LAG(Close) OVER (
                PARTITION BY ticker
                ORDER BY Date
            )
        )
        /
        LAG(Close) OVER (
            PARTITION BY ticker
            ORDER BY Date
        )
        * 100,
        2
    ) AS daily_return_pct

FROM market_macro_dw.stock_prices

ORDER BY
    ticker,
    Date;
CREATE OR REPLACE TABLE market_macro_dw.analytics_stock_rsi AS

WITH price_changes AS (

    SELECT
        Date,
        ticker,
        Close,

        Close -
        LAG(Close) OVER (
            PARTITION BY ticker
            ORDER BY Date
        ) AS price_change

    FROM market_macro_dw.stock_prices

),

gains_losses AS (

    SELECT
        Date,
        ticker,
        Close,

        CASE
            WHEN price_change > 0 THEN price_change
            ELSE 0
        END AS gain,

        CASE
            WHEN price_change < 0 THEN ABS(price_change)
            ELSE 0
        END AS loss

    FROM price_changes

),

rolling_avg AS (

    SELECT
        Date,
        ticker,
        Close,

        AVG(gain) OVER (
            PARTITION BY ticker
            ORDER BY Date
            ROWS BETWEEN 13 PRECEDING AND CURRENT ROW
        ) AS avg_gain,

        AVG(loss) OVER (
            PARTITION BY ticker
            ORDER BY Date
            ROWS BETWEEN 13 PRECEDING AND CURRENT ROW
        ) AS avg_loss

    FROM gains_losses

)

SELECT
    Date,
    ticker,
    Close,

    ROUND(
        100 - (
            100 /
            (
                1 +
                SAFE_DIVIDE(avg_gain, avg_loss)
            )
        ),
        2
    ) AS rsi_14

FROM rolling_avg

ORDER BY ticker, Date;
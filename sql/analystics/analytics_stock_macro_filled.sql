CREATE OR REPLACE TABLE market_macro_dw.analytics_stock_macro_filled AS

WITH macro_pivot AS (

    SELECT
        date,

        MAX(CASE WHEN indicator = 'FEDFUNDS' THEN value END)
            AS fed_funds_rate,

        MAX(CASE WHEN indicator = 'UNRATE' THEN value END)
            AS unemployment_rate,

        MAX(CASE WHEN indicator = 'CPIAUCSL' THEN value END)
            AS cpi,

        MAX(CASE WHEN indicator = 'DGS10' THEN value END)
            AS treasury_10y

    FROM market_macro_dw.macro_indicators

    GROUP BY date
),

filled_macro AS (

    SELECT

        date,

        LAST_VALUE(fed_funds_rate IGNORE NULLS)
        OVER (
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) AS fed_funds_rate,

        LAST_VALUE(unemployment_rate IGNORE NULLS)
        OVER (
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) AS unemployment_rate,

        LAST_VALUE(cpi IGNORE NULLS)
        OVER (
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) AS cpi,

        LAST_VALUE(treasury_10y IGNORE NULLS)
        OVER (
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) AS treasury_10y

    FROM macro_pivot
)

SELECT

    s.Date,
    s.ticker,
    s.Close,

    f.fed_funds_rate,
    f.unemployment_rate,
    f.cpi,
    f.treasury_10y

FROM market_macro_dw.stock_prices s

LEFT JOIN filled_macro f
    ON s.Date = f.date

ORDER BY
    s.Date,
    s.ticker;
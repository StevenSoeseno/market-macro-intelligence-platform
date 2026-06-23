CREATE OR REPLACE TABLE market_macro_dw.analytics_stock_macro AS

WITH macro_pivot AS (

    SELECT
        date,

        MAX(CASE
            WHEN indicator = 'FEDFUNDS'
            THEN value
        END) AS fed_funds_rate,

        MAX(CASE
            WHEN indicator = 'UNRATE'
            THEN value
        END) AS unemployment_rate,

        MAX(CASE
            WHEN indicator = 'CPIAUCSL'
            THEN value
        END) AS cpi,

        MAX(CASE
            WHEN indicator = 'DGS10'
            THEN value
        END) AS treasury_10y

    FROM market_macro_dw.macro_indicators

    GROUP BY date
)

SELECT

    s.Date,
    s.ticker,
    s.Close,

    m.fed_funds_rate,
    m.unemployment_rate,
    m.cpi,
    m.treasury_10y

FROM market_macro_dw.stock_prices s

LEFT JOIN macro_pivot m
    ON s.Date = m.date

ORDER BY
    s.Date,
    s.ticker;
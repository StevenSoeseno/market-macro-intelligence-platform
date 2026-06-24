CREATE OR REPLACE TABLE market_macro_dw.analytics_stock_macro_rsi AS

SELECT
    a.*,
    r.rsi_14

FROM market_macro_dw.analytics_stock_macro_filled a

LEFT JOIN market_macro_dw.analytics_stock_rsi r
    ON a.Date = r.Date
    AND a.ticker = r.ticker;
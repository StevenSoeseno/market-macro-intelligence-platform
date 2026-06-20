import yfinance as yf
import pandas as pd
import os

TICKERS = [
    "NVDA",
    "AMD",
    "AVGO",
    "META",
    "BABA",
    "TSM"
]

all_data = []

for ticker in TICKERS:
    print(f"Downloading {ticker}...")

    df = yf.download(
        ticker,
        period="5y",
        auto_adjust=True,
        progress=False
    )

    if df.empty:
        print(f"WARNING: {ticker} returned no data")
        continue
    
    if isinstance(df.columns, pd.MultiIndex):
        df.columns = df.columns.get_level_values(0)

    df = df.reset_index()

    df["ticker"] = ticker

    all_data.append(df)

stocks_df = pd.concat(all_data)
expected_columns = [
    "Date",
    "Close",
    "High",
    "Low",
    "Open",
    "Volume",
    "ticker"
]

stocks_df = stocks_df[expected_columns]
stocks_df.columns.name = None

print(stocks_df.head())
print()
print(stocks_df.columns)
print(stocks_df.shape)
print("\nTicker Counts:")
print(stocks_df["ticker"].value_counts())

expected_tickers = set(TICKERS)

actual_tickers = set(
    stocks_df["ticker"].unique()
)

missing_tickers = (
    expected_tickers - actual_tickers
)

if missing_tickers:
    raise ValueError(
        f"Missing tickers: {missing_tickers}"
    )

output_path = "data/raw/stocks/stocks_raw.parquet"

stocks_df.to_parquet(
    output_path,
    index=False
)

print(f"Saved to {output_path}")
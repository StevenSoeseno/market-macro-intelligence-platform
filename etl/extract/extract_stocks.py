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

    if isinstance(df.columns, pd.MultiIndex):
        df.columns = df.columns.get_level_values(0)

    df = df.reset_index()

    df["ticker"] = ticker

    all_data.append(df)

stocks_df = pd.concat(all_data)
stocks_df.columns.name = None

print(stocks_df.head())
print()
print(stocks_df.shape)

output_path = "data/raw/stocks/stocks_raw.parquet"

stocks_df.to_parquet(
    output_path,
    index=False
)

print(f"Saved to {output_path}")
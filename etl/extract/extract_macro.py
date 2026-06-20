from fredapi import Fred
from dotenv import load_dotenv

import os
import pandas as pd

load_dotenv()

fred = Fred(
    api_key=os.getenv("FRED_API_KEY")
)

INDICATORS = {
    "FEDFUNDS": "Fed Funds Rate",
    "UNRATE": "Unemployment Rate",
    "CPIAUCSL": "Consumer Price Index",
    "DGS10": "10Y Treasury Yield"
}

all_data = []

for indicator in INDICATORS:
    print(f"Downloading {indicator}...")

    series = fred.get_series(indicator)

    df = series.reset_index()

    df.columns = [
        "date",
        "value"
    ]

    df["indicator"] = indicator

    all_data.append(df)

macro_df = pd.concat(all_data)

print(macro_df.head())
print()
print(macro_df.shape)

macro_df.to_parquet(
    "./data/raw/macro/macro_raw.parquet",
    index=False
)

print("Saved macro dataset")
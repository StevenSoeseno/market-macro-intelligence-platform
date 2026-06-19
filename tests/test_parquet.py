import pandas as pd

df = pd.read_parquet(
    "data/raw/stocks/stocks_raw.parquet"
)

print(df.head())
print()
print(df.shape)
print()
print(df.dtypes)
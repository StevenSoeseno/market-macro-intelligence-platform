from google.cloud import bigquery
import sys
from pathlib import Path
sys.path.append(
    str(Path(__file__).resolve().parents[2])
)
from config.settings import PROJECT_ID, DATASET_ID

PROJECT_ID = "market-macro-intelligence"
DATASET_ID = "market_macro_dw"
TABLE_ID = "stock_prices"

TABLE_REF = (
    f"{PROJECT_ID}.{DATASET_ID}.{TABLE_ID}"
)

client = bigquery.Client(
    project=PROJECT_ID
)

job_config = bigquery.LoadJobConfig(
    source_format=bigquery.SourceFormat.PARQUET,
    write_disposition="WRITE_TRUNCATE"
)

uri = (
    "gs://market-macro-intel-lake-steven/"
    "raw/stocks/stocks_raw.parquet"
)

load_job = client.load_table_from_uri(
    uri,
    TABLE_REF,
    job_config=job_config
)

load_job.result()

table = client.get_table(TABLE_REF)

print(
    f"Loaded {table.num_rows} rows "
    f"into {TABLE_REF}"
)
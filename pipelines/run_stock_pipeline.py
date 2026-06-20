import subprocess
import sys

print("Extracting stocks...")
subprocess.run(
    [sys.executable, "etl/extract/extract_stocks.py"],
    check=True
)

print("Uploading to GCS...")
subprocess.run(
    [sys.executable, "etl/load/upload_to_gcs.py"],
    check=True
)

print("Loading to BigQuery...")
subprocess.run(
    [sys.executable, "etl/load/load_to_bigquery.py"],
    check=True
)

print("Stock pipeline completed!")
from google.cloud import storage

BUCKET_NAME = "market-macro-intel-lake-steven"

LOCAL_FILE = "data/raw/macro/macro_raw.parquet"

GCS_PATH = "raw/macro/macro_raw.parquet"

client = storage.Client()

bucket = client.bucket(BUCKET_NAME)

blob = bucket.blob(GCS_PATH)

blob.upload_from_filename(LOCAL_FILE)

print(
    f"Uploaded to gs://{BUCKET_NAME}/{GCS_PATH}"
)
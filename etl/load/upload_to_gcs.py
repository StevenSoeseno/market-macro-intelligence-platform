from google.cloud import storage

BUCKET_NAME = "market-macro-intel-lake-steven"

LOCAL_FILE = "data/raw/stocks/stocks_raw.parquet"

GCS_PATH = "raw/stocks/stocks_raw.parquet"


def upload_file():
    client = storage.Client()

    bucket = client.bucket(BUCKET_NAME)

    blob = bucket.blob(GCS_PATH)

    blob.upload_from_filename(LOCAL_FILE)

    print(f"Uploaded {LOCAL_FILE}")
    print(f"GCS Path: gs://{BUCKET_NAME}/{GCS_PATH}")


if __name__ == "__main__":
    upload_file()
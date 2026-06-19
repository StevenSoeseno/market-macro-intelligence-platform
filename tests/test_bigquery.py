from google.cloud import bigquery

client = bigquery.Client()

print("Datasets:")

for dataset in client.list_datasets():
    print(dataset.dataset_id)
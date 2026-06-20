from datetime import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG(
    dag_id="stock_pipeline",
    start_date=datetime(2025, 1, 1),
    schedule=None,
    catchup=False,
    tags=["market-macro"],
) as dag:

    run_stock_pipeline = BashOperator(
        task_id="run_stock_pipeline",
        bash_command="""
        cd /opt/airflow/project &&
        python pipelines/run_stock_pipeline.py
        """
    )
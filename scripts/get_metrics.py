import psycopg2
import pandas as pd
import matplotlib.pyplot as plt

AWS_REGION = "us-east-1"
REDSHIFT_DATABASE = "dev"
REDSHIFT_PORT = 5439
REDSHIFT_USER = "admin"
REDSHIFT_PASSWORD = "Postgres1"
REDSHIFT_ENDPOINT = "tpcds-sf100-preview-workgroup.941474060611.us-east-1.redshift-serverless.amazonaws.com"

conn = psycopg2.connect(
    dbname=REDSHIFT_DATABASE,
    user=REDSHIFT_USER,
    password=REDSHIFT_PASSWORD,
    port=REDSHIFT_PORT,
    host=REDSHIFT_ENDPOINT
)

tables = ['sys_query_history', 'sys_query_text', 'sys_query_detail']

for table in tables:
    query = f"""
    SELECT *
    FROM {table}
    WHERE start_time >= GETDATE() - INTERVAL '1 hour'
    """

    df = pd.read_sql_query(query, conn)

    df.to_pickle(f'../metrics/{table}.pkl')
import psycopg2
import pandas as pd
import argparse
from datetime import datetime, timedelta
import os

parser = argparse.ArgumentParser()
parser.add_argument("--logfile", type=str, default="us-east-1")
args = parser.parse_args()

# Open the logfile and read the first and last rows only
with open(args.logfile, "rb") as f:
    first_line = f.readline().decode()
    f.seek(-2, os.SEEK_END)
    while f.read(1) != b"\n":
        f.seek(-2, os.SEEK_CUR)
    last_line = f.readline().decode()

# Determine period for which stats should be retrieved.
begin_timestamp = (
    datetime.strptime(" ".join(first_line.strip().split()[:2]), "%Y-%m-%d %H:%M:%S.%f")
    - timedelta(minutes=1)
).strftime("%Y-%m-%d %H:%M:%S.%f")
end_timestamp = (
    datetime.strptime(" ".join(last_line.strip().split()[:2]), "%Y-%m-%d %H:%M:%S.%f")
    + timedelta(minutes=1)
).strftime("%Y-%m-%d %H:%M:%S.%f")

print(f"Begin timestamp: {begin_timestamp}")
print(f"End timestamp: {end_timestamp}")


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
    host=REDSHIFT_ENDPOINT,
)

tables = ["sys_query_history", "sys_query_text", "sys_query_detail"]

logfile_timestamp = args.logfile.split("/")[-1][:-14]

for table in tables:
    query = f"""
    SELECT *
    FROM {table}
    WHERE start_time >= '{begin_timestamp}'
    AND start_time <= '{end_timestamp}'
    """

    df = pd.read_sql_query(query, conn)

    df.to_pickle(f"../metrics/{logfile_timestamp}-{table}.pkl")

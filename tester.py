import os
import psycopg2
from datetime import datetime

# AWS credentials and Redshift details
AWS_REGION = "us-east-1"
REDSHIFT_DATABASE = "dev"
REDSHIFT_PORT = 5439
REDSHIFT_USER = "admin"
REDSHIFT_PASSWORD = "Postgres1"
REDSHIFT_ENDPOINT = "tpcds-sf100-preview-workgroup.941474060611.us-east-1.redshift-serverless.amazonaws.com"

# Directory containing SQL files
SQL_FILES_DIR = "."

# Initialize counters
success_count = 0
failure_count = 0


# Function to execute a query on Redshift
def execute_query(query, query_id):
    f.write(f"{datetime.now()} Executing query {query_id}")
    print(f"{datetime.now()} Executing query {query_id}")
    try:
        conn = psycopg2.connect(
            dbname=REDSHIFT_DATABASE,
            user=REDSHIFT_USER,
            password=REDSHIFT_PASSWORD,
            host=REDSHIFT_ENDPOINT,
            port=REDSHIFT_PORT
        )
        cur = conn.cursor()
        start_time = datetime.now()
        cur.execute(query)
        duration = (datetime.now() - start_time).total_seconds()
        conn.commit()
        cur.close()
        conn.close()
        f.write(f"\t{datetime.now()} Executed query {query_id} in {duration} seconds\n")
        print(f"\t{datetime.now()} Executed query {query_id} in {duration} seconds")
        return True
    except Exception as e:
        f.write(f"\t{e}\n")
        print(f"\t{e}")
        f.write(f"\t{datetime.now()} Failed to execute query {query_id}\n")
        print(f"\t{datetime.now()} Failed to execute query {query_id}")
        return False


# Log file for query results
LOG_FILE = f"./{datetime.now()}-execution.log"
with open(LOG_FILE, "w+") as f:

    # Read and execute each SQL file
    for filename in os.listdir(SQL_FILES_DIR):
        if ".sql" in filename:
            query_id = filename[5:8]
            filepath = os.path.join(SQL_FILES_DIR, filename)
            with open(filepath, "r") as file:
                query = file.read()
                if execute_query(query, query_id):
                    success_count += 1
                else:
                    failure_count += 1

    print(f"Successfully executed queries: {success_count}")
    print(f"Failed queries: {failure_count}")

import os
import psycopg2
from datetime import datetime, timezone
from tqdm.auto import tqdm

# AWS credentials and Redshift details
AWS_REGION = "us-east-1"
REDSHIFT_DATABASE = "dev"
REDSHIFT_PORT = 5439
REDSHIFT_USER = "admin"
REDSHIFT_PASSWORD = "Postgres1"
REDSHIFT_ENDPOINT = "tpcds-sf100-preview-workgroup.941474060611.us-east-1.redshift-serverless.amazonaws.com"

# Directory containing SQL files
SQL_FILES_DIR = "../../tpc-ds-generator/queries/1720042186/redshift"
QUERIES_PER_TEMPLATE = 10

# Initialize counters
success_count = 0
failure_count = 0


# Function to execute a query on Redshift
def execute_query(query, query_id):
    f.write(f"{datetime.now(tz=timezone.utc)} Executing query {query_id}\n")
    try:
        conn = psycopg2.connect(
            dbname=REDSHIFT_DATABASE,
            user=REDSHIFT_USER,
            password=REDSHIFT_PASSWORD,
            host=REDSHIFT_ENDPOINT,
            port=REDSHIFT_PORT
        )
        cur = conn.cursor()
        start_time = datetime.now(tz=timezone.utc)
        cur.execute(query)
        duration = (datetime.now(tz=timezone.utc) - start_time).total_seconds()
        conn.commit()
        cur.close()
        conn.close()
        f.write(f"\t{datetime.now(tz=timezone.utc)} Executed query {query_id} in {duration} seconds\n")
        f.flush()
        return True
    except Exception as e:
        f.write(f"\t{e}\n")
        f.write(f"\t{datetime.now(tz=timezone.utc)} Failed to execute query {query_id}\n")
        f.flush()
        return False


# Log file for query results
LOG_FILE = f"../execution-logs/{datetime.now(tz=timezone.utc)}-execution.log"
with open(LOG_FILE, "w+") as f:

    # List all directories in the SQL files directory, in sorted order
    query_directories = os.listdir(SQL_FILES_DIR)
    query_directories.sort()

    # Calculate total number of queries to be executed and initialize a tqdm bar
    total_queries = len(query_directories) * QUERIES_PER_TEMPLATE
    pbar = tqdm(total=total_queries)

    for i, query_directory in enumerate(query_directories):

        # List all files in the directory, in sorted order, and filter to only the first 
        # QUERIES_PER_TEMPLATE files
        query_files = os.listdir(os.path.join(SQL_FILES_DIR, query_directory))
        query_files.sort()
        query_files = query_files[:QUERIES_PER_TEMPLATE]
        lack = QUERIES_PER_TEMPLATE - len(query_files)
        pbar.update(lack)

        for query_file in query_files:
            # Extract the query ID and read the query from the file
            query_id = query_file[5:-4]
            filepath = os.path.join(SQL_FILES_DIR, query_directory, query_file)
            with open(filepath, "r") as file:
                query = file.read()
                if execute_query(query, query_id):
                    success_count += 1
                else:
                    failure_count += 1
            pbar.update(1)

      

    print(f"Successfully executed queries: {success_count}")
    print(f"Failed queries: {failure_count}")

import pandas as pd
import argparse
import os
from query_rep import QueryRep


QUERIES_PATH = '../../tpc-ds-generator/queries/1720042186/redshift'

def open_file_and_read_query(query_instance: str):
    query_template = query_instance.split('_')[0]
    path = os.path.join(QUERIES_PATH, f"query{query_template}", f"query{query_instance}.sql")

    with open(path, 'r') as f:
        return f.read().strip()

parser = argparse.ArgumentParser()
parser.add_argument("--logfile", type=str, required=True)
args = parser.parse_args()

logfile_timestamp = args.logfile.split("/")[-1][:-14]

# Find the ids of queries in the actual workload
df = pd.read_pickle(f"../metrics/{logfile_timestamp}-sys_query_history.pkl")
good_ids = list(
    df[df["query_text"].str.startswith("-- Filename: query")]["query_id"].unique()
)
df = df[df["query_id"].isin(good_ids)]
df.reset_index(drop=True, inplace=True)

# Extract query features
df['query_template'] = df['query_text'].str[18:21] # Extract the template number out of the query text
df['query_instance'] = df['query_text'].str[18:25] # Extract the query instance number out of the query text
df['query_text'] = df['query_instance'].apply(open_file_and_read_query)
df['query_rep'] = df['query_text'].apply(QueryRep)
df['num_tables'] = df['query_rep'].apply(lambda x: x.num_tables())
df['num_columns'] = df['query_rep'].apply(lambda x: x.num_columns())
df['num_joins'] = df['query_rep'].apply(lambda x: x.num_joins())
df.drop('query_rep', axis=1, inplace=True)

# Drop constant columns and identifier columns
constant_columns = df.columns[df.nunique() == 1]
print(f"Removing constant columns: {constant_columns}")
df = df.drop(constant_columns, axis=1)
identifer_columns = df.columns[(df.nunique() == df.shape[0]) | df.columns.str.endswith('_id')]
print(f"Removing identifier columns: {identifer_columns}")
df = df.drop(identifer_columns, axis=1)

# One-hot encode categorical columns and drop the original columns
#categorical_columns = list(df.columns[df.dtypes == "object"])
#for c in categorical_columns:
    #df = pd.concat([df, pd.get_dummies(df[c], prefix=c)], axis=1)
#df = df.drop(categorical_columns, axis=1)

# Convert datetime and boolean columns to int64
datetime_or_bool_columns = list(df.columns[df.dtypes == "bool"]) + list(
    df.columns[df.dtypes == "datetime64[ns]"]
)
for c in datetime_or_bool_columns:
    df[c] = df[c].astype("int64")

# Write to pickle file
df.to_pickle(f"../metrics/{logfile_timestamp}-sys_query_history_preprocessed.pkl")

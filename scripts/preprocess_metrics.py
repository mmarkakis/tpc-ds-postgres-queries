import pandas as pd
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--logfile", type=str, default="us-east-1")
args = parser.parse_args()

logfile_timestamp = args.logfile.split("/")[-1][:-14]


def cast(df, good_ids):
    df = df[df["query_id"].isin(good_ids)]

    # Drop constant columns
    constant_columns = df.columns[df.nunique() == 1]
    #df = df.drop(constant_columns, axis=1)

    # One-hot encode categorical columns and drop the original columns
    categorical_columns = list(df.columns[df.dtypes == "object"])
    for c in categorical_columns:
        continue
        #df = pd.concat([df, pd.get_dummies(df[c], prefix=c)], axis=1)
    #df = df.drop(categorical_columns, axis=1)

    # Convert datetime and boolean columns to int64
    datetime_or_bool_columns = list(df.columns[df.dtypes == "bool"]) + list(
        df.columns[df.dtypes == "datetime64[ns]"]
    )
    for c in datetime_or_bool_columns:
        df[c] = df[c].astype("int64")

    return df


# Find the ids of queries in the actual workload
df = pd.read_pickle(f"../metrics/{logfile_timestamp}-sys_query_history.pkl")
good_ids = list(
    df[df["query_text"].str.startswith("-- Filename: query")]["query_id"].unique()
)


# Preprocess sys_query_history
df = cast(df, good_ids)  # Cast the non-integer columns to integer
df["template_number"] = (
    df["query_text"].str[18:21].astype("int64")
)  # Extract only the template number out of the query text
df.drop("query_text", axis=1, inplace=True)  # Drop the query text column

# Read and preprocess sys_query_detail
df2 = pd.read_pickle(f"../metrics/{logfile_timestamp}-sys_query_detail.pkl")
df2 = cast(df2, good_ids)

# Write both dataframes to pickle files
df.to_pickle(f"../metrics/{logfile_timestamp}-sys_query_history_preprocessed.pkl")
df2.to_pickle(f"../metrics/{logfile_timestamp}-sys_query_detail_preprocessed.pkl")

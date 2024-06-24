#!/bin/bash

# Specify the directory where your files are located
directory="/home/ubuntu/tpc-ds-queries-1"

# Loop through each file in the directory
for file in "$directory"/*; do
  # Check if the item is a file (not a directory)
  if [ -f "$file" ]; then
    # Get the filename without the path
    filename=$(basename "$file")

    echo "$file"

    # Create a temporary file with the SQL-style comment
    echo "-- Filename: $filename" > /tmp/tempfile
    # Append the contents of the original file to the temporary file
    cat "$file" >> /tmp/tempfile
    # Replace the original file with the temporary file
    mv /tmp/tempfile "$file"
  fi
done

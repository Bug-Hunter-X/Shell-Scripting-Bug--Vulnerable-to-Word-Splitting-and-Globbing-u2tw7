#!/bin/bash

# This script demonstrates the solution to the previous bug.

file_to_process="my_file.txt"

if [ ! -f "$file_to_process" ]; then
  echo "Error: File not found."
exit 1
fi

# Safe way to process the file word by word using read.
while IFS= read -r line; do
  for word in $line; do
    echo "Processing word: $word"
  done
done < "$file_to_process"

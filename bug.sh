#!/bin/bash

# This script attempts to process a file, but it's prone to an uncommon error.

file_to_process="my_file.txt"

if [ ! -f "$file_to_process" ]; then
  echo "Error: File not found."
exit 1
fi

# ... some code to process the file

# This line is the problematic one.  It relies on word splitting and glob expansion. 
# If my_file.txt contains spaces or special characters, it breaks.
for word in $(cat "$file_to_process"); do
  echo "Processing word: $word"
done

#!/bin/bash

# Get the current path
path="$1"

# Remove trailing slash if present
path="${path%/}"

# Split the path into components
IFS='/' read -ra dirs <<< "$path"

# Get the number of directories
num_dirs=${#dirs[@]}

# If we have at least two directories (not counting empty first element from leading slash)
if [ $num_dirs -gt 2 ]; then
  # Get the last two directories
  last_dir="${dirs[$num_dirs-1]}"
  second_last_dir="${dirs[$num_dirs-2]}"
  
  # Output the last two directories
  echo "$second_last_dir/$last_dir"
else
  # If we have fewer than two directories, just output the path
  echo "$path"
fi

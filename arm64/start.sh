#!/bin/bash

exclude_dirs=$(cat exclude_dirs)
include_dirs=$(find . -type d ! -name "*")

exclude_dirs=$(echo "${exclude_dirs[@]}" | sed 's/,/\\,/g') # escape commas to make them special characters in sed command
for dir in $(find . -type d ! -path "*/\(${exclude_dirs}\)/*" ! -name "*"); do
  echo "Running docker-compose up -d in $dir..."
  cd "$dir" && docker-compose -f . up -d
done
